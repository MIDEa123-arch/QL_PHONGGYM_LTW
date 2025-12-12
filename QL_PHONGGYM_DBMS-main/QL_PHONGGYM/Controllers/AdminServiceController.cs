using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class AdminServiceController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Index(int page = 1) 
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var query = _context.GoiTaps.AsQueryable();
            int pageSize = 10; 
            int totalRecord = query.Count(); 
            int totalPages = (int)Math.Ceiling((double)totalRecord / pageSize); 

            var list = query.OrderBy(x => x.Gia)
                            .Skip((page - 1) * pageSize) 
                            .Take(pageSize)              
                            .ToList();
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = page;
            return View(list);
        }

        public ActionResult Create()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");
            return View(new GoiTap());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(GoiTap model)
        {
            if (string.IsNullOrEmpty(model.TenGoi) || string.IsNullOrWhiteSpace(model.TenGoi))
            {
                ModelState.AddModelError("TenGoi", "Vui lòng nhập tên gói tập!");
            }
            
            if (model.Gia <= 0)
            {
                ModelState.AddModelError("Gia", "Giá gói tập phải lớn hơn 0!");
            }
            if (model.ThoiHan <= 0)
            {
                ModelState.AddModelError("ThoiHan", "Thời hạn gói tập phải ít nhất là 1 tháng!");
            }
            if (string.IsNullOrEmpty(model.MoTa) || string.IsNullOrWhiteSpace(model.MoTa))
            {
                ModelState.AddModelError("MoTa", "Vui lòng nhập mô tả chi tiết cho gói tập!");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    
                    model.TrangThai = 1;
                    _context.GoiTaps.Add(model);
                    _context.SaveChanges();
                    TempData["ThongBao"] = "Thêm gói tập mới thành công!";
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi: " + ex.Message;
                }
            }
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");
            var item = _context.GoiTaps.Find(id);
            if (item == null) return HttpNotFound();
            return View(item);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(GoiTap model)
        {
            if (string.IsNullOrEmpty(model.TenGoi) || string.IsNullOrWhiteSpace(model.TenGoi))
            {
                ModelState.AddModelError("TenGoi", "Vui lòng nhập tên gói tập!");
            }
            
            if (model.Gia <= 0)
            {
                ModelState.AddModelError("Gia", "Giá gói tập phải lớn hơn 0!");
            }
            if (model.ThoiHan <= 0)
            {
                ModelState.AddModelError("ThoiHan", "Thời hạn gói tập phải ít nhất là 1 tháng!");
            }
            if (string.IsNullOrEmpty(model.MoTa) || string.IsNullOrWhiteSpace(model.MoTa))
            {
                ModelState.AddModelError("MoTa", "Vui lòng nhập mô tả chi tiết cho gói tập!");
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (model.TrangThai == 0)
                    {
                        var checkDangKyGoi = _context.DangKyGoiTaps.FirstOrDefault(t => t.MaGoiTap == model.MaGoiTap);
                        if(checkDangKyGoi != null)
                        {
                            ModelState.AddModelError("TrangThai", "Không thể chuyển đổi trạng thái gói tập vì có người đang đăng ký gói tập này");
                            return View(model);
                        }
                    }
                    GoiTap temp = _context.GoiTaps.FirstOrDefault(t => t.MaGoiTap == model.MaGoiTap);
                    temp.TenGoi = model.TenGoi;
                    temp.ThoiHan = model.ThoiHan;
                    temp.Gia= model.Gia;
                    temp.TrangThai= model.TrangThai;
                    temp.MoTa= model.MoTa;
                    _context.SaveChanges();
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi: " + ex.Message;
                }
            }
            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            var goiTap = _context.GoiTaps.FirstOrDefault(t=>t.MaGoiTap==id);
            if (goiTap == null)
            {
                return Json(new { success = false, message = "Không tìm thấy gói tập!" });
            }
            try
            {
                var checkDangKyGoiTap = _context.DangKyGoiTaps.FirstOrDefault(x => x.MaGoiTap == id);
                if (checkDangKyGoiTap==null)
                {
                    goiTap.TrangThai = 0;
                    _context.SaveChanges();
                    return Json(new { success = true, message = "Gói tập đang được sử dụng nên hệ thống đã chuyển sang trạng thái 'Ngừng kinh doanh'!" });
                }
                else
                {
                    return Json(new { success = false, message = "Không thể xóa gói tập vì có khách hàng đang đăng ký gói tập" });
                }
            }
            catch
            {
                return Json(new { success = false, message = "Gói tập này đang có người sử dụng, không thể xóa!" });
            }
        }
    }
}