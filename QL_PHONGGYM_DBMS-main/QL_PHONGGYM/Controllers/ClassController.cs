using QL_PHONGGYM.Models;
using QL_PHONGGYM.Repositories;
using System;
using System.Linq;
using System.Security.Policy;
using System.Web.Mvc;
using System.Collections.Generic;

namespace QL_PHONGGYM.Controllers
{
    public class ClassController : Controller
    {
        private readonly ProductRepository _productRepo;
        private readonly CartRepository _cartRepo;
        private readonly KhachHangRepository _khachhangRepo;

        public ClassController()
        {
            var db = new QL_PHONGGYMEntities();
            _productRepo = new ProductRepository(db);
            _cartRepo = new CartRepository(db);
            _khachhangRepo = new KhachHangRepository(db);
        }

        private bool KiemTraDangNhap()
        {
            if (Session["MaKH"] == null)
                return false;

            if (!int.TryParse(Session["MaKH"].ToString(), out int maKH))
                return false;

            var kh = _khachhangRepo.ThongTinKH(maKH);

            if (kh == null)
            {
                TempData["ErrorMessage"] = "Tài khoản không tồn tại";
                return false;
            }

            if (kh.TrangThaiTaiKhoan == 0)
            {
                Session["MaKH"] = null;
                TempData["ErrorMessage"] = "Tài khoản đã bị khóa. Vui lòng liên hệ hỗ trợ.";
                return false;
            }

            Session["KhachHang"] = kh;

            return true;
        }

        public ActionResult Index(string search = "", int? chuyenMonId = null, string filterType = "", int? page = 1)
        {
            int? maKH = null;
            if (Session["MaKH"] != null)
            {
                maKH = (int)Session["MaKH"];
            }

            ViewBag.ChuyenMons = _productRepo.GetChuyenMons();
            ViewBag.CurrentSearch = search;
            ViewBag.CurrentChuyenMon = chuyenMonId;
            ViewBag.CurrentFilter = filterType;
            var listLop = _productRepo.GetLopHocs(search, chuyenMonId, maKH, filterType);
            listLop = listLop.Where(l => l.NgayBatDau > DateTime.Today).ToList();
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            int totalItems = listLop.Count();
            ViewBag.TotalPages = (int)Math.Ceiling((double)totalItems / pageSize);
            ViewBag.CurrentPage = pageNumber;
            var pagedList = listLop.OrderBy(l => l.BiTrungLich)
                                   .Skip((pageNumber - 1) * pageSize)
                                   .Take(pageSize)
                                   .ToList();

            return View(pagedList);
        }

        public ActionResult CheckOutLopHoc(int maLop, string url)
        {
            if (!KiemTraDangNhap())
                return RedirectToAction("Login", "Account");
            try
            {
                var maKH = (int)Session["MaKH"];

                var lop = _productRepo.LopHocDetail(maLop);
                Session["Lop"] = lop.MaLop;
                var khachHang = _khachhangRepo.ThongTinKH(maKH);
                ViewBag.KhachHang = khachHang;

                var loaKh = khachHang.MaLoaiKH ?? khachHang.MaLoaiKH ?? 4;
                ViewBag.LoaiKh = _khachhangRepo.LoaiKh(loaKh);
                ViewBag.Url = url;

                return View(lop);
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                return RedirectToAction("Index");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TaoHoaDonLopHoc(FormCollection form)
        {
            if (!KiemTraDangNhap())
                return RedirectToAction("Login", "Account");

            var lop = (int)Session["Lop"];
            int maKH = (int)Session["MaKH"];

            try
            {
                _cartRepo.TaoHoaDon(form, maKH, null, null, lop);
                return RedirectToAction("ThanhToanThanhCong", "CartCheckout");
            }
            catch (Exception ex)
            {
                string message = ex.InnerException?.InnerException?.Message ?? ex.Message;

                TempData["ErrorMessage"] = message;

                string returnUrl = form["returnUrl"] ?? Url.Action("Index", "Class");
                return RedirectToAction("CheckOutLopHoc", new { maLop = lop, url = returnUrl });
            }
        }

        public ActionResult GetLichHoc(int maLop)
        {
            using (var db = new QL_PHONGGYMEntities())
            {

                var lichHoc = db.LichLops
                    .Where(l => l.MaLop == maLop)
                    .OrderBy(l => l.NgayHoc)
                    .ThenBy(l => l.GioBatDau)
                    .ToList();

                return PartialView("_LichHocPartial", lichHoc);
            }
        }
    }
}