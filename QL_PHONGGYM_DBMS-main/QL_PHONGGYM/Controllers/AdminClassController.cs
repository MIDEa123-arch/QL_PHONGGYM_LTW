using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class AdminClassController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Index(string search = "", int maCM = 0)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var query = _context.LopHocs
                .Include("ChuyenMon")
                .Include("NhanVien")
                .OrderByDescending(l => l.NgayBatDau)
                .ToList();
            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower();
                query = query.Where(x => x.TenLop.ToLower().Contains(search)).ToList();
            }
            if (maCM > 0)
            {
                query = query.Where(x => x.MaCM == maCM).ToList();
            }
            ViewBag.ListChuyenMon = new SelectList(_context.ChuyenMons, "MaCM", "TenChuyenMon", maCM);
            ViewBag.CurrentSearch = search;
            ViewBag.CurrentMaCM = maCM;
            var model = query.OrderByDescending(x => x.MaLop).ToList();
            return View(model);
        }

        public ActionResult Create()
        {
            if (Session["AdminUser"] == null)
            {
                return RedirectToAction("Login", "Auth");
            }
            ViewBag.MaCM = new SelectList(_context.ChuyenMons, "MaCM", "TenChuyenMon");
            ViewBag.MaNV = new SelectList(new List<NhanVien>(), "MaNV", "TenNV");
            LopHoc defaultModel = new LopHoc();
            defaultModel.SiSoToiDa = 30;
            defaultModel.HocPhi = 0;
            defaultModel.SoBuoi = 12;
            defaultModel.NgayBatDau = DateTime.Now;
            defaultModel.NgayKetThuc = DateTime.Now.AddMonths(1);
            return View(defaultModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(LopHoc model, string strHocPhi, int GioBatDauHour, int GioBatDauMinute, int GioKetThucHour, int GioKetThucMinute, int[] SelectedDays)
        {
            TimeSpan? GioBatDau = null;
            TimeSpan? GioKetThuc = null;
            try
            {
                GioBatDau = new TimeSpan(GioBatDauHour, GioBatDauMinute, 0);
                GioKetThuc = new TimeSpan(GioKetThucHour, GioKetThucMinute, 0);
            }
            catch
            {
                ModelState.AddModelError("GioBatDau", "Giờ học không hợp lệ.");
            }
            if (SelectedDays == null || SelectedDays.Length == 0)
            {
                ModelState.AddModelError("SelectedDays", "Vui lòng chọn ít nhất một thứ trong tuần (T2-CN)!");
            }
            if (GioBatDau == null || GioKetThuc == null)
            {
                ModelState.AddModelError("GioBatDau", "Vui lòng nhập đầy đủ giờ bắt đầu và kết thúc!");
            }
            else
            {
                TimeSpan thoiLuong = GioKetThuc.Value - GioBatDau.Value;
                if (thoiLuong.TotalMinutes < 30)
                {
                    ModelState.AddModelError("GioKetThuc", "Thời lượng buổi học quá ngắn! Giờ kết thúc phải sau giờ bắt đầu ít nhất 30 phút.");
                }
            }
            if (!string.IsNullOrEmpty(strHocPhi))
            {
                string cleanGia = strHocPhi.Replace(".", "").Replace(",", "").Trim();

                if (decimal.TryParse(cleanGia, out decimal hocPhiParse))
                {
                    model.HocPhi = hocPhiParse;
                }
                else
                {
                    ModelState.AddModelError("HocPhi", "Học phí không hợp lệ!");
                }
            }
            else
            {
                model.HocPhi = 0;
            }
            if (string.IsNullOrEmpty(model.TenLop))
            {
                ModelState.AddModelError("TenLop", "Vui lòng nhập tên lớp học!");
            }

            if (model.MaCM == 0)
            {
                ModelState.AddModelError("MaCM", "Vui lòng chọn bộ môn!");
            }
            if (model.HocPhi <= 0)
            {
                ModelState.AddModelError("HocPhi", "Vui lòng nhập học phí");
            }

            if (model.NgayBatDau < DateTime.Today)
            {
                ModelState.AddModelError("NgayBatDau", "Ngày bắt đầu không được nhỏ hơn ngày hiện tại!");
            }
            if (model.NgayKetThuc <= model.NgayBatDau)
            {
                ModelState.AddModelError("NgayKetThuc", "Ngày kết thúc phải lớn hơn ngày bắt đầu!");
            }
            else
            {
                double tongSoNgay = (model.NgayKetThuc - model.NgayBatDau).TotalDays + 1;
                if (model.SoBuoi >= tongSoNgay)
                {
                    ModelState.AddModelError("SoBuoi",
                        $"Số buổi ({model.SoBuoi}) không được lớn hơn tổng số ngày của khóa học ({tongSoNgay} ngày). Vui lòng tăng thời hạn hoặc giảm số buổi.");
                }
            }
            if (model.SoBuoi <= 0)
            {
                ModelState.AddModelError("SoBuoi", "Vui lòng nhập số buổi học của lớp");
            }
            if (model.SiSoToiDa <= 0)
            {
                ModelState.AddModelError("SiSoToiDa", "Vui lòng nhập sĩ số của lớp");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    List<DateTime> danhSachNgayHoc = new List<DateTime>();
                    for (DateTime date = model.NgayBatDau; date <= model.NgayKetThuc; date = date.AddDays(1))
                    {
                        if (SelectedDays.Contains((int)date.DayOfWeek))
                        {
                            danhSachNgayHoc.Add(date);
                            if (danhSachNgayHoc.Count == model.SoBuoi) break;
                        }
                    }
                    if (danhSachNgayHoc.Count < model.SoBuoi)
                    {
                        DateTime ngayGoiY = model.NgayKetThuc;
                        int soBuoiConThieu = model.SoBuoi.Value - danhSachNgayHoc.Count;
                        int count = 0;
                        while (count < soBuoiConThieu)
                        {
                            ngayGoiY = ngayGoiY.AddDays(1);
                            if (SelectedDays.Contains((int)ngayGoiY.DayOfWeek))
                            {
                                count++;
                            }
                        }
                        ModelState.AddModelError("NgayKetThuc",
                            $"Khoảng thời gian bạn chọn quá ngắn! Chỉ xếp được {danhSachNgayHoc.Count}/{model.SoBuoi} buổi. " +
                            $"Với lịch học này, ngày kết thúc phải ít nhất là {ngayGoiY.ToString("dd/MM/yyyy")}.");
                    }
                    else if (model.MaNV.HasValue)
                    {
                        foreach (var ngay in danhSachNgayHoc)
                        {
                            bool isTrung = _context.LichLops.Any(l =>
                                l.MaNV == model.MaNV
                        && l.NgayHoc == ngay
                        && l.TrangThai != "Đã hủy"
                        && (
                            (GioBatDau >= l.GioBatDau && GioBatDau < l.GioKetThuc) ||
                            (GioKetThuc > l.GioBatDau && GioKetThuc <= l.GioKetThuc) ||
                            (GioBatDau <= l.GioBatDau && GioKetThuc >= l.GioKetThuc)
                            ));

                            if (isTrung)
                            {
                                ModelState.AddModelError("MaNV", $"HLV bị trùng lịch dạy vào ngày {ngay:dd/MM/yyyy}. Vui lòng chọn giờ khác.");
                                break;
                            }
                        }
                    }
                    if (ModelState.IsValid)
                    {
                        model.SiSoHienTai = 0;
                        _context.LopHocs.Add(model);
                        _context.SaveChanges();
                        foreach (var ngay in danhSachNgayHoc)
                        {
                            LichLop lich = new LichLop();
                            lich.MaLop = model.MaLop;
                            lich.MaNV = model.MaNV;
                            lich.NgayHoc = ngay;
                            lich.GioBatDau = GioBatDau.Value;
                            lich.GioKetThuc = GioKetThuc.Value;
                            lich.TrangThai = "Chưa diễn ra";
                            _context.LichLops.Add(lich);
                        }
                        _context.SaveChanges();
                        TempData["ThongBao"] = "Tạo lớp học mới thành công!";
                        return RedirectToAction("Index");
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi: " + ex.Message;
                }
            }

            ViewBag.MaCM = new SelectList(_context.ChuyenMons, "MaCM", "TenChuyenMon", model.MaCM);
            if (model.MaCM > 0)
            {
                var listNV = _context.NhanViens
                             .Where(nv => nv.ChuyenMons.Any(cm => cm.MaCM == model.MaCM))
                             .ToList();
                ViewBag.MaNV = new SelectList(listNV, "MaNV", "TenNV", model.MaNV);
            }
            else
            {
                ViewBag.MaNV = new SelectList(new List<NhanVien>(), "MaNV", "TenNV");
            }
            return View(model);
        }
        public ActionResult GetSchedule(int id)
        {
            var listLich = _context.LichLops
                                   .Include("NhanVien")
                                   .Where(x => x.MaLop == id)
                                   .OrderBy(x => x.NgayHoc)
                                   .ThenBy(x => x.GioBatDau)
                                   .ToList();
            var tenLop = _context.LopHocs.Find(id)?.TenLop ?? "Lớp học";
            ViewBag.TenLop = tenLop;

            return PartialView("_ScheduleList", listLich);
        }
        [HttpGet]
        public JsonResult GetTrainersBySpecialty(int maCM)
        {
            var trainerList = _context.NhanViens
                                      .Where(nv => nv.ChuyenMons.Any(cm => cm.MaCM == maCM))
                                      .Select(nv => new
                                      {
                                          MaNV = nv.MaNV,
                                          TenNV = nv.TenNV
                                      })
                                      .ToList();

            return Json(trainerList, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetAvailableTrainers(int maCM, string ngayBatDau, string ngayKetThuc, string gioBatDau, string gioKetThuc, int[] selectedDays)
        {
            if (maCM == 0 || string.IsNullOrEmpty(ngayBatDau) || string.IsNullOrEmpty(ngayKetThuc) ||
                string.IsNullOrEmpty(gioBatDau) || string.IsNullOrEmpty(gioKetThuc) ||
                selectedDays == null || selectedDays.Length == 0)
            {
                return Json(new List<object>(), JsonRequestBehavior.AllowGet);
            }

            try
            {
                DateTime startD = DateTime.Parse(ngayBatDau);
                DateTime endD = DateTime.Parse(ngayKetThuc);
                TimeSpan startT = TimeSpan.Parse(gioBatDau);
                TimeSpan endT = TimeSpan.Parse(gioKetThuc);
                List<DateTime> listNgayHoc = new List<DateTime>();
                for (DateTime date = startD; date <= endD; date = date.AddDays(1))
                {
                    if (selectedDays.Contains((int)date.DayOfWeek))
                    {
                        listNgayHoc.Add(date);
                    }
                }
                if (listNgayHoc.Count == 0) return Json(new List<object>(), JsonRequestBehavior.AllowGet);
                var qualifiedTrainers = _context.NhanViens
                                                .Where(nv => nv.ChuyenMons.Any(cm => cm.MaCM == maCM))
                                                .ToList();
                var availableTrainers = new List<object>();

                foreach (var nv in qualifiedTrainers)
                {
                    bool isBusy = false;
                    var lichDayCuaNV = _context.LichLops
                                               .Where(l => l.MaNV == nv.MaNV && l.TrangThai != "Đã hủy" && l.TrangThai != "Đã diễn ra")
                                               .ToList();
                    foreach (var lich in lichDayCuaNV)
                    {
                        if (listNgayHoc.Contains(lich.NgayHoc))
                        {
                            if (startT < lich.GioKetThuc && endT > lich.GioBatDau)
                            {
                                isBusy = true;
                                break;
                            }
                        }
                    }

                    if (!isBusy)
                    {
                        availableTrainers.Add(new { MaNV = nv.MaNV, TenNV = nv.TenNV });
                    }
                }

                return Json(availableTrainers, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(new List<object>(), JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Edit(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");
            var item = _context.LopHocs.Find(id);
            if (item == null) return HttpNotFound();
            ViewBag.MaCM = new SelectList(_context.ChuyenMons, "MaCM", "TenChuyenMon", item.MaCM);
            var listNV = _context.NhanViens
                                 .Where(nv => nv.ChuyenMons.Any(cm => cm.MaCM == item.MaCM))
                                 .ToList();
            ViewBag.MaNV = new SelectList(listNV, "MaNV", "TenNV", item.MaNV);
            return View(item);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(LopHoc model, string strHocPhi)
        {
            if (!string.IsNullOrEmpty(strHocPhi))
            {
                string cleanGia = strHocPhi.Replace(".", "").Replace(",", "").Trim();
                if (decimal.TryParse(cleanGia, out decimal hocPhiParse))
                {
                    model.HocPhi = hocPhiParse;
                }
                else
                {
                    ModelState.AddModelError("HocPhi", "Học phí không hợp lệ!");
                }
            }
            if (!string.IsNullOrEmpty(strHocPhi))
            {
                string cleanGia = strHocPhi.Replace(".", "").Replace(",", "").Trim();

                if (decimal.TryParse(cleanGia, out decimal hocPhiParse))
                {
                    model.HocPhi = hocPhiParse;
                }
                else
                {
                    ModelState.AddModelError("HocPhi", "Học phí không hợp lệ!");
                }
            }
            else
            {
                model.HocPhi = 0;
            }
            if (string.IsNullOrEmpty(model.TenLop))
            {
                ModelState.AddModelError("TenLop", "Vui lòng nhập tên lớp học!");
            }


            if (model.HocPhi <= 0)
            {
                ModelState.AddModelError("HocPhi", "Vui lòng nhập học phí");
            }

            if (model.SiSoToiDa <= 0)
            {
                ModelState.AddModelError("SiSoToiDa", "Vui lòng nhập sĩ số của lớp");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    var existingLop = _context.LopHocs.Include("ChuyenMon").FirstOrDefault(t => t.MaLop == model.MaLop);
                    if (existingLop == null) return HttpNotFound();
                    if (model.MaNV.HasValue && model.MaNV != existingLop.MaNV)
                    {
                        var nvMoi = _context.NhanViens.Include("ChuyenMons").FirstOrDefault(x => x.MaNV == model.MaNV.Value);
                        if (nvMoi != null && !nvMoi.ChuyenMons.Any(cm => cm.MaCM == existingLop.MaCM))
                        {
                            ModelState.AddModelError("MaNV", $"HLV {nvMoi.TenNV} không có chuyên môn [{existingLop.ChuyenMon.TenChuyenMon}]! Vui lòng chọn HLV khác.");
                        }
                        if (ModelState.IsValid)
                        {
                            var futureLichLop = _context.LichLops
                                .Where(l => l.MaLop == model.MaLop && l.NgayHoc >= DateTime.Today && l.TrangThai != "Đã hủy")
                                .ToList();

                            foreach (var lich in futureLichLop)
                            {
                                bool isTrungLich = _context.LichLops.Any(l =>
                                    l.MaNV == model.MaNV.Value
                                    && l.MaLichLop != lich.MaLichLop 
                                    && l.NgayHoc == lich.NgayHoc 
                                    && l.TrangThai != "Đã hủy"
                                    && (
                                        (l.GioBatDau < lich.GioKetThuc) && (l.GioKetThuc > lich.GioBatDau)
                                    )
                                );

                                if (isTrungLich)
                                {
                                    var lopTrung = _context.LichLops
                                        .Where(l => l.MaNV == model.MaNV.Value && l.NgayHoc == lich.NgayHoc && l.GioBatDau < lich.GioKetThuc && l.GioKetThuc > lich.GioBatDau)
                                        .Select(l => l.LopHoc.TenLop).FirstOrDefault();

                                    ModelState.AddModelError("MaNV", $"HLV {nvMoi.TenNV} bị trùng lịch với lớp [{lopTrung}] vào ngày {lich.NgayHoc.ToString("dd/MM/yyyy")}!");
                                    break; 
                                }
                            }
                        }
                    }
                    if (ModelState.IsValid)
                    {
                        existingLop.TenLop = model.TenLop;
                        existingLop.MaNV = model.MaNV;
                        existingLop.HocPhi = model.HocPhi;
                        existingLop.SiSoToiDa = model.SiSoToiDa;
                        if (model.MaNV != existingLop.MaNV) 
                        {
                            var lichLopCanUpdate = _context.LichLops.Where(l => l.MaLop == existingLop.MaLop).ToList();
                            foreach (var lich in lichLopCanUpdate)
                            {
                                lich.MaNV = model.MaNV;
                            }
                        }
                        _context.SaveChanges();
                        TempData["ThongBao"] = "Cập nhật lớp học thành công!";
                        return RedirectToAction("Index");
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi hệ thống: " + ex.Message;
                }
            }
            ViewBag.MaCM = new SelectList(_context.ChuyenMons, "MaCM", "TenChuyenMon", model.MaCM);
            var listNVLoad = _context.NhanViens
                .Where(nv => nv.ChuyenMons.Any(cm => cm.MaCM == model.MaCM))
                .ToList();
            ViewBag.MaNV = new SelectList(listNVLoad, "MaNV", "TenNV", model.MaNV);

            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            var lop = _context.LopHocs.Find(id);
            if (lop == null)
            {
                return Json(new { success = false, message = "Không tìm thấy lớp học!" });
            }
            try
            {
                bool coHocVien = _context.DangKyLops.Any(x => x.MaLop == id);

                if (coHocVien)
                {
                    return Json(new { success = false, message = "Lớp học này đã có học viên đăng ký và hoạt động. Không thể xóa!" });
                }
                else
                {
                    var lichHoc = _context.LichLops.Where(x => x.MaLop == id).ToList();
                    if (lichHoc.Any())
                    {
                        _context.LichLops.RemoveRange(lichHoc);
                    }
                    _context.LopHocs.Remove(lop);
                    _context.SaveChanges();
                    return Json(new { success = true, message = "Đã xóa vĩnh viễn lớp học và lịch học kèm theo!" });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi hệ thống: " + ex.Message });
            }
        }
        public ActionResult Filter(string search = "", int maCM = 0)
        {
            var query = _context.LopHocs.Include("ChuyenMon").Include("NhanVien").AsQueryable();
            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower();
                query = query.Where(x => x.TenLop.ToLower().Contains(search));
            }
            if (maCM > 0)
            {
                query = query.Where(x => x.MaCM == maCM);
            }
            var model = query.OrderByDescending(x => x.MaLop).ToList();
            return PartialView("_ListLopHoc", model);
        }
        public ActionResult Calendar(DateTime? date, int? id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");
            DateTime selectedDate = date ?? DateTime.Today;
            int delta = DayOfWeek.Monday - selectedDate.DayOfWeek;
            if (delta > 0) delta -= 7;
            DateTime startOfWeek = selectedDate.AddDays(delta);
            DateTime endOfWeek = startOfWeek.AddDays(6);
            var lichHoc = _context.LichLops
                .Include("LopHoc")
                .Include("NhanVien")
                .Include("LopHoc.ChuyenMon")
                .Where(l => l.NgayHoc >= startOfWeek && l.NgayHoc <= endOfWeek)
                .OrderBy(l => l.NgayHoc)
                .ThenBy(l => l.GioBatDau)
                .ToList();
            if (id.HasValue && id.Value > 0)
            {
                lichHoc = lichHoc.Where(l => l.MaLop == id.Value).ToList();
                var lop = _context.LopHocs.Find(id.Value);
                ViewBag.TitleHeader = $"LỊCH HỌC: {lop?.TenLop.ToUpper()}";
            }
            else
            {
                ViewBag.TitleHeader = "THỜI KHÓA BIỂU TOÀN TRUNG TÂM";
            }
            var lichHoc1 = lichHoc.OrderBy(l => l.NgayHoc).ThenBy(l => l.GioBatDau).ToList();
            ViewBag.StartOfWeek = startOfWeek;
            ViewBag.EndOfWeek = endOfWeek;
            ViewBag.ListNV = _context.NhanViens.Where(x => x.MaChucVu != 4).ToList();

            return View(lichHoc1);
        }

        public JsonResult GetSessionDetail(int maLichLop)
        {
            var lich = _context.LichLops.Find(maLichLop);
            if (lich == null) return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            var listHocVien = _context.DangKyLops
                .Where(dk => dk.MaLop == lich.MaLop && dk.TrangThai == "Còn hiệu lực")
                .Select(dk => new
                {
                    dk.KhachHang.TenKH,
                    dk.KhachHang.GioiTinh,
                    dk.KhachHang.SDT
                }).ToList();
            int maCM = lich.LopHoc.MaCM;

            var listHLVPhuHop = _context.NhanViens
                .Where(nv => nv.ChuyenMons.Any(cm => cm.MaCM == maCM))
                .Select(nv => new
                {
                    nv.MaNV,
                    nv.TenNV
                }).ToList();

            return Json(new
            {
                success = true,
                tenLop = lich.LopHoc.TenLop,
                ngayHoc = lich.NgayHoc.ToString("dd/MM/yyyy"),
                gioHoc = lich.GioBatDau + " - " + lich.GioKetThuc,
                maNV = lich.MaNV, // HLV hiện tại
                hocViens = listHocVien,
                listHLV = listHLVPhuHop // Danh sách để đổ vào dropdown
            }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult UpdateSessionInstructor(int maLichLop, int maNV)
        {
            try
            {
                var lich = _context.LichLops.Find(maLichLop);
                if (lich == null) return Json(new { success = false, message = "Lỗi dữ liệu!" });

                var lop = _context.LopHocs.Find(lich.MaLop);

                // A. KIỂM TRA CHUYÊN MÔN (Check lại lần nữa cho an toàn)
                var nvMoi = _context.NhanViens.FirstOrDefault(x => x.MaNV == maNV);
                bool coChuyenMon = nvMoi.ChuyenMons.Any(cm => cm.MaCM == lop.MaCM);
                if (!coChuyenMon)
                {
                    return Json(new { success = false, message = $"HLV {nvMoi.TenNV} không có chuyên môn [{lop.ChuyenMon.TenChuyenMon}]. Không thể dạy thay!" });
                }

                // B. KIỂM TRA TRÙNG LỊCH
                // Tìm xem HLV này có đang dạy lớp nào khác trong khung giờ đó không
                bool isTrungLich = _context.LichLops.Any(l =>
                    l.MaNV == maNV // Cùng giáo viên
                    && l.MaLichLop != maLichLop // Không phải buổi đang sửa
                    && l.NgayHoc == lich.NgayHoc // Cùng ngày
                    && l.TrangThai != "Đã hủy"
                    && (
                        // Logic giao nhau của 2 khoảng thời gian
                        (l.GioBatDau < lich.GioKetThuc) && (l.GioKetThuc > lich.GioBatDau)
                    )
                );

                if (isTrungLich)
                {
                    // Lấy tên lớp bị trùng để báo lỗi
                    var tenLopTrung = _context.LichLops
                        .Where(l => l.MaNV == maNV && l.NgayHoc == lich.NgayHoc && l.GioBatDau < lich.GioKetThuc && l.GioKetThuc > lich.GioBatDau)
                        .Select(l => l.LopHoc.TenLop).FirstOrDefault();

                    return Json(new { success = false, message = $"HLV {nvMoi.TenNV} đang bận dạy lớp [{tenLopTrung}] vào khung giờ này!" });
                }

                // C. LƯU THAY ĐỔI
                lich.MaNV = maNV;
                _context.SaveChanges();

                return Json(new { success = true, message = "Đổi giáo viên thành công!" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi: " + ex.Message });
            }
        }
    }
}