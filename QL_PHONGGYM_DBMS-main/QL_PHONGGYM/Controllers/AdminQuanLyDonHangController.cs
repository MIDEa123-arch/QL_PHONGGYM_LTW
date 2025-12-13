using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class AdminQuanLyDonHangController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();
        public ActionResult Index(string search = "", string status = "", int page = 1, bool? isAjax = false)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");

            var query = _context.DonHangs.ToList();
            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(dh => dh.HoaDons.Any(hd => hd.KhachHang.TenKH.Contains(search) || dh.MaDonHang.ToString() == search)).ToList();
            }

            if (!string.IsNullOrEmpty(status))
            {
                query = query.Where(d => d.TrangThaiDonHang == status).ToList();
            }

            var sortedQuery = query.OrderByDescending(d => d.NgayDat).ToList();

            int pageSize = 10; 
            int totalRecord = sortedQuery.Count();
            int totalPages = (int)Math.Ceiling((double)totalRecord / pageSize);

            var model = sortedQuery.Skip((page - 1) * pageSize)
                                   .Take(pageSize)
                                   .ToList();
            ViewBag.CurrentSearch = search;
            ViewBag.CurrentStatus = status;
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = page;

            if (isAjax == true)
            {
                return PartialView("DanhSachDonHang", model);
            }

            return View(model);
        }
        [HttpPost]
        public JsonResult UpdateOrderStatus(int id, string action)
        {
            var dh = _context.DonHangs.Find(id);
            if (dh == null) return Json(new { success = false, message = "Không tìm thấy đơn hàng!" });

            try
            {
                string oldStatus = dh.TrangThaiDonHang;
                string newStatus = "";
                string message = "";

                switch (action)
                {
                    case "confirm": 
                        if (oldStatus == "Chờ xác nhận")
                        {
                            newStatus = "Chờ giao hàng";
                            message = "Đã xác nhận đơn hàng thành công.";
                        }
                        else return Json(new { success = false, message = "Trạng thái không hợp lệ để xác nhận!" });
                        break;

                    case "ship": 
                        if (oldStatus == "Chờ giao hàng")
                        {
                            newStatus = "Đã giao hàng";
                            var hoaDon = _context.HoaDons.FirstOrDefault(h => h.MaDonHang == id);
                            if (hoaDon != null)
                            {
                                hoaDon.TrangThai = "Đã thanh toán";
                            }

                            message = "Đơn hàng đã được giao thành công.";
                        }
                        else return Json(new { success = false, message = "Đơn hàng chưa sẵn sàng để giao!" });
                        break;

                    case "cancel":
                        if (oldStatus == "Chờ xác nhận" || oldStatus == "Chờ giao hàng")
                        {
                            newStatus = "Đã hủy";
                            message = "Đã hủy đơn hàng.";
                        }
                        else return Json(new { success = false, message = "Không thể hủy đơn hàng ở trạng thái này!" });
                        break;

                    default:
                        return Json(new { success = false, message = "Hành động không xác định!" });
                }

                dh.TrangThaiDonHang = newStatus;
                _context.SaveChanges();

                return Json(new { success = true, message = message });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi hệ thống: " + ex.Message });
            }
        }

        [HttpGet]
        public ActionResult Details(int id)
        {
            var donHang = _context.DonHangs.FirstOrDefault(d => d.MaDonHang == id);

            if (donHang == null) return Content("Không tìm thấy đơn hàng!");

            return PartialView("_ChiTietDonHang", donHang);
        }
    }
}
