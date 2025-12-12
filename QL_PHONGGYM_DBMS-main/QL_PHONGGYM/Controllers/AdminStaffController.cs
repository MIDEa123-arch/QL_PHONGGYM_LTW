using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class AdminStaffController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Index(string search = "", int maChucVu = 0, int page = 1)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var query = _context.NhanViens.Include("ChucVu").AsQueryable();

            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower();
                query = query.Where(x => x.TenNV.ToLower().Contains(search) ||
                                         x.SDT.Contains(search) ||
                                         x.TenDangNhap.ToLower().Contains(search));
            }
            if (maChucVu > 0)
            {
                query = query.Where(x => x.MaChucVu == maChucVu);
            }

            int pageSize = 10;
            int totalRecord = query.Count();
            int totalPages = (int)Math.Ceiling((double)totalRecord / pageSize);

            var model = query.OrderByDescending(x => x.MaNV)
                             .Skip((page - 1) * pageSize)
                             .Take(pageSize)
                             .ToList();

            ViewBag.ListChucVu = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", maChucVu);
            ViewBag.CurrentSearch = search;
            ViewBag.CurrentMaChucVu = maChucVu;
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = page;

            return View(model);
        }

        public ActionResult Create()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            ViewBag.MaChucVu = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu");
            return View(new NhanVien());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(NhanVien model)
        {
            if (string.IsNullOrEmpty(model.TenNV))
                ModelState.AddModelError("TenNV", "Vui lòng nhập họ tên nhân viên!");

            if (model.MaChucVu == 0)
                ModelState.AddModelError("MaChucVu", "Vui lòng chọn chức vụ!");

            if (string.IsNullOrEmpty(model.SDT))
            {
                ModelState.AddModelError("SDT", "Vui lòng nhập số điện thoại!");
            }
            else
            {
                if (model.SDT.Length > 10)
                {
                    ModelState.AddModelError("SDT", "Số điện thoại không được vượt quá 10 ký tự!");
                }
                if (System.Text.RegularExpressions.Regex.IsMatch(model.SDT, @"\D"))
                {
                    ModelState.AddModelError("SDT", "Số điện thoại chỉ được chứa ký tự số!");
                }
                if (!model.SDT.StartsWith("0"))
                {
                    ModelState.AddModelError("SDT", "Số điện thoại phải bắt đầu bằng số 0!");
                }
                if (ModelState.IsValid)
                {
                    bool trungSDT = _context.NhanViens.Any(x => x.SDT == model.SDT);
                    if (trungSDT)
                    {
                        ModelState.AddModelError("SDT", "Số điện thoại này đã tồn tại trong hệ thống!");
                    }
                }

            }
            if (string.IsNullOrEmpty(model.TenDangNhap))
                ModelState.AddModelError("TenDangNhap", "Vui lòng nhập tên đăng nhập!");

            if (string.IsNullOrEmpty(model.MatKhau))
                ModelState.AddModelError("MatKhau", "Vui lòng nhập mật khẩu!");

            if (model.NgaySinh.HasValue && model.NgaySinh.Value > DateTime.Now)
            {
                ModelState.AddModelError("NgaySinh", "Ngày sinh không được lớn hơn ngày hiện tại!");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (!string.IsNullOrEmpty(model.TenDangNhap))
                    {
                        bool trungUser = _context.NhanViens.Any(x => x.TenDangNhap == model.TenDangNhap);
                        if (trungUser)
                        {
                            ModelState.AddModelError("TenDangNhap", "Tên đăng nhập này đã được sử dụng!");
                        }
                    }
                    if (!string.IsNullOrEmpty(model.SDT))
                    {
                        bool trungSDT = _context.NhanViens.Any(x => x.SDT == model.SDT);
                        if (trungSDT)
                        {
                            ModelState.AddModelError("SDT", "Số điện thoại này đã tồn tại trong hệ thống!");
                        }
                    }
                    _context.NhanViens.Add(model);
                    _context.SaveChanges();
                    TempData["ThongBao"] = "Thêm nhân viên thành công!";
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi hệ thống: " + ex.Message;
                }
            }
            ViewBag.MaChucVu = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", model.MaChucVu);
            return View(model);
        }


        public ActionResult Edit(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var item = _context.NhanViens.Find(id);
            if (item == null) return HttpNotFound();

            ViewBag.MaChucVu = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", item.MaChucVu);
            return View(item);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NhanVien model)
        {
            if (string.IsNullOrEmpty(model.TenNV))
                ModelState.AddModelError("TenNV", "Vui lòng nhập họ tên!");

            if (model.MaChucVu == 0)
                ModelState.AddModelError("MaChucVu", "Vui lòng chọn chức vụ!");

            if (string.IsNullOrEmpty(model.SDT))
            {
                ModelState.AddModelError("SDT", "Vui lòng nhập số điện thoại!");
            }
            else
            {
                if (model.SDT.Length > 10)
                    ModelState.AddModelError("SDT", "SĐT tối đa 10 số!");

                if (System.Text.RegularExpressions.Regex.IsMatch(model.SDT, @"\D"))
                    ModelState.AddModelError("SDT", "SĐT chỉ được chứa số!");
                bool trungSDT = _context.NhanViens.Any(x => x.SDT == model.SDT && x.MaNV != model.MaNV);
                if (trungSDT)
                {
                    ModelState.AddModelError("SDT", "Số điện thoại này đã được nhân viên khác sử dụng!");
                }
            }

            if (model.NgaySinh.HasValue && model.NgaySinh.Value > DateTime.Now)
            {
                ModelState.AddModelError("NgaySinh", "Ngày sinh không hợp lệ!");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    var nv = _context.NhanViens.Find(model.MaNV);
                    if (nv != null)
                    {
                        nv.TenNV = model.TenNV;
                        nv.SDT = model.SDT;
                        nv.GioiTinh = model.GioiTinh;
                        nv.NgaySinh = model.NgaySinh;
                        nv.MaChucVu = model.MaChucVu;
                        if (!string.IsNullOrEmpty(model.MatKhau))
                        {
                            nv.MatKhau = model.MatKhau;
                        }

                        _context.SaveChanges();
                        TempData["ThongBao"] = "Cập nhật nhân viên thành công!";
                        return RedirectToAction("Index");
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi hệ thống: " + ex.Message;
                }
            }
            ViewBag.MaChucVu = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", model.MaChucVu);
            return View(model);
        }

        [HttpPost]
        public JsonResult ToggleAccountStatus(int id)
        {
            var adminDangNhap = Session["AdminUser"] as QL_PHONGGYM.Models.NhanVien;
            if (adminDangNhap == null)
            {
                // Có thể session bị mất (timeout), yêu cầu đăng nhập lại
                return Json(new { success = false, message = "Phiên đăng nhập hết hạn. Vui lòng F5 đăng nhập lại!" });
            }
            if (adminDangNhap != null && adminDangNhap.MaNV == id)
            {
                return Json(new { success = false, message = "Bạn không thể tự khóa tài khoản đang đăng nhập!" });
            }
            // Lấy thông tin NV (Không cần Include ChuyenMons nếu chỉ check status)
            var nv = _context.NhanViens.Find(id);
            if (nv == null) return Json(new { success = false, message = "Không tìm thấy nhân viên!" });

            // Lấy thông tin Admin đăng nhập (giả sử Admin không thể tự khóa mình)
            

            try
            {
                // --- 1. TRƯỜNG HỢP MỞ KHÓA (0 -> 1) ---
                if (nv.TrangThaiTaiKhoan == 0)
                {
                    nv.TrangThaiTaiKhoan = 1; // Mở khóa
                    _context.SaveChanges();
                    return Json(new { success = true, message = "Đã mở khóa tài khoản thành công! (Trạng thái: Đang hoạt động)" });
                }

                // --- 2. TRƯỜNG HỢP KHÓA (1 -> 0) ---

                // TỐI ƯU HÓA: Kiểm tra Ràng buộc bằng AsNoTracking() để tránh Timeout
                bool coHopDongPT = _context.DangKyPTs
                    .AsNoTracking().Any(x => x.MaNV == id);

                // Kiểm tra lịch dạy (cả LopHoc chủ nhiệm và LichLop buổi lẻ)
                bool coLichDay = _context.LopHocs
                    .AsNoTracking().Any(x => x.MaNV == id)
                    || _context.LichLops
                    .AsNoTracking().Any(x => x.MaNV == id && x.NgayHoc >= DateTime.Today); // Chỉ check lịch TƯƠNG LAI

                if (coHopDongPT || coLichDay)
                {
                    // Nếu có ràng buộc -> Ngăn chặn Khóa
                    return Json(new { success = false, message = "Lỗi: Nhân viên đang có hợp đồng PT hoặc lịch dạy tương lai. Vui lòng gỡ ràng buộc trước khi Khóa/Cho nghỉ." });
                }
                else
                {
                    // KHÔNG có ràng buộc -> Cho phép Khóa (Soft Delete)
                    nv.TrangThaiTaiKhoan = 0;
                    _context.SaveChanges(); // Lệnh lưu sẽ chạy cực nhanh ở đây
                    return Json(new { success = true, message = "Đã khóa tài khoản thành công. (Trạng thái: Đã nghỉ việc)" });
                }
            }
            catch (Exception ex)
            {
                // Nếu có lỗi SQL/EF không xác định
                return Json(new { success = false, message = "Lỗi hệ thống: " + ex.Message });
            }
        }
    }
}