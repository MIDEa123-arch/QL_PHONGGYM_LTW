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
        public ActionResult Create(LopHoc model, string strHocPhi, TimeSpan? GioBatDau, TimeSpan? GioKetThuc, int[] SelectedDays)
        {
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
                    var lop = _context.LopHocs.FirstOrDefault(t => t.MaLop == model.MaLop);
                    if (lop != null)
                    {
                        lop.TenLop = model.TenLop;
                        lop.MaNV = model.MaNV;
                        lop.HocPhi = model.HocPhi;
                        lop.SiSoToiDa = model.SiSoToiDa;

                        _context.SaveChanges();
                        TempData["ThongBao"] = "Cập nhật lớp học thành công!";
                        return RedirectToAction("Index");
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi: " + ex.Message;
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
        [HttpPost]
        public JsonResult CancelSession(int id)
        {
            try
            {
                var lich = _context.LichLops.Find(id);
                if (lich == null)
                {
                    return Json(new { success = false, message = "Không tìm thấy lịch học!" });
                }

                // Chỉ cho phép hủy những buổi chưa diễn ra
                if (lich.TrangThai == "Đã diễn ra")
                {
                    return Json(new { success = false, message = "Buổi học này đã diễn ra, không thể hoãn/hủy!" });
                }

                // Cập nhật trạng thái
                lich.TrangThai = "Đã hủy"; // Hoặc "Tạm hoãn" tùy bạn quy định
                _context.SaveChanges();

                return Json(new { success = true, message = "Đã hủy buổi học thành công!" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi: " + ex.Message });
            }
        }
    }
}