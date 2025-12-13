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

        // 1. GET: Trang Login HLV
        [HttpGet]
        public ActionResult Login()
        {
            // Nếu đã đăng nhập HLV rồi thì vào thẳng Dashboard
            if (Session["CoachUser"] != null)
            {
                return RedirectToAction("Index", "CoachDashboard");
            }
            return View();
        }

        // 2. POST: Xử lý đăng nhập
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string username, string password)
        {
            // Kiểm tra rỗng
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ViewBag.Error = "Vui lòng nhập tài khoản và mật khẩu!";
                return View();
            }

            // Xử lý chuỗi
            username = username.Trim();
            password = password.Trim();

            // Tìm nhân viên trong DB
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

                // Kiểm tra trạng thái khóa
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