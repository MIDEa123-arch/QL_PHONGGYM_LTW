using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class AdminServiceController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        private bool IsAdminLoggedIn()
        {
            return Session["AdminUser"] != null;
        }

        public ActionResult Index()
        {
            if (!IsAdminLoggedIn()) return RedirectToAction("Login", "AdminHome");
            return View();
        }

        public ActionResult Create()
        {
            if (!IsAdminLoggedIn()) return RedirectToAction("Login", "AdminHome");
            return View();
        }

        public ActionResult Edit(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");

            var item = _context.GoiTaps.Find(id);

            if (item == null)
            {
                return HttpNotFound();
            }

            return View(item);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
 
        public ActionResult Edit(GoiTap model)
        {
            if (!IsAdminLoggedIn()) return RedirectToAction("Login", "Auth");

            if (ModelState.IsValid)
            {
                try
                {
                    var temp = _context.GoiTaps.Find(model.MaGoiTap);
                    if (temp == null) return HttpNotFound();

                    if (model.TrangThai == 0)
                    {
                        var checkDangKyGoi = _context.DangKyGoiTaps.FirstOrDefault(t => t.MaGoiTap == model.MaGoiTap);
                        if (checkDangKyGoi != null)
                        {
                            ModelState.AddModelError("", "Không thể ngừng kinh doanh vì đang có người đăng ký!");
                            return View(model);
                        }
                    }

                    temp.TenGoi = model.TenGoi;
                    temp.ThoiHan = model.ThoiHan;
                    temp.Gia = model.Gia;
                    temp.TrangThai = model.TrangThai;
                    temp.MoTa = model.MoTa;

                    _context.SaveChanges();

                    TempData["SuccessMessage"] = "Cập nhật gói tập thành công!";
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Lỗi hệ thống: " + ex.Message);
                }
            }
            return View(model);
        }

        [HttpGet]
        public JsonResult GetList(int page = 1)
        {
            if (!IsAdminLoggedIn())
                return Json(new { success = false, message = "Unauthorized", code = 401 }, JsonRequestBehavior.AllowGet);

            try
            {
                var query = _context.GoiTaps.AsQueryable();
                int pageSize = 10;
                int totalRecord = query.Count();
                int totalPages = (int)Math.Ceiling((double)totalRecord / pageSize);

                var list = query.OrderBy(x => x.Gia)
                                .Skip((page - 1) * pageSize)
                                .Take(pageSize)
                                .Select(x => new {
                                    x.MaGoiTap,
                                    x.TenGoi,
                                    x.Gia,
                                    x.ThoiHan,
                                    x.MoTa,
                                    x.TrangThai
                                })
                                .ToList();

                return Json(new
                {
                    success = true,
                    data = list,
                    pagination = new { page, totalPages, totalRecord }
                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public JsonResult Detail(int id)
        {
            if (!IsAdminLoggedIn()) return Json(new { success = false, message = "Unauthorized" }, JsonRequestBehavior.AllowGet);

            var item = _context.GoiTaps.Find(id);
            if (item == null)
                return Json(new { success = false, message = "Không tìm thấy" }, JsonRequestBehavior.AllowGet);

            return Json(new
            {
                success = true,
                data = new { item.MaGoiTap, item.TenGoi, item.Gia, item.ThoiHan, item.MoTa, item.TrangThai }
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Create(GoiTap model)
        {
            if (!IsAdminLoggedIn()) return Json(new { success = false, message = "Unauthorized" });

            if (string.IsNullOrEmpty(model.TenGoi) || string.IsNullOrWhiteSpace(model.TenGoi))
                ModelState.AddModelError("TenGoi", "Vui lòng nhập tên gói tập!");

            if (model.Gia <= 0)
                ModelState.AddModelError("Gia", "Giá gói tập phải lớn hơn 0!");

            if (model.ThoiHan <= 0)
                ModelState.AddModelError("ThoiHan", "Thời hạn gói tập phải ít nhất là 1 tháng!");

            if (string.IsNullOrEmpty(model.MoTa) || string.IsNullOrWhiteSpace(model.MoTa))
                ModelState.AddModelError("MoTa", "Vui lòng nhập mô tả chi tiết cho gói tập!");

            if (ModelState.IsValid)
            {
                try
                {
                    model.TrangThai = 1;
                    _context.GoiTaps.Add(model);
                    _context.SaveChanges();
                    return Json(new { success = true, message = "Thêm gói tập mới thành công!" });
                }
                catch (Exception ex)
                {
                    return Json(new { success = false, message = "Lỗi: " + ex.Message });
                }
            }

            var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
            return Json(new { success = false, message = "Dữ liệu không hợp lệ", errors = errors });
        }

        [HttpPost]
        public JsonResult Update(GoiTap model)
        {
            if (!IsAdminLoggedIn()) return Json(new { success = false, message = "Unauthorized" });

            if (string.IsNullOrEmpty(model.TenGoi) || string.IsNullOrWhiteSpace(model.TenGoi))
                ModelState.AddModelError("TenGoi", "Vui lòng nhập tên gói tập!");

            if (model.Gia <= 0)
                ModelState.AddModelError("Gia", "Giá gói tập phải lớn hơn 0!");

            if (model.ThoiHan <= 0)
                ModelState.AddModelError("ThoiHan", "Thời hạn gói tập phải ít nhất là 1 tháng!");

            if (string.IsNullOrEmpty(model.MoTa) || string.IsNullOrWhiteSpace(model.MoTa))
                ModelState.AddModelError("MoTa", "Vui lòng nhập mô tả chi tiết cho gói tập!");

            if (ModelState.IsValid)
            {
                try
                {
                    if (model.TrangThai == 0)
                    {
                        var checkDangKyGoi = _context.DangKyGoiTaps.FirstOrDefault(t => t.MaGoiTap == model.MaGoiTap);
                        if (checkDangKyGoi != null)
                        {
                            return Json(new { success = false, message = "Không thể chuyển đổi trạng thái gói tập vì có người đang đăng ký gói tập này" });
                        }
                    }

                    var temp = _context.GoiTaps.FirstOrDefault(t => t.MaGoiTap == model.MaGoiTap);
                    if (temp == null) return Json(new { success = false, message = "Không tìm thấy gói tập" });

                    temp.TenGoi = model.TenGoi;
                    temp.ThoiHan = model.ThoiHan;
                    temp.Gia = model.Gia;
                    temp.TrangThai = model.TrangThai;
                    temp.MoTa = model.MoTa;

                    _context.SaveChanges();
                    return Json(new { success = true, message = "Cập nhật thành công" });
                }
                catch (Exception ex)
                {
                    return Json(new { success = false, message = "Lỗi: " + ex.Message });
                }
            }

            var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
            return Json(new { success = false, message = "Dữ liệu không hợp lệ", errors = errors });
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            // Check quyền Admin
            if (!IsAdminLoggedIn()) return Json(new { success = false, message = "Unauthorized" });

            // Tìm gói tập
            var goiTap = _context.GoiTaps.FirstOrDefault(t => t.MaGoiTap == id);
            if (goiTap == null)
            {
                return Json(new { success = false, message = "Không tìm thấy gói tập!" });
            }

            try
            {

                var checkDangKy = _context.DangKyGoiTaps.Any(x => x.MaGoiTap == id);


                if (checkDangKy)
                {
                    // Yêu cầu: Gói đang có người tập thì KHÔNG ĐƯỢC làm gì cả
                    return Json(new { success = false, message = "Gói tập này đang có hội viên sử dụng, không thể ngừng kinh doanh!" });
                }
                else
                {
               
                    goiTap.TrangThai = 0; // Giả sử 0 là Ngừng kinh doanh
                    _context.SaveChanges();

                    return Json(new { success = true, message = "Đã chuyển gói tập sang trạng thái 'Ngừng kinh doanh' thành công!" });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi hệ thống: " + ex.Message });
            }
        }
    }
}