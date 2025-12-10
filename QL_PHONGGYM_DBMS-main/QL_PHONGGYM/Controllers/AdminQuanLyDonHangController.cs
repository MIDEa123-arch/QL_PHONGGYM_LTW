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
        // GET: AdminQuanLyDonHang
        public ActionResult Index(string search = "", string status = "", bool? isAjax = false)
        {

            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var query = _context.DonHangs.ToList();

            if (!string.IsNullOrEmpty(search))
            {
                query = _context.DonHangs
                .Where(dh => dh.HoaDons.Any(hd => hd.KhachHang.TenKH.Contains(search) || dh.MaDonHang.ToString() == search)).ToList();
            }

            if (!string.IsNullOrEmpty(status))
            {
                query = query.Where(d => d.TrangThaiDonHang == status).ToList();
            }

            var model = query.OrderByDescending(d => d.NgayDat).ToList();

            // Xử lý AJAX để lọc mượt mà (giống trang Hội viên)
            if (isAjax==true)
            {
                return PartialView("DanhSachDonHang", model);
            }

            return View(model);
        }

        // 2. Hàm Xử lý chuyển trạng thái (API cho AJAX)
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
                    case "confirm": // Xác nhận đơn
                        if (oldStatus == "Chờ xác nhận")
                        {
                            newStatus = "Chờ giao hàng";
                            message = "Đã xác nhận đơn hàng thành công.";
                        }
                        else return Json(new { success = false, message = "Trạng thái không hợp lệ để xác nhận!" });
                        break;

                    case "ship": // Giao hàng thành công
                        if (oldStatus == "Chờ giao hàng")
                        {
                            newStatus = "Đã giao hàng";

                            // Cập nhật luôn trạng thái thanh toán của Hóa Đơn liên quan (nếu cần)
                            var hoaDon = _context.HoaDons.FirstOrDefault(h => h.MaDonHang == id);
                            if (hoaDon != null)
                            {
                                hoaDon.TrangThai = "Đã thanh toán";
                            }

                            message = "Đơn hàng đã được giao thành công.";
                        }
                        else return Json(new { success = false, message = "Đơn hàng chưa sẵn sàng để giao!" });
                        break;

                    case "cancel": // Hủy đơn
                        if (oldStatus == "Chờ xác nhận" || oldStatus == "Chờ giao hàng")
                        {
                            newStatus = "Đã hủy";
                            message = "Đã hủy đơn hàng.";

                            // Logic hoàn kho nếu cần thiết (cộng lại số lượng sản phẩm vào kho)
                            // ... (Code hoàn kho tùy chọn)
                        }
                        else return Json(new { success = false, message = "Không thể hủy đơn hàng ở trạng thái này!" });
                        break;

                    default:
                        return Json(new { success = false, message = "Hành động không xác định!" });
                }

                // Lưu thay đổi
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
            // Lấy đơn hàng và nạp (Include) các bảng liên quan sâu bên trong
            var donHang = _context.DonHangs.FirstOrDefault(d => d.MaDonHang == id);

            if (donHang == null) return Content("Không tìm thấy đơn hàng!");

            return PartialView("_ChiTietDonHang", donHang);
        }
    }
}
