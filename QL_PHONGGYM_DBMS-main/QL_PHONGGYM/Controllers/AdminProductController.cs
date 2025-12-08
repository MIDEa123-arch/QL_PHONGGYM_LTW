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

        public ActionResult Index(string search = "", int status = -1)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var query = _context.SanPhams
                .Include(s => s.LoaiSanPham)
                .OrderByDescending(s => s.MaSP)
                .ToList();
            if (!string.IsNullOrEmpty(search))
            {
                query=query.Where(t=>t.TenSP.ToLower().Contains(search.ToLower())).ToList();
            }
            if (status != -1)
            {
                query = query.Where(x => x.TrangThai == status).ToList();
            }
            ViewBag.CurrentSearch = search;
            ViewBag.CurrentStatus = status;
            var list = query.OrderByDescending(x => x.MaSP).ToList();
            return View(list);
        }
        public ActionResult Create()
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            ViewBag.MaLoaiSP = new SelectList(_context.LoaiSanPhams, "MaLoaiSP", "TenLoaiSP");
            return View(new SanPham { SoLuongTon = 100, DonGia = 0 });
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(SanPham model, HttpPostedFileBase[] images, string strDonGia, string strGiaKhuyenMai)
        {
            if (!string.IsNullOrEmpty(strDonGia))
            {
                string cleanGia = strDonGia.Replace(".", "").Replace(",", "").Trim();
                if (decimal.TryParse(cleanGia, out decimal donGia))
                {
                    model.DonGia = donGia;
                }
                else
                {
                    ModelState.AddModelError("DonGia", "Giá bán không hợp lệ");
                }
            }
            else
            {
                ModelState.AddModelError("DonGia", "Vui lòng nhập giá bán");
            }
            if (!string.IsNullOrEmpty(strGiaKhuyenMai))
            {
                string cleanGiaKM = strGiaKhuyenMai.Replace(".", "").Replace(",", "").Trim();
                if (decimal.TryParse(cleanGiaKM, out decimal giaKM))
                {
                    model.GiaKhuyenMai = giaKM;
                }
            }
            if (model.GiaKhuyenMai.HasValue && model.GiaKhuyenMai.Value > 0)
            {
                if (model.GiaKhuyenMai.Value >= model.DonGia)
                {
                    ModelState.AddModelError("GiaKhuyenMai", "Giá khuyến mãi phải nhỏ hơn giá bán gốc!");
                }
            }
            if (string.IsNullOrEmpty(model.TenSP))
            {
                ModelState.AddModelError("TenSP", "Vui lòng nhập tên sản phẩm");
            }

            if (model.MaLoaiSP == 0) 
            {
                ModelState.AddModelError("MaLoaiSP", "Vui lòng chọn danh mục");
            }
            if (string.IsNullOrEmpty(model.MoTaChung))
            {
                ModelState.AddModelError("MoTaChung", "Vui lòng nhập mô tả ngắn");
            }
            if (model.SoLuongTon == 0) 
            {
                ModelState.AddModelError("SoLuongTon", "Vui lòng nhập số lượng tồn");
            }
            if (!string.IsNullOrEmpty(model.TenSP))
            {
                bool isDuplicate = _context.SanPhams.Any(x => x.TenSP.ToLower() == model.TenSP.ToLower());
                if (isDuplicate)
                {
                    ModelState.AddModelError("TenSP", "Tên sản phẩm này đã tồn tại, vui lòng chọn tên khác!");
                }
            }
            if (ModelState.IsValid)
            {
                try
                {
                    if (!string.IsNullOrEmpty(model.MoTaChiTiet))
                    {
                        model.MoTaChiTiet = model.MoTaChiTiet.Replace("\r\n", "|").Replace("\n", "|");
                    }
                    model.TrangThai = 1;
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
        public ActionResult Edit(SanPham model, HttpPostedFileBase[] images, string strDonGia, string strGiaKhuyenMai)
        {
            if (string.IsNullOrEmpty(strDonGia))
            {
                ModelState.AddModelError("DonGia", "Vui lòng nhập giá bán!");
            }
            else
            {
                string cleanGia = strDonGia.Replace(".", "").Replace(",", "").Trim();
                if (decimal.TryParse(cleanGia, out decimal donGia)) model.DonGia = donGia;
                else ModelState.AddModelError("DonGia", "Giá bán không hợp lệ!");
            }
            if (!string.IsNullOrEmpty(strGiaKhuyenMai))
            {
                string cleanGiaKM = strGiaKhuyenMai.Replace(".", "").Replace(",", "").Trim();
                if (decimal.TryParse(cleanGiaKM, out decimal giaKM)) model.GiaKhuyenMai = giaKM;
            }
            if (model.GiaKhuyenMai.HasValue && model.GiaKhuyenMai.Value > 0)
            {
                if (model.GiaKhuyenMai.Value >= model.DonGia)
                {
                    ModelState.AddModelError("GiaKhuyenMai", "Giá khuyến mãi phải nhỏ hơn giá bán gốc!");
                }
            }
            if (string.IsNullOrEmpty(model.TenSP))
            {
                ModelState.AddModelError("TenSP", "Vui lòng nhập tên sản phẩm!");
            }
            if (model.MaLoaiSP == 0)
            {
                ModelState.AddModelError("MaLoaiSP", "Vui lòng chọn danh mục!");
            }
            if (string.IsNullOrEmpty(model.MoTaChung))
            {
                ModelState.AddModelError("MoTaChung", "Vui lòng nhập mô tả ngắn!");
            }
            if (model.SoLuongTon == 0)
            {
                ModelState.AddModelError("SoLuongTon", "Vui lòng nhập số lượng!");
            }
            if (!string.IsNullOrEmpty(model.TenSP))
            {
                bool isDuplicate = _context.SanPhams.Any(x =>
                    x.TenSP.ToLower() == model.TenSP.Trim().ToLower()
                    && x.MaSP != model.MaSP 
                );

                if (isDuplicate)
                {
                    ModelState.AddModelError("TenSP", "Tên sản phẩm này đã được sử dụng bởi sản phẩm khác!");
                }
            }
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
            var sp = _context.SanPhams.FirstOrDefault(t=>t.MaSP==id);
            if (sp == null)
            {
                return Json(new { success = false, message = "Không tìm thấy sản phẩm!" });
            }

            try
            {
                bool daTungBan = _context.ChiTietHoaDons.Any(x => x.MaSP == id);
                if (daTungBan)
                {
                    sp.TrangThai = 0;
                    _context.SaveChanges();
                    return Json(new { success = true, message = "Sản phẩm đã từng được bán (có trong hóa đơn). Hệ thống đã chuyển trạng thái sang 'Ngừng kinh doanh'!" });
                }
                else
                {
                    var images = _context.HINHANHs.Where(x => x.MaSP == id).ToList();
                    if (images.Any())
                    {
                        _context.HINHANHs.RemoveRange(images);
                    }
                    _context.SanPhams.Remove(sp);
                    _context.SaveChanges();

                    return Json(new { success = true, message = "Đã xóa vĩnh viễn sản phẩm và hình ảnh kèm theo!" });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi hệ thống: " + ex.Message });
            }
        }
    }
}