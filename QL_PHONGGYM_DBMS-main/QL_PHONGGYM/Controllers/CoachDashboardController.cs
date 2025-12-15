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
        public JsonResult ThemLichPT(int maDKPT, DateTime ngayTap, TimeSpan gioBatDau, TimeSpan gioKetThuc)
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return Json(new { success = false, message = "Hết phiên đăng nhập" });

            try
            {
                if (gioBatDau >= gioKetThuc)
                    return Json(new { success = false, message = "Giờ kết thúc phải lớn hơn giờ bắt đầu!" });

                var dangKy = _context.DangKyPTs.Find(maDKPT);
                if (dangKy == null) return Json(new { success = false, message = "Không tìm thấy thông tin đăng ký!" });

                var hoaDon = _context.ChiTietHoaDons
                                     .Where(ct => ct.MaDKPT == maDKPT)
                                     .Select(ct => ct.HoaDon)
                                     .FirstOrDefault();

                if (hoaDon == null || hoaDon.TrangThai != "Đã thanh toán")
                {
                    return Json(new { success = false, message = "Khách hàng chưa thanh toán gói tập này!" });
                }

                int soBuoiDaLenLich = _context.LichTapPTs.Count(l => l.MaDKPT == maDKPT);
                if (soBuoiDaLenLich >= dangKy.SoBuoi)
                {
                    return Json(new { success = false, message = "Gói tập này đã hết số buổi (" + dangKy.SoBuoi + " buổi)!" });
                }

                bool khachBanPT = _context.LichTapPTs.Any(l =>
                    l.DangKyPT.MaKH == dangKy.MaKH &&
                    l.NgayTap == ngayTap &&
                    (
                        (gioBatDau >= l.GioBatDau && gioBatDau < l.GioKetThuc) ||
                        (gioKetThuc > l.GioBatDau && gioKetThuc <= l.GioKetThuc) ||
                        (gioBatDau <= l.GioBatDau && gioKetThuc >= l.GioKetThuc)
                    )
                );

                if (khachBanPT) return Json(new { success = false, message = "Khách hàng đã có lịch tập PT khác vào khung giờ này!" });

                bool khachBanLop = _context.LichLops.Any(l =>
                    l.NgayHoc == ngayTap &&
                    (
                        (gioBatDau >= l.GioBatDau && gioBatDau < l.GioKetThuc) ||
                        (gioKetThuc > l.GioBatDau && gioKetThuc <= l.GioKetThuc) ||
                        (gioBatDau <= l.GioBatDau && gioKetThuc >= l.GioKetThuc)
                    ) &&
                    _context.DangKyLops.Any(dk => dk.MaKH == dangKy.MaKH && dk.MaLop == l.MaLop)
                );

                if (khachBanLop) return Json(new { success = false, message = "Khách hàng đang có lịch học Lớp Nhóm vào khung giờ này!" });

                bool hlvBanPT = _context.LichTapPTs.Any(l =>
                    l.DangKyPT.MaNV == hlv.MaNV &&
                    l.NgayTap == ngayTap &&
                    (
                        (gioBatDau >= l.GioBatDau && gioBatDau < l.GioKetThuc) ||
                        (gioKetThuc > l.GioBatDau && gioKetThuc <= l.GioKetThuc) ||
                        (gioBatDau <= l.GioBatDau && gioKetThuc >= l.GioKetThuc)
                    )
                );

                if (hlvBanPT) return Json(new { success = false, message = "Bạn đã có lịch dạy PT khác vào khung giờ này!" });

                bool hlvBanLop = _context.LichLops.Any(l =>
                    l.MaNV == hlv.MaNV &&
                    l.NgayHoc == ngayTap &&
                    (
                        (gioBatDau >= l.GioBatDau && gioBatDau < l.GioKetThuc) ||
                        (gioKetThuc > l.GioBatDau && gioKetThuc <= l.GioKetThuc) ||
                        (gioBatDau <= l.GioBatDau && gioKetThuc >= l.GioKetThuc)
                    )
                );

                if (hlvBanLop) return Json(new { success = false, message = "Bạn bị trùng lịch dạy Lớp Học vào khung giờ này!" });

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

                return Json(new { success = true, message = "Đã lên lịch tập thành công! (" + (soBuoiDaLenLich + 1) + "/" + dangKy.SoBuoi + ")" });
            }
            catch (Exception ex)
            {
                var msg = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
                return Json(new { success = false, message = "Lỗi hệ thống: " + msg });
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
                    if (item != null)
                    {
                        if (item.NgayHoc > DateTime.Today)
                        {
                            return Json(new { success = false, message = "Chưa đến ngày học, không thể điểm danh!" });
                        }
                        item.TrangThai = "Đã diễn ra";
                        _context.SaveChanges();
                    }
                }
                else
                {
                    var item = _context.LichTapPTs.Find(id);
                    if (item != null)
                    {
                        if (item.NgayTap > DateTime.Today)
                        {
                            return Json(new { success = false, message = "Chưa đến ngày tập, không thể điểm danh!" });
                        }
                        item.TrangThai = "Đã tập";
                        _context.SaveChanges();
                    }
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

                    decimal tongTien = soBuoi * gia;
                    decimal giamGia = 0;
                    decimal thanhTien = tongTien - giamGia;

                    var hoaDon = new HoaDon();

                    hoaDon.MaKH = req.MaKH;
                    hoaDon.NgayLap = DateTime.Now;
                    hoaDon.TongTien = tongTien;
                    hoaDon.ThanhTien = thanhTien;
                    hoaDon.GiamGia = giamGia;
                    hoaDon.TrangThai = "Chưa thanh toán";

                    _context.HoaDons.Add(hoaDon);
                    _context.SaveChanges();

                    var chiTietHD = new ChiTietHoaDon();
                    chiTietHD.MaHD = hoaDon.MaHD;
                    chiTietHD.MaDKPT = req.MaDKPT;
                    chiTietHD.MaDKGT = null;
                    chiTietHD.MaDKLop = null;
                    chiTietHD.MaSP = null;
                    chiTietHD.SoLuong = 1;
                    chiTietHD.DonGia = thanhTien;
                    _context.ChiTietHoaDons.Add(chiTietHD);
                    _context.SaveChanges();

                    return Json(new { success = true, message = "Đã duyệt, cập nhật hợp đồng và tạo hóa đơn thành công!" });
                }
                return Json(new { success = false, message = "Không tìm thấy yêu cầu!" });
            }
            catch (Exception ex)
            {
                var errorMsg = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
                return Json(new { success = false, message = "Lỗi hệ thống: " + errorMsg });
            }
        }

        [HttpPost]
        public JsonResult HuyYeuCau(int id)
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return Json(new { success = false, message = "Mất phiên đăng nhập!" });

            try
            {
                var req = _context.DangKyPTs.Find(id);
                if (req != null)
                {
                    req.TrangThai = "Đã hủy";
                    req.MaNV = null;
                    _context.SaveChanges();

                    return Json(new { success = true, message = "Đã hủy yêu cầu đăng ký PT thành công!" });
                }
                return Json(new { success = false, message = "Không tìm thấy yêu cầu!" });
            }
            catch (Exception ex)
            {
                var errorMsg = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
                return Json(new { success = false, message = "Lỗi hệ thống: " + errorMsg });
            }
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
        public ActionResult MyStudents()
        {
            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return RedirectToAction("Login", "HLV");

            ViewBag.ActiveMenu = "MyStudents";
            ViewBag.Title = "Học Viên & Lớp Học";

            var model = new MyStudentPageViewModel();

            model.PtStudents = _context.DangKyPTs
                .Include(d => d.KhachHang)
                .Where(d => d.MaNV == hlv.MaNV)
                .ToList()
                .Select(d => new StudentViewModel
                {
                    MaDKPT = d.MaDKPT,
                    TenKH = d.KhachHang?.TenKH ?? "Khách vãng lai",
                    SDT = d.KhachHang?.SDT,
                    GioiTinh = d.KhachHang?.GioiTinh,
                    TongBuoi = d.SoBuoi,
                    DaTap = _context.LichTapPTs.Count(l => l.MaDKPT == d.MaDKPT && l.TrangThai == "Đã tập"),
                    TrangThai = d.TrangThai,
              
                    NgayDangKy = d.NgayDangKy,
                    GhiChuMucTieu = d.GhiChu
                })
                .OrderByDescending(x => x.TrangThai == "Còn hiệu lực")
                .ToList();

            var myClasses = _context.LopHocs
                .Include(l => l.ChuyenMon)
                .Where(l => l.MaNV == hlv.MaNV)
                .ToList();

            model.MyClasses = new List<ClassViewModel>();

            foreach (var c in myClasses)
            {
                int total = _context.LichLops.Count(l => l.MaLop == c.MaLop);

                int done = _context.LichLops.Count(l => l.MaLop == c.MaLop && l.TrangThai == "Đã diễn ra");

                int countStudents = _context.DangKyLops.Count(d => d.MaLop == c.MaLop);

                model.MyClasses.Add(new ClassViewModel
                {
                    MaLop = c.MaLop,
                    TenLop = c.TenLop,
                    ChuyenMon = c.ChuyenMon?.TenChuyenMon,
                    SoLuongHocVien = countStudents,
                    TongBuoi = total,
                    DaDay = done
                });
            }

            return View(model);
        }

        [HttpPost]
        public JsonResult GetStudentHistory(int maDKPT)
        {
            try
            {
                var history = _context.LichTapPTs
                    .Where(l => l.MaDKPT == maDKPT)
                    .OrderByDescending(l => l.NgayTap)
                    .ToList()
                    .Select(l => new
                    {
                        Ngay = l.NgayTap,
                        Gio = l.GioBatDau,
                        TrangThai = l.TrangThai
                    })
                    .Select(x => new {
                        Ngay = x.Ngay.ToString("dd/MM/yyyy"),
                        Gio = x.Gio.ToString(@"hh\:mm"),
                        TrangThai = x.TrangThai
                    });

                return Json(new { success = true, data = history });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpPost]
        public JsonResult GetClassMembers(int maLop)
        {
            try
            {
                int total = _context.LichLops.Count(l => l.MaLop == maLop);
                int done = _context.LichLops.Count(l => l.MaLop == maLop && l.TrangThai == "Đã diễn ra");
                int remain = total - done;

                var members = _context.DangKyLops
                    .Include(d => d.KhachHang)
                    .Where(d => d.MaLop == maLop)
                    .ToList()
                    .Select(m => new ClassMemberViewModel
                    {
                        TenKH = m.KhachHang?.TenKH,
                        SDT = m.KhachHang?.SDT,
                        GioiTinh = m.KhachHang?.GioiTinh,
                        NgayDangKy = m.NgayDangKy,
                        TongBuoi = total,
                        DaHoc = done,
                        ConLai = remain
                    })
                    .ToList();

                return Json(new { success = true, data = members, className = _context.LopHocs.Find(maLop)?.TenLop });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }
        public ActionResult Profile()
        {

            var hlv = Session["CoachUser"] as NhanVien;
            if (hlv == null) return RedirectToAction("Login", "HLV");


            var currentCoach = _context.NhanViens.Find(hlv.MaNV);

            if (currentCoach == null)
            {
                Session["CoachUser"] = null;
                return RedirectToAction("Login", "HLV");
            }
            ViewBag.ActiveMenu = "Profile";
            ViewBag.Title = "Hồ sơ cá nhân";
            return View(currentCoach);
        }
    }
}