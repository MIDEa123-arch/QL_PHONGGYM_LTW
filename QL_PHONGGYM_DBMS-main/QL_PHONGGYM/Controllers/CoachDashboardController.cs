using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class CoachDashboardController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Index(DateTime? date)
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return RedirectToAction("Login", "HLV");

            DateTime selectedDate = date ?? DateTime.Today;
            int currentDayOfWeek = (int)selectedDate.DayOfWeek;
            if (currentDayOfWeek == 0) currentDayOfWeek = 7;
            DateTime startOfWeek = selectedDate.AddDays(1 - currentDayOfWeek);
            DateTime endOfWeek = startOfWeek.AddDays(6);

            ViewBag.StartOfWeek = startOfWeek;
            ViewBag.EndOfWeek = endOfWeek;
            ViewBag.SelectedDate = selectedDate;
            ViewBag.Title = "Lịch Dạy & PT";

            ViewBag.MyPTClients = _context.DangKyPTs
                .Include(d => d.KhachHang)
                .Where(d => d.MaNV == hlv.MaNV && d.TrangThai == "Còn hiệu lực")
                .ToList();

            var classSchedules = _context.LichLops
                .Include(l => l.LopHoc).Include(l => l.LopHoc.ChuyenMon)
                .Where(l => l.MaNV == hlv.MaNV && l.NgayHoc >= startOfWeek && l.NgayHoc <= endOfWeek)
                .ToList()
                .Select(l => new ScheduleViewModel
                {
                    Id = l.MaLichLop,
                    Type = "CLASS",
                    Title = l.LopHoc.TenLop,
                    SubTitle = l.LopHoc.ChuyenMon.TenChuyenMon,
                    Date = l.NgayHoc,
                    Start = l.GioBatDau,
                    End = l.GioKetThuc,
                    Status = l.TrangThai,
                    ColorClass = "border-primary"
                });

            var ptSchedules = _context.LichTapPTs
                .Include(p => p.DangKyPT).Include(p => p.DangKyPT.KhachHang)
                .Where(p => p.DangKyPT.MaNV == hlv.MaNV && p.NgayTap >= startOfWeek && p.NgayTap <= endOfWeek)
                .ToList()
                .Select(p => new ScheduleViewModel
                {
                    Id = p.MaLichPT,
                    Type = "PT",
                    Title = "PT: " + (p.DangKyPT.KhachHang?.TenKH ?? "Khách"),
                    SubTitle = "Kèm 1-1",
                    Date = p.NgayTap,
                    Start = p.GioBatDau,
                    End = p.GioKetThuc,
                    Status = p.TrangThai,
                    ColorClass = "border-warning"
                });

            var fullSchedule = classSchedules.Concat(ptSchedules)
                                           .OrderBy(x => x.Date).ThenBy(x => x.Start)
                                           .ToList();

            return View(fullSchedule);
        }

        [HttpPost]
        public JsonResult ThemLich(int maLop, DateTime ngayHoc, TimeSpan gioBatDau, TimeSpan gioKetThuc)
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return Json(new { success = false, message = "Hết phiên đăng nhập" });

            try
            {
                if (gioBatDau >= gioKetThuc)
                    return Json(new { success = false, message = "Giờ kết thúc phải lớn hơn giờ bắt đầu!" });

                bool isConflict = _context.LichLops.Any(l =>
                    l.MaNV == hlv.MaNV &&
                    l.NgayHoc == ngayHoc &&
                    ((gioBatDau >= l.GioBatDau && gioBatDau < l.GioKetThuc) ||
                     (gioKetThuc > l.GioBatDau && gioKetThuc <= l.GioKetThuc))
                );

                if (isConflict)
                    return Json(new { success = false, message = "Bạn bị trùng lịch vào khung giờ này!" });

                var newLich = new LichLop
                {
                    MaLop = maLop,
                    MaNV = hlv.MaNV,
                    NgayHoc = ngayHoc,
                    GioBatDau = gioBatDau,
                    GioKetThuc = gioKetThuc,
                    TrangThai = "Sắp diễn ra"
                };

                _context.LichLops.Add(newLich);
                _context.SaveChanges();

                return Json(new { success = true, message = "Đã thêm lịch dạy thành công!" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpPost]
        public JsonResult ThemLichPT(int maDKPT, DateTime ngayTap, TimeSpan gioBatDau, TimeSpan gioKetThuc)
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return Json(new { success = false, message = "Hết phiên đăng nhập" });

            try
            {
                if (gioBatDau >= gioKetThuc)
                    return Json(new { success = false, message = "Giờ kết thúc phải lớn hơn giờ bắt đầu!" });

                bool isConflict = _context.LichTapPTs.Any(l =>
                    l.DangKyPT.MaNV == hlv.MaNV &&
                    l.NgayTap == ngayTap &&
                    ((gioBatDau >= l.GioBatDau && gioBatDau < l.GioKetThuc) ||
                     (gioKetThuc > l.GioBatDau && gioKetThuc <= l.GioKetThuc))
                );

                if (isConflict) return Json(new { success = false, message = "Bạn đã có lịch dạy khác vào giờ này!" });

                var lich = new LichTapPT
                {
                    MaDKPT = maDKPT,
                    NgayTap = ngayTap,
                    GioBatDau = gioBatDau,
                    GioKetThuc = gioKetThuc,
                    TrangThai = "Chưa tập"
                };

                _context.LichTapPTs.Add(lich);
                _context.SaveChanges();

                return Json(new { success = true, message = "Đã lên lịch tập thành công!" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        public ActionResult Requests()
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return RedirectToAction("Login", "HLV");

            if (hlv.MaChucVu != 2)
            {
                return RedirectToAction("Index");
            }

            ViewBag.ActiveMenu = "Requests";
            ViewBag.Title = "Yêu Cầu Đăng Ký PT";

            var listRequests = _context.DangKyPTs
                                .Include(d => d.KhachHang)
                                .Where(d => d.MaNV == null && d.TrangThai == "Chờ duyệt")
                                .OrderByDescending(d => d.NgayDangKy)
                                .ToList();

            return View(listRequests);
        }

        [HttpPost]
        public JsonResult DiemDanh(int id, string type)
        {
            try
            {
                if (type == "CLASS")
                {
                    var item = _context.LichLops.Find(id);
                    if (item != null) { item.TrangThai = "Đã diễn ra"; _context.SaveChanges(); }
                }
                else
                {
                    var item = _context.LichTapPTs.Find(id);
                    if (item != null) { item.TrangThai = "Đã tập"; _context.SaveChanges(); }
                }
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpPost]
        public JsonResult DuyetYeuCau(int id, int soBuoi, decimal gia)
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return Json(new { success = false, message = "Mất phiên đăng nhập, vui lòng F5!" });

            try
            {
                var req = _context.DangKyPTs.Find(id);
                if (req != null)
                {
                    req.TrangThai = "Còn hiệu lực";
                    req.MaNV = hlv.MaNV;
                    req.SoBuoi = soBuoi;
                    req.GiaMoiBuoi = gia;
                    req.NgayDangKy = DateTime.Now;

                    _context.SaveChanges();

                    return Json(new { success = true, message = "Đã duyệt và cập nhật hợp đồng thành công!" });
                }
                return Json(new { success = false, message = "Không tìm thấy yêu cầu!" });
            }
            catch (Exception ex)
            {
                var errorMsg = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
                return Json(new { success = false, message = "Lỗi hệ thống: " + errorMsg });
            }
        }
        public ActionResult Profile()
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return RedirectToAction("Login", "HLV");

            var currentHLV = _context.NhanViens.Find(hlv.MaNV);

            ViewBag.ActiveMenu = "Profile";
            ViewBag.Title = "Hồ Sơ Cá Nhân";

            return View(currentHLV);
        }

        [HttpPost]
        public JsonResult UpdateProfile(string hoTen, string sdt, string gioiTinh)
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return Json(new { success = false, message = "Mất phiên đăng nhập!" });

            try
            {
                var user = _context.NhanViens.Find(hlv.MaNV);
                if (user != null)
                {
                    user.TenNV = hoTen;
                    user.SDT = sdt;
                    user.GioiTinh = gioiTinh;

                    _context.SaveChanges();
                    Session["CoachUser"] = user; 

                    return Json(new { success = true, message = "Cập nhật hồ sơ thành công!" });
                }
                return Json(new { success = false, message = "Không tìm thấy nhân viên!" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi: " + ex.Message });
            }
        }


        [HttpPost]
        public JsonResult ChangePassword(string matKhauCu, string matKhauMoi)
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return Json(new { success = false, message = "Mất phiên đăng nhập!" });

            try
            {
                var user = _context.NhanViens.Find(hlv.MaNV);
   
                if (user.MatKhau != matKhauCu)
                {
                    return Json(new { success = false, message = "Mật khẩu cũ không đúng!" });
                }

                user.MatKhau = matKhauMoi;
                _context.SaveChanges();
                return Json(new { success = true, message = "Đổi mật khẩu thành công!" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi: " + ex.Message });
            }
        }
    }
}