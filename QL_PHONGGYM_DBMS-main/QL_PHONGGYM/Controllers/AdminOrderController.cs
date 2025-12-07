using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Controllers
{
    public class AdminOrderController : Controller
    {
        private readonly QL_PHONGGYMEntities _context = new QL_PHONGGYMEntities();

        public ActionResult Index(string search = "", string status = "")
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var query = _context.HoaDons
                .Include("KhachHang")
                .OrderByDescending(h => h.NgayLap)
                .ToList();
            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(h => h.KhachHang.TenKH.Contains(search)).ToList();
            }
            if (!string.IsNullOrEmpty(status))
            {
                query = query.Where(h => h.TrangThai == status).ToList();
            }
            ViewBag.CurrentSearch = search;
            ViewBag.CurrentStatus = status;
            var list = query.OrderByDescending(h => h.NgayLap).ToList();    
            return View(list);
        }

        public ActionResult Details(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "Auth");

            var order = _context.HoaDons.Find(id);
            if (order == null) return HttpNotFound();

            return View(order);
        }

        [HttpPost]
        public JsonResult UpdateStatus(int id, string status)
        {
            try
            {
                var order = _context.HoaDons.Find(id);
                if (order == null) return Json(new { success = false, message = "Không tìm thấy đơn hàng" });

                order.TrangThai = status;
                _context.SaveChanges();

                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false, message = "Lỗi cập nhật trạng thái" });
            }
        }
    }
}