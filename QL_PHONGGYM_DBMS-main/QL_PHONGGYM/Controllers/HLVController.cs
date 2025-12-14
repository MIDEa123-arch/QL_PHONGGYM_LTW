using QL_PHONGGYM.Models;
using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class HLVController : Controller
    {
        private QL_PHONGGYMEntities db = new QL_PHONGGYMEntities();


        [HttpGet]
        public ActionResult Login()
        {
  
            if (Session["CoachUser"] != null)
            {
                return RedirectToAction("Index", "CoachDashboard");
            }
            return View();
        }

     
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string username, string password)
        {
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ViewBag.Error = "Vui lòng nhập tài khoản và mật khẩu!";
                return View();
            }

            username = username.Trim();
            password = password.Trim();

            var nv = db.NhanViens.FirstOrDefault(x => x.TenDangNhap == username && x.MatKhau == password);

            if (nv != null)
            {
                System.Diagnostics.Debug.WriteLine("********************************");
                System.Diagnostics.Debug.WriteLine("TÊN ĐĂNG NHẬP: " + nv.TenDangNhap);
                System.Diagnostics.Debug.WriteLine("MÃ CHỨC VỤ TRONG DB: " + nv.MaChucVu);
                System.Diagnostics.Debug.WriteLine("********************************");
                if (nv.MaChucVu != 1 && nv.MaChucVu != 2)
                {
                    ViewBag.Error = "Tài khoản này không có quyền truy cập cổng HLV!";
                    return View();
                }
                if (nv.TrangThaiTaiKhoan != 1)
                {
                    ViewBag.Error = "Tài khoản của bạn đã bị khóa!";
                    return View();
                }
                Session["CoachUser"] = nv;



                return RedirectToAction("Index", "CoachDashboard");
            }
            else
            {
                ViewBag.Error = "Sai tên đăng nhập hoặc mật khẩu!";
                return View();
            }
        }

        // 3. Đăng xuất
        public ActionResult Logout()
        {
            Session["CoachUser"] = null; // Xóa session HLV
            return RedirectToAction("Login");
        }
    }
}