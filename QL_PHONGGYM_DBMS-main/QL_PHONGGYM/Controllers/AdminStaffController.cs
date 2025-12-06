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

        public ActionResult Index()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var list = _context.NhanViens.Include("ChucVu").OrderByDescending(n => n.MaNV).ToList();
            return View(list);
        }

        public ActionResult Create()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            ViewBag.MaChucVu = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(NhanVien model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    if (_context.NhanViens.Any(x => x.TenDangNhap == model.TenDangNhap))
                    {
                        ModelState.AddModelError("TenDangNhap", "Tên đăng nhập này đã tồn tại");
                    }
                    else
                    {
                        _context.NhanViens.Add(model);
                        _context.SaveChanges();
                        return RedirectToAction("Index");
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi: " + ex.Message;
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
                        return RedirectToAction("Index");
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi: " + ex.Message;
                }
            }
            ViewBag.MaChucVu = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", model.MaChucVu);
            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var nv = _context.NhanViens.Find(id);
                if (nv == null) return Json(new { success = false, message = "Không tìm thấy nhân viên" });

                _context.NhanViens.Remove(nv);
                _context.SaveChanges();

                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false, message = "Nhân viên này đang phụ trách lớp hoặc có lịch tập, không thể xóa!" });
            }
        }
    }
}