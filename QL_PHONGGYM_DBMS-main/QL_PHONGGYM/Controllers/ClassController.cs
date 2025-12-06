using QL_PHONGGYM.Models;
using QL_PHONGGYM.Repositories;
using System;
using System.Linq;
using System.Security.Policy;
using System.Web.Mvc;

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

        public ActionResult Index(string search = "", int? chuyenMonId = null, string filterType = "")
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

            return View(listLop);
        }

        public ActionResult CheckOutLopHoc(int maLop, string url)
        {
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
                TempData["Error"] = ex.Message;
                return RedirectToAction("Index");
            }

            
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TaoHoaDonLopHoc(FormCollection form)
        {
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
    }
}