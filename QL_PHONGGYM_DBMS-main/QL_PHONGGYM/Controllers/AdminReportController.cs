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
        [HttpPost]
        public JsonResult GetMonthlyRevenue(int year)
        {
            // Lấy tất cả hóa đơn đã thanh toán trong năm được chọn
            var data = _context.HoaDons
                .Where(h => h.TrangThai == "Đã thanh toán" && h.NgayLap.Value.Year == year)
                .Select(h => new { h.NgayLap.Value.Month, h.TongTien })
                .ToList();

            // Khởi tạo mảng 12 tháng với giá trị 0
            decimal[] monthlyData = new decimal[12];

            // Cộng dồn doanh thu vào từng tháng (Index 0 là tháng 1, Index 11 là tháng 12)
            foreach (var item in data)
            {
                monthlyData[item.Month - 1] += item.TongTien ?? 0;
            }

            return Json(new { success = true, data = monthlyData, year = year });
        }
    }
}