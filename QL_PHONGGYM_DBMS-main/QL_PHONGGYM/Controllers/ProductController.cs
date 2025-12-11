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
            var sanpham = list.FirstOrDefault(sp => sp.MaSP == id);

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
            ViewBag.SpDiCung = list.Where(sp => sp.LoaiSP == sanpham.LoaiSP && sp.MaSP != sanpham.MaSP && sanpham.TrangThai == 1).Take(5).ToList();
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
                sp.MaSP != sanpham.MaSP && sanpham.TrangThai == 1 &&
                ((sp.GiaKhuyenMai ?? sp.DonGia) >= giaMin && (sp.GiaKhuyenMai ?? sp.DonGia) <= giaMax)
            ).Take(5).ToList();
            return View(sanpham);


        }

        public ActionResult Product(string search, string loaisp, string hang, string xuatXu, decimal? minPrice, decimal? maxPrice, bool? khuyenmai, bool? conhang, int? sapXepTheoTen, int? sapXepTheoGia, int? page)
        {

            IQueryable<SanPhamViewModel> query = _productRepo.GetSanPhams().AsQueryable();

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(p => p.TenSP.ToLower().Contains(search.ToLower().Trim()));
            }

            if (!string.IsNullOrEmpty(xuatXu))
                query = query.Where(p => p.XuatXu.Contains(xuatXu));

            if (!string.IsNullOrEmpty(loaisp))
            {
                var loaiList = loaisp.Split(',');
                query = query.Where(p => loaiList.Contains(p.LoaiSP));
            }

            if (!string.IsNullOrEmpty(hang))
            {
                var hangList = hang.Split(',');
                query = query.Where(p => hangList.Contains(p.Hang));
            }

            if (minPrice.HasValue)
                query = query.Where(p => p.DonGia >= minPrice.Value);

            if (maxPrice.HasValue)
                query = query.Where(p => p.DonGia <= maxPrice.Value);

            if (khuyenmai == true)
                query = query.Where(p => p.GiaKhuyenMai < p.DonGia && p.GiaKhuyenMai != null);

            if (conhang == true)
                query = query.Where(p => p.SoLuongTon > 0);

            if (sapXepTheoTen.HasValue)
            {
                if (sapXepTheoTen.Value == 0)
                    query = query.OrderBy(p => p.SoLuongTon == 0).ThenBy(p => p.TenSP);
                else
                    query = query.OrderBy(p => p.SoLuongTon == 0).ThenByDescending(p => p.TenSP);
            }
            else if (sapXepTheoGia.HasValue)
            {
                if (sapXepTheoGia.Value == 0)
                    query = query.OrderBy(p => p.SoLuongTon == 0).ThenBy(p => p.GiaKhuyenMai ?? p.DonGia);
                else
                    query = query.OrderBy(p => p.SoLuongTon == 0).ThenByDescending(p => p.GiaKhuyenMai ?? p.DonGia);
            }
            else
            {                
                query = query.OrderBy(p => p.SoLuongTon == 0).ThenByDescending(p => p.SoLuongTon);
            }


            int pageSize = 12;
            int pageNumber = (page ?? 1);

            int totalItems = query.Count();
            ViewBag.TotalPages = (int)Math.Ceiling((double)totalItems / pageSize);
            ViewBag.CurrentPage = pageNumber;
            List<SanPhamViewModel> list = query.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
            ViewBag.LoaiSP = _productRepo.GetLoaiSanPhams().ToList();
            var allProducts = _productRepo.GetSanPhams();
            ViewBag.Hang = allProducts.Where(p => p.Hang != null).Select(p => p.Hang).Distinct().ToList();


            return View(list);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Product(FormCollection form)
        {
            
            string loaiList = string.Join(",", form.GetValues("loaisanpham") ?? new string[] { });
            string hangList = string.Join(",", form.GetValues("hang") ?? new string[] { });
            string giaRange = form["gia"];
            string searchText = form["search"];

            decimal? minPrice = null;
            decimal? maxPrice = null;

            if (!string.IsNullOrEmpty(giaRange))
            {
                var parts = giaRange.Split('-');
                if (parts.Length == 2)
                {
                    minPrice = Convert.ToDecimal(parts[0]);
                    maxPrice = Convert.ToDecimal(parts[1]);
                }
            }

            bool khuyenMai = form["khuyenmai"] == "on";
            bool conHang = form["conhang"] == "on";
            return RedirectToAction("Product", new
            {
                search = searchText,
                loaisp = loaiList,
                hang = hangList,
                minPrice = minPrice,
                maxPrice = maxPrice,
                khuyenmai = khuyenMai,
                conhang = conHang,
                page = 1
            });
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
