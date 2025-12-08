using QL_PHONGGYM.Models;
using QL_PHONGGYM.Repositories;
using QL_PHONGGYM.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class CartCheckoutController : Controller
    {
        private readonly CartRepository _cartRepo;
        private readonly KhachHangRepository _cusRepo;
        private readonly AccountRepository _accountRepo;

        public CartCheckoutController()
        {
            _cartRepo = new CartRepository(new QL_PHONGGYMEntities());
            _cusRepo = new KhachHangRepository(new QL_PHONGGYMEntities());
            _accountRepo = new AccountRepository(new QL_PHONGGYMEntities());
        }

        

        public ActionResult CheckoutDangKyPT(int maHD, string url)
        {

            var HoaDonPT = _cartRepo.HoaDonPT(maHD);            
            var kh = _cusRepo.ThongTinKH((int)Session["maKH"]);

            ViewBag.HoaDon = maHD;
            ViewBag.Khachhang = kh;
            ViewBag.LoaiKh = kh.MaLoaiKH.HasValue ? _cusRepo.LoaiKh(kh.MaLoaiKH.Value) : null;
            ViewBag.Url = url;
            return View(HoaDonPT);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TaoHoaDon(FormCollection form)
        {
            var cart = (List<GioHangViewModel>)Session["thanhtoan"];
            int maKH = (int)Session["MaKH"];
            var diaChi = Session["Diachi"] as DiaChi;

            try
            {
                _cartRepo.TaoHoaDon(form, maKH, cart, null, null, diaChi);
                Session["GioHang"] = _accountRepo.GetCartCount(maKH);
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;
                return RedirectToAction("ThanhToanfinal");
            }

            return RedirectToAction("ThanhToanThanhCong");
        }


        public ActionResult ThanhToanfinal()
        {
            int maKH = (int)Session["MaKH"];
            var kh = _cusRepo.ThongTinKH(maKH);

            ViewBag.Khachhang = kh;
            ViewBag.LoaiKh = kh.MaLoaiKH.HasValue ? _cusRepo.LoaiKh(kh.MaLoaiKH.Value) : null;
            ViewBag.DiaChi = Session["Diachi"] as DiaChi;

            var cart = (List<GioHangViewModel>)Session["thanhtoan"];
            return View(cart.OrderByDescending(sp => sp.NgayThem));
        }

        public ActionResult ThanhToanThanhCong()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThanhToanfinal(FormCollection form)
        {
            int maKH = (int)Session["MaKH"];                        

                string tinh = form["province"];
                string huyen = form["district"];
                string xa = form["ward"];
                string diaChiCuThe = form["address"];

                var diaChiMoi = new DiaChi
                {
                    MaKH = maKH,
                    TinhThanhPho = tinh,
                    QuanHuyen = huyen,
                    PhuongXa = xa,
                    DiaChiCuThe = diaChiCuThe,
                    LaDiaChiMacDinh = false,
                    NgayThem = DateTime.Now
                };
                Session["Diachi"] = diaChiMoi;
            

            var cart = (List<GioHangViewModel>)Session["thanhtoan"];

            return RedirectToAction("ThanhToanfinal");
        }

        public ActionResult GiamSoLuong(int id)
        {
            try
            { 
                _cartRepo.Xoa(id);
                Session["GioHang"] = _accountRepo.GetCartCount((int)Session["MaKH"]);
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;
            }
            return RedirectToAction("ToCheckOut");

        }

        public ActionResult TangSoLuong(int id)
        {
            try
            {
                _cartRepo.Them(id, (int)Session["MaKH"]);
                Session["GioHang"] = _accountRepo.GetCartCount((int)Session["MaKH"]);
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;
            }
            return RedirectToAction("ToCheckOut");
        }


        public ActionResult XoaDon(int id)
        {
            int maKH = (int)Session["MaKH"];
            _cartRepo.XoaDon(id, maKH);
            Session["GioHang"] = _accountRepo.GetCartCount(maKH);
            return RedirectToAction("ToCheckOut");
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult XoaVaThanhToan(FormCollection form, string actionType)
        {
            int maKH = (int)Session["MaKH"];

            if (actionType == "delete")
            {
                _cartRepo.XoaDaChon(form, maKH);
                Session["GioHang"] = _accountRepo.GetCartCount(maKH);
                return RedirectToAction("ToCheckOut");
            }
            else if (actionType == "checkout")
            {

                var list = _cartRepo.ChonSanPham(form, maKH);
                Session["thanhtoan"] = list;
                return RedirectToAction("ThanhToan");
            }

            return RedirectToAction("ToCheckOut");
        }

        public ActionResult ThanhToan()
        {
            int maKH = (int)Session["MaKH"];
            var list = (List<GioHangViewModel>)Session["thanhtoan"];
            var kh = _cusRepo.ThongTinKH(maKH);

            if (kh.MaLoaiKH.HasValue)
            {
                ViewBag.LoaiKh = _cusRepo.LoaiKh(kh.MaLoaiKH.Value);
            }
            else
            {
                ViewBag.LoaiKh = null;
            }
            var diaChi = _cusRepo.GetDiaChi(maKH);
            ViewBag.Khachhang = kh;
            ViewBag.DiaChi = diaChi;
            Session["Diachi"] = diaChi;
            return View(list.OrderByDescending(sp => sp.NgayThem));
        }
        public ActionResult ToCheckOut()
        {
            int maKH = (int)Session["MaKH"];
            var cart = _cartRepo.GetCart(maKH).OrderByDescending(sp => sp.NgayThem);

            return View(cart);
        }

        [HttpPost]
        public JsonResult AddToCartAjax(int maSP, int soLuong)
        {
            try
            {
                if (Session["MaKH"] == null)
                {
                    return Json(new { success = false, needLogin = true });
                }

                int maKH = (int)Session["MaKH"];

                bool added = _cartRepo.AddToCart(maKH, maSP, soLuong);

                if (!added)
                {
                    return Json(new { success = false, message = "Thêm vào giỏ thất bại (Lỗi không xác định)." });
                }

  
                int newCount = _accountRepo.GetCartCount(maKH);
                Session["GioHang"] = newCount;

                return Json(new { success = true, cartCount = newCount });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.Message
                });
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddToCart(int maSP, int soLuong)
        {
            if (soLuong <= 0)
            {
                TempData["ErrorMessage"] = "Sản phẩm đã hết!";
                return RedirectToAction("ProductDetail", "Product", new { id = maSP });
            }
            if (Session["MaKH"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            int maKH = (int)Session["MaKH"];

            try
            {
                bool result = _cartRepo.AddToCart(maKH, maSP, soLuong);
                Session["cart"] = _cartRepo.GetCart(maKH);
                Session["GioHang"] = _accountRepo.GetCartCount(maKH);
                return RedirectToAction("ToCheckOut");
            }
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = "Lỗi cơ sở dữ liệu: " + ex.Message;
                return RedirectToAction("ProductDetail", "Product", new { id = maSP });
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                return RedirectToAction("ProductDetail", "Product", new { id = maSP });
            }
        }

    }
}