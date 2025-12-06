using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace QL_PHONGGYM.Controllers
{
    public class AdminReportController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Index()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");
            return View();
        }

        [HttpPost]
        public JsonResult GetRevenueData(string fromDate, string toDate)
        {
            DateTime start = DateTime.Parse(fromDate);
            DateTime end = DateTime.Parse(toDate).AddDays(1).AddSeconds(-1);

            var listHoaDon = _context.ChiTietHoaDons
                .Include(ct => ct.HoaDon)
                .Where(ct => ct.HoaDon.TrangThai == "Đã thanh toán"
                          && ct.HoaDon.NgayLap >= start
                          && ct.HoaDon.NgayLap <= end)
                .ToList();

            var reportData = listHoaDon
                .Select(ct => new
                {
                    LoaiHinh = ct.SanPham != null ? "Bán hàng & Dụng cụ" :
                               ct.DangKyGoiTap != null ? "Gói tập Gym" :
                               ct.DangKyPT != null ? "Huấn luyện viên (PT)" :
                               ct.DangKyLop != null ? "Lớp học" : "Khác",
                    ThanhTien = (ct.DonGia * ct.SoLuong)
                })
                .GroupBy(x => x.LoaiHinh)
                .Select(g => new
                {
                    Label = g.Key,
                    Value = g.Sum(x => x.ThanhTien)
                })
                .OrderByDescending(x => x.Value)
                .ToList();

            decimal? totalRevenue = reportData.Sum(x => x.Value);

            return Json(new
            {
                success = true,
                data = reportData,
                total = totalRevenue.Value.ToString("N0")
            });
        }
    }
}