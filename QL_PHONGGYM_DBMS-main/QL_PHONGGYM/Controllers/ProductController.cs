using QL_PHONGGYM.Models;
using QL_PHONGGYM.Repositories;
using QL_PHONGGYM.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;

namespace QL_PHONGGYM.Controllers
{
    public class ProductController : Controller
    {
        private readonly ProductRepository _productRepo;
        private readonly CartRepository _cartRepo;

        public ProductController()
        {
            _productRepo = new ProductRepository(new QL_PHONGGYMEntities());
            _cartRepo = new CartRepository(new QL_PHONGGYMEntities());
        }
        [HttpPost]
        public JsonResult AddToCart(int maSP, int soLuong)
        {
            int maKH = (int)Session["MaKH"];

            try
            {
                bool result = _cartRepo.AddToCart(maKH, maSP, soLuong);

                if (result)
                {
                    return Json(new { success = true, message = "Thêm vào giỏ hàng thành công!" });
                }
                else
                {
                    return Json(new { success = false, message = "Thêm vào giỏ hàng thất bại." });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        public ActionResult ProductDetail(int id, string url)
        {

            var list = _productRepo.GetSanPhams().ToList();
            var sanpham = list.FirstOrDefault(sp => sp.MaSP == id && sp.TrangThai == 1);

            if (sanpham == null)
            {
                TempData["Error"] = "Sản phẩm này hiện đã ngừng bán!";
                if (url != null)
                {
                    return Redirect(url);
                }
                else
                    return RedirectToAction("Index", "Home");
            }
            ViewBag.SpDiCung = list.Where(sp => sp.LoaiSP == sanpham.LoaiSP && sp.MaSP != sanpham.MaSP).Take(5).ToList();
            decimal giaHienTai = sanpham.GiaKhuyenMai ?? sanpham.DonGia;
            decimal giaMin, giaMax;

            if (giaHienTai < 1000000)
            {
                giaMin = Math.Floor(giaHienTai / 100000) * 100000;
                giaMax = giaMin + 99999;
            }
            else
            {
                giaMin = Math.Floor(giaHienTai / 1000000) * 1000000;
                giaMax = giaMin + 999999;
            }

            ViewBag.SpCungPhanKhuc = list.Where(sp =>
                sp.MaSP != sanpham.MaSP &&
                ((sp.GiaKhuyenMai ?? sp.DonGia) >= giaMin && (sp.GiaKhuyenMai ?? sp.DonGia) <= giaMax)
            ).Take(5).ToList();
            return View(sanpham);


        }

        public ActionResult Product(string loaisp, string hang, string xuatXu, decimal? maxPrice, decimal? minPrice, int? sapXepTheoTen, int? sapXepTheoGia)
        {
            List<SanPhamViewModel> list;

            if (loaisp != null || hang != null || xuatXu != null || maxPrice != null || minPrice != null)
            {
                TempData["CurrentList"] = null;
            }    

            if (TempData["CurrentList"] != null)
            {
                list = TempData["CurrentList"] as List<SanPhamViewModel>;
            }
            else
            {
                list = _productRepo.GetSanPhams().ToList();
            }
            if (!string.IsNullOrEmpty(xuatXu))
                list = list.Where(p => p.XuatXu.Contains(xuatXu)).ToList();

            if (!string.IsNullOrEmpty(loaisp))
                list = list.Where(p => p.LoaiSP.Contains(loaisp)).ToList();

            if (!string.IsNullOrEmpty(hang))
                list = list.Where(p => p.Hang.Contains(hang)).ToList();

            if (minPrice.HasValue)
                list = list.Where(p => p.DonGia >= minPrice.Value).ToList();

            if (maxPrice.HasValue)
                list = list.Where(p => p.DonGia <= maxPrice.Value).ToList();

            if (sapXepTheoTen != null)
            {
                if (sapXepTheoTen == 0)
                    list = list.OrderBy(p => p.TenSP).ToList();
                else
                    list = list.OrderByDescending(p => p.TenSP).ToList();
            }

            if (sapXepTheoGia != null)
            {
                if (sapXepTheoGia == 0)
                    list = list.OrderBy(p => p.DonGia).ToList();
                else
                    list = list.OrderByDescending(p => p.DonGia).ToList();
            }

            ViewBag.LoaiSP = _productRepo.GetLoaiSanPhams().ToList();
            var allProducts = _productRepo.GetSanPhams();
            ViewBag.Hang = allProducts.Where(p => p.Hang != null).Select(p => p.Hang).Distinct().ToList();

            TempData["CurrentList"] = list;

            return View(list);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Product(FormCollection form, int? sapXepTheoTen, int? sapXepTheoGia)
        {
            var list = _productRepo.GetSanPhams().AsEnumerable();

            string keyword = form["search"];
            if (!string.IsNullOrEmpty(keyword))
            {
                list = list.Where(sp => sp.TenSP.ToLower().Contains(keyword.ToLower()));
            }

            bool khuyenMai = form["khuyenmai"] == "on";
            bool conHang = form["conhang"] == "on";

            if (khuyenMai) list = list.Where(p => p.GiaKhuyenMai != null);
            if (conHang) list = list.Where(p => p.SoLuongTon > 0);

            string gia = form["gia"];
            if (!string.IsNullOrEmpty(gia))
            {
                var parts = gia.Split('-');
                decimal min = Convert.ToDecimal(parts[0]);
                decimal max = Convert.ToDecimal(parts[1]);
                list = list.Where(p => p.DonGia >= min && p.DonGia <= max);
            }

            var loaiList = form.GetValues("loaisanpham");
            var hangList = form.GetValues("hang");

            if (loaiList != null) list = list.Where(p => loaiList.Contains(p.LoaiSP));
            if (hangList != null) list = list.Where(p => hangList.Contains(p.Hang));

            if (sapXepTheoTen != null)
                list = sapXepTheoTen == 0 ? list.OrderBy(p => p.TenSP) : list.OrderByDescending(p => p.TenSP);

            if (sapXepTheoGia != null)
                list = sapXepTheoGia == 0 ? list.OrderBy(p => p.DonGia) : list.OrderByDescending(p => p.DonGia);

            ViewBag.LoaiSP = _productRepo.GetLoaiSanPhams().ToList();
            ViewBag.Hang = _productRepo.GetSanPhams()
                                       .Where(p => p.Hang != null)
                                       .Select(p => p.Hang)
                                       .Distinct()
                                       .ToList();

            TempData["CurrentList"] = list.ToList();

            return View(list.ToList());
        }


        public ActionResult ClassMenu()
        {
            var list = _productRepo.GetChuyenMons();
            return PartialView(list);
        }

        public ActionResult CategoriesMenu()
        {
            var list = _productRepo.GetLoaiSanPhams();
            return PartialView(list);
        }
        public ActionResult BrandMenu()
        {
            var hangs = _productRepo.GetHangsByLoai();
            return PartialView(hangs);
        }

        public ActionResult OriginMenu()
        {
            var xuatsu = _productRepo.GetXuatSu();
            return PartialView(xuatsu);
        }
    }
}
