using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class AdminSettingController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Index()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var adminSession = (NhanVien)Session["AdminUser"];
            var admin = _context.NhanViens.Find(adminSession.MaNV);

            return View(admin);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateProfile(string TenNV, string SDT, string Email)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            try
            {
                var adminSession = (NhanVien)Session["AdminUser"];
                var admin = _context.NhanViens.Find(adminSession.MaNV);

                if (admin != null)
                {
                    admin.TenNV = TenNV;
                    admin.SDT = SDT;

                    _context.SaveChanges();

                    Session["AdminName"] = TenNV;
                    Session["AdminUser"] = admin;

                    TempData["Success"] = "Cập nhật thông tin thành công!";
                }
            }
            catch (Exception ex)
            {
                TempData["Error"] = "Lỗi: " + ex.Message;
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(string CurrentPassword, string NewPassword, string ConfirmPassword)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            try
            {
                var adminSession = (NhanVien)Session["AdminUser"];
                var admin = _context.NhanViens.Find(adminSession.MaNV);

                if (admin.MatKhau != CurrentPassword)
                {
                    TempData["Error"] = "Mật khẩu hiện tại không đúng.";
                }
                else if (NewPassword != ConfirmPassword)
                {
                    TempData["Error"] = "Mật khẩu xác nhận không khớp.";
                }
                else
                {
                    admin.MatKhau = NewPassword;
                    _context.SaveChanges();
                    TempData["Success"] = "Đổi mật khẩu thành công!";
                }
            }
            catch (Exception ex)
            {
                TempData["Error"] = "Lỗi: " + ex.Message;
            }

            return RedirectToAction("Index");
        }
    }
}