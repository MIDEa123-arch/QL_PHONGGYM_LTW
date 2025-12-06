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

        public ActionResult Index(string search = "")
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var query = _context.KhachHangs.Include("LoaiKhachHang").AsQueryable();

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(k => k.TenKH.Contains(search) || k.SDT.Contains(search));
            }

            ViewBag.CurrentSearch = search;
            return View(query.OrderByDescending(k => k.MaKH).ToList());
        }

        public ActionResult Edit(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");
            var item = _context.KhachHangs.Find(id);
            if (item == null) return HttpNotFound();

            ViewBag.MaLoaiKH = new SelectList(_context.LoaiKhachHangs, "MaLoaiKH", "TenLoai", item.MaLoaiKH);
            return View(item);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(KhachHang model)
        {
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
                        return RedirectToAction("Index");
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

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var kh = _context.KhachHangs.Find(id);
                if (kh == null) return Json(new { success = false, message = "Không tìm thấy khách hàng" });

                _context.KhachHangs.Remove(kh);
                _context.SaveChanges();

                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false, message = "Khách hàng này đã có dữ liệu giao dịch/đăng ký, không thể xóa!" });
            }
        }
    }
}