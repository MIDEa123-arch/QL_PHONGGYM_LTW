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

        public ActionResult Index()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");
            var list = _context.GoiTaps.OrderBy(x => x.Gia).ToList();
            return View(list);
        }

        public ActionResult Create()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(GoiTap model)
        {
            if (string.IsNullOrEmpty(model.TenGoi) || string.IsNullOrWhiteSpace(model.TenGoi))
            {
                ModelState.AddModelError("TenGoi", "Vui lòng nhập tên gói tập!");
            }
            else
            {
                var checkTen = _context.GoiTaps.FirstOrDefault(g => g.TenGoi == model.TenGoi);
                if (checkTen != null)
                {
                    ModelState.AddModelError("TenGoi", "Tên gói tập này đã tồn tại!");
                }
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
            else
            {
                var checkTen = _context.GoiTaps.FirstOrDefault(g => g.TenGoi == model.TenGoi&&g.MaGoiTap!=model.MaGoiTap);
                if (checkTen != null)
                {
                    ModelState.AddModelError("TenGoi", "Tên gói tập này đã tồn tại!");
                }
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
                //try
                //{
                    GoiTap temp = _context.GoiTaps.FirstOrDefault(t => t.MaGoiTap == model.MaGoiTap);
                    temp.TenGoi = model.TenGoi;
                    temp.ThoiHan = model.ThoiHan;
                    temp.Gia= model.Gia;
                    temp.MoTa= model.MoTa;
                    _context.SaveChanges();
                    return RedirectToAction("Index");
                //}
                //catch (Exception ex)
                //{
                //    ViewBag.Error = "Lỗi: " + ex.Message;
                //}
            }
            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var item = _context.GoiTaps.Find(id);
                if (item == null) return Json(new { success = false, message = "Không tìm thấy gói tập" });

                _context.GoiTaps.Remove(item);
                _context.SaveChanges();

                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false, message = "Gói tập này đang có người sử dụng, không thể xóa!" });
            }
        }
    }
}