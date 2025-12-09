using QL_PHONGGYM.Models;
using QL_PHONGGYM.Repositories;
using QL_PHONGGYM.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class GoiTapController : Controller
    {
        private readonly GoiTapRepository _goiTapRepo;
        private readonly KhachHangRepository _khachhangRepo;
        private readonly CartRepository _cartRepo;

        public GoiTapController()
        {
            _goiTapRepo = new GoiTapRepository(new QL_PHONGGYMEntities());
            _khachhangRepo = new KhachHangRepository(new QL_PHONGGYMEntities());
            _cartRepo = new CartRepository(new QL_PHONGGYMEntities());
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThanhToanPT(FormCollection form)
        {
            if (!KiemTraDangNhap())
                return RedirectToAction("Login", "Account");

            var result = _cartRepo.ThanhToanHoaDonPT(Convert.ToInt32(form["HoaDon"]));
            if(result)
            {
                return RedirectToAction("ThanhToanThanhCong", "CartCheckout");
            }
            else
            {
                TempData["ErrorMessage"] = "Thanh toán thất bại!";
                return RedirectToAction("CheckoutDangKyPT", "CartCheckout", new { maHD = Convert.ToInt32(form["HoaDon"]), url = form["Url"] });
            }                
                
                
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateDangKyPT(FormCollection form)
        {
            if (!KiemTraDangNhap())
                return RedirectToAction("Login", "Account");

            var makh = (int)Session["MaKH"];
            var result = _cartRepo.DangKyPT(form, makh);

            if (result)
                TempData["ThongBao"] = "Cảm ơn bạn đã gửi thông tin, chúng tôi sẽ liên hệ trong vài giờ tới";
            else
                TempData["ThongBao"] = "Đăng ký thất bại, vui lòng thử lại";

            return RedirectToAction("Index", "Home");
        }

        public ActionResult GoiTap()
        {
            var list = _goiTapRepo.goiTaps();
            return View(list);
        }

        public ActionResult DangKyPT()
        {
            if (!KiemTraDangNhap())
            {
                return Json(new
                {
                    success = false,
                    redirectUrl = Url.Action("Login", "Account")
                }, JsonRequestBehavior.AllowGet);
            }
            var makh = (int)Session["MaKH"];
            ViewBag.KhachHang = _khachhangRepo.ThongTinKH(makh);

            return PartialView();
        }

        public ActionResult CheckoutGoiTap(int id, string url)
        {
            if (!KiemTraDangNhap())
                return RedirectToAction("Login", "Account");

            try
            {
                var goiTap = _goiTapRepo.ThongTinGoiTap(id);
                Session["goiTap"] = goiTap.MaGoiTap; 
                int maKH = 0;
                if (Session["MaKH"] != null)
                {
                    maKH = Convert.ToInt32(Session["MaKH"]);
                }
                var trung = _cartRepo.KiemTraTrung(maKH);

                if (trung)
                    TempData["Message"] = "Gói tập của bạn vẫn đang được sử dụng. Bạn có muốn cộng thêm thời hạn để không bị gián đoạn khi tập luyện?";

                var khachHang = _khachhangRepo.ThongTinKH(maKH);
                ViewBag.KhachHang = khachHang;

                var loaKh = khachHang.MaLoaiKH ?? khachHang.MaLoaiKH ?? 4;
                ViewBag.LoaiKh = _khachhangRepo.LoaiKh(loaKh);
                ViewBag.Url = url;

                return View(goiTap);
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;
                return Redirect(url);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TaoHoaDonGoiTap(FormCollection form)
        {
            if (!KiemTraDangNhap())
                return RedirectToAction("Login", "Account");

            try
            {
                var goiTap = (int)Session["goiTap"];
                int maKH = (int)Session["MaKH"];
                _cartRepo.TaoHoaDon(form, maKH, null, goiTap);
                return RedirectToAction("ThanhToanThanhCong", "CartCheckout");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                return RedirectToAction("GoiTap", "GoiTap");
            }                      
        }
    }
}