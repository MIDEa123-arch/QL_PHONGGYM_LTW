using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace QL_PHONGGYM.Controllers
{
    public class AdminProductController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Index()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var listSP = _context.SanPhams
                .Include(s => s.LoaiSanPham)
                .OrderByDescending(s => s.MaSP)
                .ToList();

            return View(listSP);
        }
        public ActionResult Create()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            ViewBag.MaLoaiSP = new SelectList(_context.LoaiSanPhams, "MaLoaiSP", "TenLoaiSP");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(SanPham model, HttpPostedFileBase[] images)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _context.SanPhams.Add(model);
                    _context.SaveChanges();

                    if (images != null && images.Length > 0 && images[0] != null)
                    {
                        bool isFirst = true;
                        foreach (var file in images)
                        {
                            if (file.ContentLength > 0)
                            {
                                string fileName = Path.GetFileName(file.FileName);
                                string extension = Path.GetExtension(fileName);
                                string uniqueName = Guid.NewGuid().ToString() + extension;

                                string path = Path.Combine(Server.MapPath("~/Content/Images/"), uniqueName);
                                file.SaveAs(path);

                                var hinhAnh = new HINHANH
                                {
                                    MaSP = model.MaSP,
                                    Url = "/Content/Images/" + uniqueName,
                                    IsMain = isFirst
                                };
                                _context.HINHANHs.Add(hinhAnh);
                                isFirst = false;
                            }
                        }
                        _context.SaveChanges();
                    }

                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ViewBag.Error = "Lỗi: " + ex.Message;
                }
            }

            ViewBag.MaLoaiSP = new SelectList(_context.LoaiSanPhams, "MaLoaiSP", "TenLoaiSP", model.MaLoaiSP);
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var sanPham = _context.SanPhams.Find(id);
            if (sanPham == null) return HttpNotFound();

            ViewBag.MaLoaiSP = new SelectList(_context.LoaiSanPhams, "MaLoaiSP", "TenLoaiSP", sanPham.MaLoaiSP);
            return View(sanPham);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(SanPham model, HttpPostedFileBase[] images)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var sp = _context.SanPhams.Find(model.MaSP);
                    if (sp != null)
                    {
                        sp.TenSP = model.TenSP;
                        sp.MaLoaiSP = model.MaLoaiSP;
                        sp.DonGia = model.DonGia;
                        sp.GiaKhuyenMai = model.GiaKhuyenMai;
                        sp.SoLuongTon = model.SoLuongTon;
                        sp.Hang = model.Hang;
                        sp.XuatXu = model.XuatXu;
                        sp.BaoHanh = model.BaoHanh;
                        sp.MoTaChung = model.MoTaChung;
                        sp.MoTaChiTiet = model.MoTaChiTiet;

                        if (images != null && images.Length > 0 && images[0] != null)
                        {
                            foreach (var file in images)
                            {
                                if (file.ContentLength > 0)
                                {
                                    string fileName = Path.GetFileName(file.FileName);
                                    string extension = Path.GetExtension(fileName);
                                    string uniqueName = Guid.NewGuid().ToString() + extension;
                                    string path = Path.Combine(Server.MapPath("~/Content/Images/"), uniqueName);
                                    file.SaveAs(path);

                                    var hinhAnh = new HINHANH
                                    {
                                        MaSP = sp.MaSP,
                                        Url = "/Content/Images/" + uniqueName,
                                        IsMain = false
                                    };
                                    _context.HINHANHs.Add(hinhAnh);
                                }
                            }
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
            ViewBag.MaLoaiSP = new SelectList(_context.LoaiSanPhams, "MaLoaiSP", "TenLoaiSP", model.MaLoaiSP);
            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var sp = _context.SanPhams.Find(id);
                if (sp == null) return Json(new { success = false, message = "Không tìm thấy sản phẩm" });

                var images = _context.HINHANHs.Where(x => x.MaSP == id).ToList();
                _context.HINHANHs.RemoveRange(images);

                _context.SanPhams.Remove(sp);
                _context.SaveChanges();

                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false, message = "Không thể xóa sản phẩm này vì đã có trong hóa đơn. Hãy chỉnh số lượng tồn về 0 để ngừng bán." });
            }
        }
    }
}