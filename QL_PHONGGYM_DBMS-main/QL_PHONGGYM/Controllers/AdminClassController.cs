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

        public ActionResult Index()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var list = _context.LopHocs
                .Include("ChuyenMon")
                .Include("NhanVien")
                .OrderByDescending(l => l.NgayBatDau)
                .ToList();

            return View(list);
        }

        public ActionResult Create()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            ViewBag.MaCM = new SelectList(_context.ChuyenMons, "MaCM", "TenChuyenMon");

            ViewBag.MaNV = new SelectList(_context.NhanViens, "MaNV", "TenNV");

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(LopHoc model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _context.LopHocs.Add(model);
                    _context.SaveChanges();
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi: " + ex.Message;
                }
            }

            ViewBag.MaCM = new SelectList(_context.ChuyenMons, "MaCM", "TenChuyenMon", model.MaCM);
            ViewBag.MaNV = new SelectList(_context.NhanViens, "MaNV", "TenNV", model.MaNV);
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");
            var item = _context.LopHocs.Find(id);
            if (item == null) return HttpNotFound();

            ViewBag.MaCM = new SelectList(_context.ChuyenMons, "MaCM", "TenChuyenMon", item.MaCM);
            ViewBag.MaNV = new SelectList(_context.NhanViens, "MaNV", "TenNV", item.MaNV);
            return View(item);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(LopHoc model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var lop = _context.LopHocs.Find(model.MaLop);
                    if (lop != null)
                    {
                        lop.TenLop = model.TenLop;
                        lop.MaCM = model.MaCM;
                        lop.MaNV = model.MaNV;
                        lop.HocPhi = model.HocPhi;
                        lop.NgayBatDau = model.NgayBatDau;
                        lop.NgayKetThuc = model.NgayKetThuc;
                        lop.SoBuoi = model.SoBuoi;
                        lop.SiSoToiDa = model.SiSoToiDa;

                        _context.SaveChanges();
                        return RedirectToAction("Index");
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi: " + ex.Message;
                }
            }
            ViewBag.MaCM = new SelectList(_context.ChuyenMons, "MaCM", "TenChuyenMon", model.MaCM);
            ViewBag.MaNV = new SelectList(_context.NhanViens, "MaNV", "TenNV", model.MaNV);
            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var item = _context.LopHocs.Find(id);
                if (item == null) return Json(new { success = false, message = "Không tìm thấy lớp" });

                _context.LopHocs.Remove(item);
                _context.SaveChanges();
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false, message = "Lớp học này đã có người đăng ký, không thể xóa!" });
            }
        }
    }
}