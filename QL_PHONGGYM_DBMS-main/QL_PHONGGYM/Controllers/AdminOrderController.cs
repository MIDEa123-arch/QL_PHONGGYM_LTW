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

        public ActionResult Index(string search = "", string status = "", int page = 1)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");

            var query = _context.HoaDons
                .Include("KhachHang")
                .AsQueryable();

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(h => h.KhachHang.TenKH.ToLower().Contains(search.ToLower())||h.MaHD.ToString()==search);
            }
            if (!string.IsNullOrEmpty(status))
            {
                query = query.Where(h => h.TrangThai == status);
            }

            int pageSize = 10;
            int totalRecord = query.Count();
            int totalPages = (int)Math.Ceiling((double)totalRecord / pageSize);

            var list = query.OrderByDescending(h => h.NgayLap)
                            .Skip((page - 1) * pageSize)
                            .Take(pageSize)
                            .ToList();

            ViewBag.CurrentSearch = search;
            ViewBag.CurrentStatus = status;
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = page;

            return View(list);
        }

        public ActionResult Details(int id)
        {
            if (Session["AdminUser"] == null) return RedirectToAction("Login", "AdminHome");

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