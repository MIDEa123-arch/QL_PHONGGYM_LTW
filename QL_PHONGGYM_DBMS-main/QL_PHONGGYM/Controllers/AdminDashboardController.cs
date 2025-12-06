using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace QL_PHONGGYM.Controllers
{
    public class AdminDashboardController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Index()
        {
            if (Session["AdminUser"] == null)
            {
                return RedirectToAction("Login", "Auth");
            }

            var today = DateTime.Now;
            var startOfMonth = new DateTime(today.Year, today.Month, 1);
            var startOfDay = today.Date;

            var model = new AdminDashboardViewModel();

            var doanhThu = _context.HoaDons
                .Where(h => h.NgayLap >= startOfMonth && h.TrangThai == "Đã thanh toán")
                .Sum(h => h.ThanhTien);
            model.DoanhThuThang = doanhThu ?? 0;

            model.HoiVienMoi = _context.DangKyGoiTaps
                .Count(dk => dk.NgayDangKy >= startOfMonth);

            model.KhachDangTap = _context.CheckIns
                .Count(c => c.ThoiGianVao >= startOfDay && c.ThoiGianRa == null);

            model.DonHangThang = _context.HoaDons
                .Count(h => h.NgayLap >= startOfMonth);

            model.DonHangMoiNhat = _context.HoaDons
                .Include(h => h.KhachHang)
                .OrderByDescending(h => h.NgayLap)
                .Take(5)
                .ToList();

            return View(model);
        }
    }
}