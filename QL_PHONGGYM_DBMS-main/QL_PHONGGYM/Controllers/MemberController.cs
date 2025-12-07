using QL_PHONGGYM.Models;
using QL_PHONGGYM.Repositories;
using System;
using System.Linq;
using System.Web.Mvc;
using System.Globalization;

namespace QL_PHONGGYM.Controllers
{
    public class MemberController : Controller
    {
        private readonly KhachHangRepository _cusRepo;

        public MemberController()
        {
            _cusRepo = new KhachHangRepository(new QL_PHONGGYMEntities());
        }

        public ActionResult ChiTietHoaDon(int maHd)
        {
            var hd = _cusRepo.GetHoaDon(maHd);
            return View(hd);
        }

        private bool KiemTraDangNhap()
        {
            if (Session["MaKH"] == null)
                return false;


            if (!int.TryParse(Session["MaKH"].ToString(), out int maKH))
                return false;

            var kh = _cusRepo.ThongTinKH(maKH);

            if (kh == null)
                throw new Exception("Tài khoản không tồn tại.");

            if (kh.TrangThaiTaiKhoan == 0)
                throw new Exception("Tài khoản đã bị khóa. Vui lòng liên hệ hỗ trợ.");

            Session["KhachHang"] = kh;

            return true;
        }

        public ActionResult Index()
        {
            try
            {
                if (!KiemTraDangNhap())
                    return RedirectToAction("Login", "Account");
            }
            catch (Exception ex)
            {
                Session.Clear();

                TempData["ErrorMessage"] = ex.Message;

                return RedirectToAction("Login", "Account");
            }

            ViewBag.ActiveMenu = "tongquan";

            int maKH = (int)Session["MaKH"];
            var khachHang = _cusRepo.ThongTinKH(maKH);

            ViewBag.GoiTapHienTai = _cusRepo.GetGoiTapHienTai(maKH);

            var listHoaDon = _cusRepo.GetLichSuMuaHang(maKH);
            ViewBag.RecentOrders = listHoaDon.OrderByDescending(hd => hd.NgayLap).Take(3).ToList();

            decimal tongTien = listHoaDon.Sum(x => x.ThanhTien) ?? 0;
            ViewBag.TongTienTichLuy = tongTien;
            ViewBag.SoDonHang = listHoaDon.Count;

            return View(khachHang);
        }


        public ActionResult LichTap(DateTime? date)
        {
            if (Session["MaKH"] == null) return RedirectToAction("Login", "Account");
            ViewBag.ActiveMenu = "lichtap";
            int maKH = (int)Session["MaKH"];
            DateTime xemNgay = date ?? DateTime.Today;
            ViewBag.CurrentDate = xemNgay;
            ViewBag.LichTap = _cusRepo.GetLichTap(maKH);
            return View();
        }

        public ActionResult LichSuMuaHang(string status = "all", string daterange = "")
        {            
            if (!KiemTraDangNhap()) return RedirectToAction("Login", "Account");

            ViewBag.ActiveMenu = "hoadon";
            int maKH = (int)Session["MaKH"];

            var listHoaDon = _cusRepo.GetLichSuMuaHang(maKH).AsQueryable();

            if (!string.IsNullOrEmpty(daterange))
            {
                try
                {
                    var dates = daterange.Split('-');
                    if (dates.Length == 2)
                    {
                        DateTime startDate = DateTime.ParseExact(dates[0].Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        DateTime endDate = DateTime.ParseExact(dates[1].Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture).AddDays(1).AddSeconds(-1);

                        listHoaDon = listHoaDon.Where(n => n.NgayLap >= startDate && n.NgayLap <= endDate);
                    }
                }
                catch
                {
                }
            }
            switch (status)
            {
                case "cho-xac-nhan":
                    listHoaDon = listHoaDon.Where(n => n.DonHang != null && n.DonHang.TrangThaiDonHang == "Chờ xác nhận");
                    break;
                case "cho-giao-hang":
                    listHoaDon = listHoaDon.Where(n => n.DonHang != null && n.DonHang.TrangThaiDonHang == "Chờ giao hàng");
                    break;
                case "da-nhan-hang":
                    listHoaDon = listHoaDon.Where(n => n.DonHang != null && n.DonHang.TrangThaiDonHang == "Đã nhận hàng");
                    break;
                case "da-huy":
                    listHoaDon = listHoaDon.Where(n => n.DonHang != null && n.DonHang.TrangThaiDonHang == "Đã hủy");
                    break;
                case "da-thanh-toan": 
                    listHoaDon = listHoaDon.Where(n => n.TrangThai == "Đã thanh toán");
                    break;
                case "chua-thanh-toan": 
                    listHoaDon = listHoaDon.Where(n => n.TrangThai == "Chưa thanh toán");
                    break;
                default: 
                    break;
            }

            var resultList = listHoaDon.OrderByDescending(n => n.NgayLap).ToList();

            ViewBag.CurrentStatus = status;
            ViewBag.CurrentDateRange = daterange;

            return View(resultList);
        }

        public ActionResult SoDiaChi()
        {
            if (!KiemTraDangNhap()) return RedirectToAction("Login", "Account");
            ViewBag.ActiveMenu = "diachi";
            int maKH = (int)Session["MaKH"];
            var listDiaChi = _cusRepo.GetAllDiaChi(maKH);
            return View(listDiaChi);
        }

        public ActionResult ThongTinTaiKhoan()
        {
            if (!KiemTraDangNhap()) return RedirectToAction("Login", "Account");
            ViewBag.ActiveMenu = "taikhoan";
            int maKH = (int)Session["MaKH"];
            var khachHang = _cusRepo.ThongTinKH(maKH);
            return View(khachHang);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemDiaChi(FormCollection form)
        {
            if (Session["MaKH"] != null)
            {
                int maKH = (int)Session["MaKH"];
                _cusRepo.ThemDiaChi(maKH, form);
                TempData["ThongBao"] = "Thêm địa chỉ thành công!";
            }
            return RedirectToAction("SoDiaChi");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DoiMatKhau(string MatKhauCu, string MatKhauMoi)
        {
            if (Session["MaKH"] != null)
            {
                int maKH = (int)Session["MaKH"];
                bool result = _cusRepo.DoiMatKhau(maKH, MatKhauCu, MatKhauMoi);

                if (result) TempData["ThongBao"] = "Đổi mật khẩu thành công.";
                else TempData["ThongBao"] = "Mật khẩu cũ không chính xác.";
            }
            return RedirectToAction("ThongTinTaiKhoan");
        }
        public ActionResult ChonDiaChiMacDinh(int id)
        {
            if (Session["MaKH"] == null) return RedirectToAction("Login", "Account");

            int maKH = (int)Session["MaKH"];

            _cusRepo.ThietLapMacDinh(maKH, id);

            TempData["ThongBao"] = "Đã cập nhật địa chỉ mặc định!";

            return RedirectToAction("SoDiaChi");
        }

    }
}