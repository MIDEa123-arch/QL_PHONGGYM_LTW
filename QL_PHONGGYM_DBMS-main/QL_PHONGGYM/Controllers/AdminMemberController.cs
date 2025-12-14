using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class AdminMemberController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Index(string search = "", int? maLoai = 0, int page = 1) 
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");

            var query = _context.KhachHangs.Include("LoaiKhachHang").AsQueryable();
            ViewBag.DanhSachLoai = _context.LoaiKhachHangs.ToList();
            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(k => k.TenKH.Contains(search) || k.SDT.Contains(search));
            }
            if (maLoai != 0 && maLoai != null)
            {
                query = query.Where(h => h.MaLoaiKH == maLoai);
            }

            int pageSize = 10;
            int totalRecord = query.Count(); 
            int totalPages = (int)Math.Ceiling((double)totalRecord / pageSize); 


            var model = query.OrderByDescending(k => k.MaKH)
                             .Skip((page - 1) * pageSize)
                             .Take(pageSize)
                             .ToList();

            ViewBag.DanhSachLoai = _context.LoaiKhachHangs.ToList();
            ViewBag.CurrentSearch = search;
            ViewBag.CurrentStatus = maLoai;

            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = page;

            if (Request.IsAjaxRequest())
            {
                return PartialView("_DanhSachHoiVien", model);
            }

            return View(model);
        }

        public ActionResult Edit(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");
            var item = _context.KhachHangs.Find(id);
            if (item == null) return HttpNotFound();

            ViewBag.MaLoaiKH = new SelectList(_context.LoaiKhachHangs, "MaLoaiKH", "TenLoai", item.MaLoaiKH);
            return View(item);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(KhachHang model)
        {
            if (model.NgaySinh.HasValue && model.NgaySinh.Value > DateTime.Now)
            {
                ModelState.AddModelError("NgaySinh", "Ngày sinh không được lớn hơn ngày hiện tại.");
            }

            if (_context.KhachHangs.Any(x => x.SDT == model.SDT && x.MaKH != model.MaKH))
            {
                ModelState.AddModelError("SDT", "Số điện thoại này đã được sử dụng bởi người khác.");
            }

            if (!string.IsNullOrEmpty(model.Email) && _context.KhachHangs.Any(x => x.Email == model.Email && x.MaKH != model.MaKH))
            {
                ModelState.AddModelError("Email", "Email này đã được sử dụng bởi người khác.");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    var kh = _context.KhachHangs.Find(model.MaKH);
                    if (kh != null)
                    {
                        kh.TenKH = model.TenKH;
                        kh.SDT = model.SDT;
                        kh.Email = model.Email;
                        kh.NgaySinh = model.NgaySinh;
                        kh.GioiTinh = model.GioiTinh;
                        kh.MaLoaiKH = model.MaLoaiKH;

                        if (!string.IsNullOrEmpty(model.MatKhau))
                        {
                            kh.MatKhau = model.MatKhau;
                        }

                        _context.SaveChanges();
                        TempData["ThongBao"] = "Cập nhật thông tin hội viên thành công!";
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi: " + ex.Message;
                }
            }
            ViewBag.MaLoaiKH = new SelectList(_context.LoaiKhachHangs, "MaLoaiKH", "TenLoai", model.MaLoaiKH);
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {

            if (Session["AdminUser"] == null)
            {
                return RedirectToAction("Login", "AdminHome");
            }

            ViewBag.MaLoaiKH = new SelectList(_context.LoaiKhachHangs, "MaLoaiKH", "TenLoai");


            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(QL_PHONGGYM.Models.KhachHang model)
        {
            ViewBag.MaLoaiKH = new SelectList(_context.LoaiKhachHangs, "MaLoaiKH", "TenLoai", model.MaLoaiKH);
            if (ModelState.IsValid)
            {
                if (string.IsNullOrEmpty(model.TenKH) || string.IsNullOrWhiteSpace(model.TenKH))
                {
                    ModelState.AddModelError("TenKH", "Vui lòng nhập họ và tên hội viên!");
                    return View(model);
                }
                if (model.NgaySinh.HasValue && model.NgaySinh.Value > DateTime.Now)
                {
                    ModelState.AddModelError("NgaySinh", "Ngày sinh không được lớn hơn ngày hiện tại!");
                    return View(model);
                }
                if (!string.IsNullOrEmpty(model.TenDangNhap))
                {
                    var checkTenDangNhap = _context.KhachHangs.FirstOrDefault(x => x.TenDangNhap == model.TenDangNhap);
                    if (checkTenDangNhap != null)
                    {
                        ModelState.AddModelError("TenDangNhap", "Tên đăng nhập này đã tồn tại trong hệ thống!");
                        return View(model);
                    }
                }
                if(string.IsNullOrEmpty(model.TenDangNhap)||string.IsNullOrWhiteSpace(model.TenDangNhap))
                {
                    ModelState.AddModelError("TenDangNhap", "Không được bỏ trống tên đăng nhập!");
                    return View(model);
                }
                if (!string.IsNullOrEmpty(model.Email))
                {
                    var checkEmail = _context.KhachHangs.FirstOrDefault(x => x.Email == model.Email);
                    if (checkEmail != null)
                    {
                        ModelState.AddModelError("Email", "Email này đã tồn tại trong hệ thống!");
                        return View(model);
                    }
                }

                if (!string.IsNullOrEmpty(model.SDT))
                {
                    var checkSDT = _context.KhachHangs.FirstOrDefault(x => x.SDT == model.SDT);
                    if (checkSDT != null)
                    {
                        ModelState.AddModelError("SDT", "Số điện thoại này đã được đăng ký!");
                        return View(model);
                    }
                }

                try
                {
                    if (string.IsNullOrEmpty(model.MatKhau))
                    {
                        model.MatKhau = "123456"; 
                    }

                    _context.KhachHangs.Add(model);
                    _context.SaveChanges();

                    TempData["ThongBao"] = "Thêm hội viên mới thành công!";
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Có lỗi xảy ra khi lưu dữ liệu: " + ex.Message);
                }
            }

            return View(model);
        }
        [HttpPost]
        public JsonResult ToggleAccountStatus(int id)
        {
            // 1. Tìm hội viên
            var kh = _context.KhachHangs.Find(id);
            if (kh == null) return Json(new { success = false, message = "Không tìm thấy thông tin hội viên!" });

            try
            {
                // 2. Xử lý trạng thái (Nếu null coi như là 1 - Đang hoạt động)
                int trangThaiHienTai = kh.TrangThaiTaiKhoan ?? 1;

                if (trangThaiHienTai == 1)
                {
                    // --- Đang hoạt động -> KHÓA ---
                    kh.TrangThaiTaiKhoan = 0;
                    _context.SaveChanges();
                    return Json(new { success = true, message = $"Đã KHÓA tài khoản hội viên {kh.TenKH} thành công." });
                }
                else
                {
                    // --- Đang khóa -> MỞ LẠI ---
                    kh.TrangThaiTaiKhoan = 1;
                    _context.SaveChanges();
                    return Json(new { success = true, message = $"Đã MỞ KHÓA cho hội viên {kh.TenKH} thành công." });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi hệ thống: " + ex.Message });
            }
        }
    }
}