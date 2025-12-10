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
        [HttpGet] // Dùng GET để có thể tải file qua đường dẫn URL
        public ActionResult ExportToExcel(string fromDate, string toDate)
        {
            try
            {
                DateTime start = DateTime.Parse(fromDate);
                DateTime end = DateTime.Parse(toDate).AddDays(1).AddSeconds(-1);

                // 1. Lấy dữ liệu chi tiết (Kèm theo các bảng liên quan để lấy tên sản phẩm/gói)
                var listHoaDon = _context.ChiTietHoaDons
                    .Include(ct => ct.HoaDon)
                    .Include(ct => ct.SanPham)
                    .Include(ct => ct.DangKyGoiTap.GoiTap)
                    .Include(ct => ct.DangKyLop.LopHoc)
                    .Where(ct => ct.HoaDon.TrangThai == "Đã thanh toán"
                                && ct.HoaDon.NgayLap >= start
                                && ct.HoaDon.NgayLap <= end)
                    .ToList();

                // 2. Tạo nội dung file CSV (Dùng StringBuilder)
                var sb = new System.Text.StringBuilder();

                // Dòng tiêu đề
                sb.AppendLine("Mã HĐ,Ngày Lập,Nội Dung Chi Tiết,Loại Hình,Số Lượng,Đơn Giá,Thành Tiền");

                foreach (var item in listHoaDon)
                {
                    // Xác định loại hình
                    string loaiHinh = item.SanPham != null ? "Bán hàng & Dụng cụ" :
                                      item.DangKyGoiTap != null ? "Gói tập Gym" :
                                      item.DangKyPT != null ? "Huấn luyện viên (PT)" :
                                      item.DangKyLop != null ? "Lớp học" : "Khác";

                    // Xác định tên nội dung (Tên SP / Tên Gói / Tên Lớp)
                    string noiDung = "Dịch vụ khác";
                    if (item.SanPham != null) noiDung = item.SanPham.TenSP;
                    else if (item.DangKyGoiTap != null && item.DangKyGoiTap.GoiTap != null) noiDung = item.DangKyGoiTap.GoiTap.TenGoi;
                    else if (item.DangKyLop != null && item.DangKyLop.LopHoc != null) noiDung = item.DangKyLop.LopHoc.TenLop;
                    else if (item.DangKyPT != null) noiDung = "Thuê PT";

                    // Xử lý dấu phẩy trong nội dung để không bị vỡ cột CSV (Bao quanh bằng ngoặc kép)
                    noiDung = "\"" + (noiDung ?? "").Replace("\"", "\"\"") + "\"";

                    // Format dòng dữ liệu
                    var line = string.Format("{0},{1},{2},{3},{4},{5},{6}",
                        item.HoaDon.MaHD,
                        item.HoaDon.NgayLap.Value.ToString("dd/MM/yyyy HH:mm"),
                        noiDung,
                        loaiHinh,
                        item.SoLuong ?? 1,
                        (item.DonGia).ToString("0.##"), // Format số không có số 0 vô nghĩa
                        (item.DonGia * (item.SoLuong ?? 1)).ToString("0.##")
                    );
                    sb.AppendLine(line);
                }

                // 3. Trả về file (Thêm BOM để Excel nhận diện đúng tiếng Việt)
                byte[] buffer = System.Text.Encoding.UTF8.GetPreamble()
                    .Concat(System.Text.Encoding.UTF8.GetBytes(sb.ToString())).ToArray();

                return File(buffer, "text/csv", $"BaoCaoDoanhThu_{start:ddMMyyyy}_{end:ddMMyyyy}.csv");
            }
            catch (Exception ex)
            {
                return Content("Lỗi khi xuất file: " + ex.Message);
            }
        }
    }
}