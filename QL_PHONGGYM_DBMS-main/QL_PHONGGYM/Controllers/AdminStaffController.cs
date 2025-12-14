using QL_PHONGGYM.Models;
using QL_PHONGGYM.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace QL_PHONGGYM.Controllers
{
    public class AdminStaffController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();
        private const int MA_QUANLY = 3;

        private bool IsAdmin()
        {
            return Session["MaChucVu"] != null && (int)Session["MaChucVu"] == MA_QUANLY;
        }
        public ActionResult Index(string search = "", int maChucVu = 0, int maCM = 0, int page = 1)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");
            if (!IsAdmin()) return RedirectToAction("AccessDenied", "AdminHome");

            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");

            var query = _context.NhanViens
                                .Include(n => n.ChucVu)
                                .Include(n => n.ChuyenMons)
                                .AsQueryable();
            int maHLVLop = 1;
            int maPT = 2;
            var listMaChucVuHLVPT = new int[] { maHLVLop, maPT };

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

            if (maCM > 0)
            {
                query = query.Where(x => x.ChuyenMons.Any(cm => cm.MaCM == maCM));
            }
            else if (maCM == -1)
            {                
                query = query.Where(x => listMaChucVuHLVPT.Contains(x.MaChucVu.Value) && !x.ChuyenMons.Any());
            }



            query = query.OrderBy(x => x.ChuyenMons.Any() ? 1 : 0) 
                         .ThenByDescending(x => x.MaNV);

            int pageSize = 10;
            int totalRecord = query.Count();
            int totalPages = (int)Math.Ceiling((double)totalRecord / pageSize);

            var model = query
                            .Skip((page - 1) * pageSize)
                            .Take(pageSize)
                            .ToList();

            ViewBag.ListChucVu = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", maChucVu);

            var listChuyenMon = _context.ChuyenMons.ToList();
            var selectListItems = listChuyenMon
                .Select(cm => new SelectListItem { Value = cm.MaCM.ToString(), Text = cm.TenChuyenMon })
                .ToList();

            selectListItems.Insert(0, new SelectListItem { Value = "-1", Text = "Chưa có chuyên môn (HLV/PT)", Selected = (maCM == -1) });
            selectListItems.Insert(0, new SelectListItem { Value = "0", Text = "-- Tất cả chuyên môn --", Selected = (maCM == 0) });

            ViewBag.ListChuyenMon = selectListItems;


            ViewBag.CurrentSearch = search;
            ViewBag.CurrentMaChucVu = maChucVu;
            ViewBag.CurrentMaCM = maCM;
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = page;

            return View(model);
        }

        public ActionResult Create()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");
            if (!IsAdmin()) return RedirectToAction("AccessDenied", "AdminHome");

            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");

            var viewModel = new NhanVienViewModel
            {
                ChucVuList = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu"),                
                ChuyenMonList = _context.ChuyenMons.ToList()
            };

            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(NhanVienViewModel viewModel)
        {
            if (!IsAdmin()) return RedirectToAction("AccessDenied", "AdminHome");

            int maHLVLop = 1;
            int maPT = 2;

            viewModel.ChucVuList = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", viewModel.MaChucVu);
            viewModel.ChuyenMonList = _context.ChuyenMons.ToList();
         
            if (viewModel.MaChucVu.HasValue && (viewModel.MaChucVu.Value == maHLVLop || viewModel.MaChucVu.Value == maPT))
            {
                if (viewModel.SelectedChuyenMonIds == null || viewModel.SelectedChuyenMonIds.Count == 0)
                {
                    ModelState.AddModelError("SelectedChuyenMonIds", "Vui lòng chọn ít nhất một chuyên môn cho chức vụ này!");
                }
            }

            if (string.IsNullOrEmpty(viewModel.TenNV))
                ModelState.AddModelError("TenNV", "Vui lòng nhập họ tên nhân viên!");

            if (viewModel.MaChucVu == null || viewModel.MaChucVu == 0)
                ModelState.AddModelError("MaChucVu", "Vui lòng chọn chức vụ!");

            if (string.IsNullOrEmpty(viewModel.SDT))
            {
                ModelState.AddModelError("SDT", "Vui lòng nhập số điện thoại!");
            }
            else
            {
                if (viewModel.SDT.Length > 10)
                {
                    ModelState.AddModelError("SDT", "Số điện thoại không được vượt quá 10 ký tự!");
                }
                if (Regex.IsMatch(viewModel.SDT, @"\D"))
                {
                    ModelState.AddModelError("SDT", "Số điện thoại chỉ được chứa ký tự số!");
                }
                if (!viewModel.SDT.StartsWith("0"))
                {
                    ModelState.AddModelError("SDT", "Số điện thoại phải bắt đầu bằng số 0!");
                }
            }

            if (string.IsNullOrEmpty(viewModel.TenDangNhap))
                ModelState.AddModelError("TenDangNhap", "Vui lòng nhập tên đăng nhập!");

            if (string.IsNullOrEmpty(viewModel.MatKhau))
                ModelState.AddModelError("MatKhau", "Vui lòng nhập mật khẩu!");

            if (viewModel.NgaySinh.HasValue && viewModel.NgaySinh.Value > DateTime.Now)
            {
                ModelState.AddModelError("NgaySinh", "Ngày sinh không được lớn hơn ngày hiện tại!");
            }

            if (ModelState.IsValid)
            {
                bool trungSDT = _context.NhanViens.Any(x => x.SDT == viewModel.SDT);
                if (trungSDT)
                {
                    ModelState.AddModelError("SDT", "Số điện thoại này đã tồn tại trong hệ thống!");
                }

                bool trungUser = _context.NhanViens.Any(x => x.TenDangNhap == viewModel.TenDangNhap);
                if (trungUser)
                {
                    ModelState.AddModelError("TenDangNhap", "Tên đăng nhập này đã được sử dụng!");
                }
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var nhanVien = new NhanVien
                    {
                        TenNV = viewModel.TenNV,
                        MaChucVu = viewModel.MaChucVu,
                        SDT = viewModel.SDT,
                        TenDangNhap = viewModel.TenDangNhap,
                        MatKhau = viewModel.MatKhau,
                        NgaySinh = viewModel.NgaySinh,
                        GioiTinh = viewModel.GioiTinh,
                        TrangThaiTaiKhoan = viewModel.TrangThaiTaiKhoan
                    };

                    _context.NhanViens.Add(nhanVien);
                    _context.SaveChanges();

                    if (viewModel.SelectedChuyenMonIds != null && viewModel.SelectedChuyenMonIds.Count > 0)
                    {
                        var selectedChuyenMons = _context.ChuyenMons
                                                       .Where(cm => viewModel.SelectedChuyenMonIds.Contains(cm.MaCM))
                                                       .ToList();

                        if (nhanVien.ChuyenMons == null)
                            nhanVien.ChuyenMons = new HashSet<ChuyenMon>();

                        foreach (var cm in selectedChuyenMons)
                        {
                            nhanVien.ChuyenMons.Add(cm);
                        }

                        _context.SaveChanges();
                    }

                    TempData["ThongBao"] = "Thêm nhân viên thành công!";
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi hệ thống: " + ex.Message;
                }
            }

            return View(viewModel);
        }


        public ActionResult Edit(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");
            if (!IsAdmin()) return RedirectToAction("AccessDenied", "AdminHome");

            var nhanVien = _context.NhanViens
                             .Include(n => n.ChuyenMons)
                             .Include(n => n.DangKyPTs) 
                             .Include(n => n.LopHocs)
                             .FirstOrDefault(n => n.MaNV == id);

            if (nhanVien == null) return HttpNotFound();

            bool daCoKhachPT = nhanVien.DangKyPTs.Any();
            bool daCoLopHoc = nhanVien.LopHocs.Any();

            ViewBag.IsLocked = daCoKhachPT || daCoLopHoc;

            var viewModel = new NhanVienViewModel
            {
                MaNV = nhanVien.MaNV,
                TenNV = nhanVien.TenNV,
                MaChucVu = nhanVien.MaChucVu,
                SDT = nhanVien.SDT,
                NgaySinh = nhanVien.NgaySinh,
                GioiTinh = nhanVien.GioiTinh,
                TenDangNhap = nhanVien.TenDangNhap,
                TrangThaiTaiKhoan = nhanVien.TrangThaiTaiKhoan,

                SelectedChuyenMonIds = nhanVien.ChuyenMons.Select(cm => cm.MaCM).ToList(),

                ChucVuList = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", nhanVien.MaChucVu),
                ChuyenMonList = _context.ChuyenMons.ToList()
            };

            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NhanVienViewModel viewModel)
        {
            if (!IsAdmin()) return RedirectToAction("AccessDenied", "AdminHome");

            int maHLVLop = 1;
            int maPT = 2;

            viewModel.ChucVuList = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", viewModel.MaChucVu);
            viewModel.ChuyenMonList = _context.ChuyenMons.ToList();

            if (viewModel.MaChucVu.HasValue && (viewModel.MaChucVu.Value == maHLVLop || viewModel.MaChucVu.Value == maPT))
            {
                if (viewModel.SelectedChuyenMonIds == null || viewModel.SelectedChuyenMonIds.Count == 0)
                {
                    ModelState.AddModelError("SelectedChuyenMonIds", "Vui lòng chọn ít nhất một chuyên môn cho chức vụ này!");
                }
            }

            if (string.IsNullOrEmpty(viewModel.TenNV))
                ModelState.AddModelError("TenNV", "Vui lòng nhập họ tên!");

            if (viewModel.MaChucVu == null || viewModel.MaChucVu == 0)
                ModelState.AddModelError("MaChucVu", "Vui lòng chọn chức vụ!");

            if (string.IsNullOrEmpty(viewModel.SDT))
            {
                ModelState.AddModelError("SDT", "Vui lòng nhập số điện thoại!");
            }
            else
            {
                if (viewModel.SDT.Length > 10)
                    ModelState.AddModelError("SDT", "SĐT tối đa 10 số!");

                if (System.Text.RegularExpressions.Regex.IsMatch(viewModel.SDT, @"\D"))
                    ModelState.AddModelError("SDT", "SĐT chỉ được chứa số!");

                bool trungSDT = _context.NhanViens.Any(x => x.SDT == viewModel.SDT && x.MaNV != viewModel.MaNV);
                if (trungSDT)
                {
                    ModelState.AddModelError("SDT", "Số điện thoại này đã được nhân viên khác sử dụng!");
                }
            }

            if (viewModel.NgaySinh.HasValue && viewModel.NgaySinh.Value > DateTime.Now)
            {
                ModelState.AddModelError("NgaySinh", "Ngày sinh không hợp lệ!");
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var nv = _context.NhanViens.Include(n => n.ChuyenMons).FirstOrDefault(n => n.MaNV == viewModel.MaNV);

                    if (nv != null)
                    {
                        nv.TenNV = viewModel.TenNV;
                        nv.SDT = viewModel.SDT;
                        nv.GioiTinh = viewModel.GioiTinh;
                        nv.NgaySinh = viewModel.NgaySinh;
                        nv.MaChucVu = viewModel.MaChucVu;

                        if (!string.IsNullOrEmpty(viewModel.MatKhau))
                        {
                            nv.MatKhau = viewModel.MatKhau;
                        }

                        nv.ChuyenMons.Clear();                        
                        if (viewModel.SelectedChuyenMonIds != null && viewModel.SelectedChuyenMonIds.Count > 0)
                        {
                            var selectedChuyenMons = _context.ChuyenMons
                                                           .Where(cm => viewModel.SelectedChuyenMonIds.Contains(cm.MaCM))
                                                           .ToList();

                            foreach (var cm in selectedChuyenMons)
                            {
                                nv.ChuyenMons.Add(cm);
                            }
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
            return View(viewModel);
        }

        [HttpPost]
        public JsonResult ToggleAccountStatus(int id)
        {
            if (!IsAdmin()) return Json(new { success = false, message = "Bạn không có quyền thay đổi trạng thái tài khoản nhân viên." });

            var adminDangNhap = Session["AdminUser"] as QL_PHONGGYM.Models.NhanVien;
            if (adminDangNhap == null)
            {
                return Json(new { success = false, message = "Phiên đăng nhập hết hạn. Vui lòng F5 đăng nhập lại!" });
            }
            if (adminDangNhap != null && adminDangNhap.MaNV == id)
            {
                return Json(new { success = false, message = "Bạn không thể tự khóa tài khoản đang đăng nhập!" });
            }
            var nv = _context.NhanViens.Find(id);
            if (nv == null) return Json(new { success = false, message = "Không tìm thấy nhân viên!" });
            try
            {
                if (nv.TrangThaiTaiKhoan == 0)
                {
                    nv.TrangThaiTaiKhoan = 1; 
                    _context.SaveChanges();
                    return Json(new { success = true, message = "Đã mở khóa tài khoản thành công! (Trạng thái: Đang hoạt động)" });
                }
                bool coHopDongPT = _context.DangKyPTs
                    .AsNoTracking().Any(x => x.MaNV == id);
                bool coLichDay = _context.LopHocs
                    .AsNoTracking().Any(x => x.MaNV == id)
                    || _context.LichLops
                    .AsNoTracking().Any(x => x.MaNV == id && x.NgayHoc >= DateTime.Today); 

                if (coHopDongPT || coLichDay)
                {
                    return Json(new { success = false, message = "Lỗi: Nhân viên đang có hợp đồng PT hoặc lịch dạy tương lai. Vui lòng gỡ ràng buộc trước khi Khóa/Cho nghỉ." });
                }
                else
                {
                    nv.TrangThaiTaiKhoan = 0;
                    _context.SaveChanges(); 
                    return Json(new { success = true, message = "Đã khóa tài khoản thành công. (Trạng thái: Đã nghỉ việc)" });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi hệ thống: " + ex.Message });
            }
        }
    }
}