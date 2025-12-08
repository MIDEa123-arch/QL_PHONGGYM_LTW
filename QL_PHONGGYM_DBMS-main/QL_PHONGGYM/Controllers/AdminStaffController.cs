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

        public ActionResult Index(string search="", int maChucVu = 0)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var query = _context.NhanViens.Include("ChucVu").OrderByDescending(n => n.MaNV).ToList();
            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower();
                query = query.Where(x => x.TenNV.ToLower().Contains(search) ||
                                         x.SDT.Contains(search) ||
                                         x.TenDangNhap.ToLower().Contains(search)).ToList();
            }
            if (maChucVu > 0)
            {
                query = query.Where(x => x.MaChucVu == maChucVu).ToList();
            }
            ViewBag.ListChucVu = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", maChucVu);

            ViewBag.CurrentSearch = search;
            ViewBag.CurrentMaChucVu = maChucVu;

            var model = query.OrderByDescending(x => x.MaNV).ToList();
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
        public JsonResult Delete(int id)
        {
            var nv = _context.NhanViens.Include("ChuyenMons").FirstOrDefault(x => x.MaNV == id);
            if (nv == null) return Json(new { success = false, message = "Không tìm thấy nhân viên!" });
            var adminDangNhap = Session["AdminUser"] as QL_PHONGGYM.Models.NhanVien;
            if (adminDangNhap != null && adminDangNhap.MaNV == id)
            {
                return Json(new { success = false, message = "Bạn không thể xóa tài khoản đang đăng nhập!" });
            }

            try
            {
                bool coHopDongPT = _context.DangKyPTs.Any(x => x.MaNV == id);
                bool coLichDay = _context.LopHocs.Any(x => x.MaNV == id) || _context.LichLops.Any(x => x.MaNV == id);

                if (coHopDongPT || coLichDay)
                {
                    if (nv.TrangThaiTaiKhoan == 0)
                    {
                        return Json(new { success = false, message = "Nhân viên này đã bị khóa trước đó rồi!" });
                    }
                    nv.TrangThaiTaiKhoan = 0; 
                    _context.SaveChanges();
                    return Json(new { success = true, message = "Nhân viên đã có lịch sử làm việc. Hệ thống đã chuyển sang trạng thái 'Đã nghỉ việc' (Khóa) thay vì xóa vĩnh viễn." });
                }
                else
                {
                    nv.ChuyenMons.Clear();
                    _context.NhanViens.Remove(nv);
                    _context.SaveChanges();
                    return Json(new { success = true, message = "Đã xóa vĩnh viễn hồ sơ nhân viên!" });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi hệ thống: " + ex.Message });
            }
        }
    }
}