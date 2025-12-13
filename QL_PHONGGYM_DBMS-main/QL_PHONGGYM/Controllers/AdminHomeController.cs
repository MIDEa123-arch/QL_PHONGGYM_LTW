using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class AdminHomeController : Controller
    {
        public ActionResult AccessDenied()
        {
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Login()
        {
            if (Session["AdminUser"] != null)
            {
                return RedirectToAction("Index", "AdminDashboard");
            }
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string username, string password)
        {
            var nhanVien = _context.NhanViens
                .Include("ChucVu")
                .FirstOrDefault(nv => nv.TenDangNhap == username && nv.MatKhau == password);

            if (nhanVien != null)
            {
                if (nhanVien.MaChucVu == 3 || nhanVien.MaChucVu == 4)
                {
                    Session["AdminUser"] = nhanVien;
                    Session["AdminName"] = nhanVien.TenNV;
                    Session["AdminRole"] = nhanVien.ChucVu.TenChucVu;
                    Session["MaChucVu"] = nhanVien.MaChucVu;

                    return RedirectToAction("Index", "AdminDashboard");
                }
                else
                {
                    ViewBag.Error = "Bạn không có quyền truy cập trang quản trị.";
                }
            }
            else
            {
                ViewBag.Error = "Tên đăng nhập hoặc mật khẩu không đúng.";
            }

            return View();
        }
        public ActionResult Logout()
        {
            Session.Remove("AdminUser");
            Session.Remove("AdminName");
            Session.Remove("AdminRole");
            return RedirectToAction("Login");
        }
        [HttpGet]
        public ActionResult UserProfile()
        {
            if (Session["AdminUser"] == null)
                return RedirectToAction("Login", "Auth"); 
            var adminSession = Session["AdminUser"] as NhanVien;
            var nhanVien = _context.NhanViens
                                   .Include("ChucVu") 
                                   .FirstOrDefault(n => n.MaNV == adminSession.MaNV);

            if (nhanVien == null) return HttpNotFound();

            return View(nhanVien);
        }
    }
}