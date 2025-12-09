using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QL_PHONGGYM.Models;
using QL_PHONGGYM.ViewModel;
using QL_PHONGGYM.Repositories;

namespace QL_PHONGGYM.Controllers
{
    public class HomeController : Controller
    {
        private readonly ProductRepository _productRepo;
        private readonly AccountRepository _accountRepo;
        private readonly GoiTapRepository _goiTapRepo;
        public HomeController()
        {
            _productRepo = new ProductRepository(new QL_PHONGGYMEntities());
            _accountRepo = new AccountRepository(new QL_PHONGGYMEntities());
            _goiTapRepo = new GoiTapRepository(new QL_PHONGGYMEntities());
        }
        public ActionResult Index()
        {
            var list = _goiTapRepo.goiTaps().Where(gt => gt.Gia == 1499000m || gt.Gia == 10000000m);
            ViewBag.usaProducts = _productRepo.GetSanPhams().Where(sp => sp.XuatXu == "USA" && sp.LoaiSP == "Thực phẩm bổ sung").OrderByDescending(sp => sp.SoLuongTon).Take(10).ToList();
            ViewBag.nikeProducts = _productRepo.GetSanPhams().Where(sp => sp.Hang == "Nike").OrderByDescending(sp => sp.SoLuongTon).Take(10).ToList();
            ViewBag.Class = _productRepo.GetChuyenMons().Take(5).ToList();
            return View(list);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult SignForFree(string HoTen, string SoDienThoai, string Email)
        {
            try
            {
                var isSuccess = _accountRepo.DangKyThu(HoTen, SoDienThoai, Email);

                return Json(new
                {
                    success = isSuccess,
                    message = isSuccess ? "Đăng ký thành công!" : "Đăng ký thất bại."
                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.InnerException?.Message ?? ex.Message
                }, JsonRequestBehavior.AllowGet);
            }
        }



        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}