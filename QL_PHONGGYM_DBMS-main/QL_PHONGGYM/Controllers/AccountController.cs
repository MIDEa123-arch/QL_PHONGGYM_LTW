using QL_PHONGGYM.Models;
using QL_PHONGGYM.Repositories;
using QL_PHONGGYM.ViewModel;
using System;
using System.Linq;
using System.Web.Mvc;
using System.Data.SqlClient;

namespace QL_PHONGGYM.Controllers
{
    public class AccountController : Controller
    {
        private readonly AccountRepository _accountRepo;

        public AccountController()
        {
            _accountRepo = new AccountRepository(new QL_PHONGGYMEntities());
        }

        // GET: /Account/Register
        public ActionResult Register(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        // POST: /Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(KhachHangRegisterViewModel model, string returnUrl)
        {
            if (!ModelState.IsValid)
                return View(model);

            try
            {
                bool isSuccess = _accountRepo.CusRegister(model);

                if (isSuccess)
                {
                    TempData["SuccessMessage"] = "Đăng ký thành công! Vui lòng đăng nhập.";

                    if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
                        return RedirectToAction("Login", "Account", new { returnUrl });

                    return RedirectToAction("Login", "Account");
                }

                ModelState.AddModelError("", "Đăng ký thất bại. Vui lòng thử lại.");
            }
            catch (Exception ex)
            {
                string errorMsg = ex.InnerException?.Message ?? ex.Message;
                ModelState.AddModelError("", errorMsg);
            }

            return View(model);
        }


        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        // POST: /Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(KhachHangLoginViewModel model, string returnUrl)
        {
            if (!ModelState.IsValid)
                return View(model);

            try
            {
                var user = _accountRepo.CusLogin(model.TenDangNhap, model.MatKhau);

                if (user == null)
                {
                    TempData["ErrorMessage"] = "Tên đăng nhập hoặc mật khẩu không chính xác.";
                    return View(model);
                }
                
                Session["MaKH"] = user.MaKH;

                string fullName = user.TenKH ?? "";
                Session["TenKH"] = fullName.Split(' ').Last();
                Session["GioHang"] = _accountRepo.GetCartCount(user.MaKH);
                if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
                    return Redirect(returnUrl);

                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.InnerException?.Message ?? ex.Message;
                return View(model);
            }
        }



        // GET: /Account/Logout
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login", "Account");
        }
    }
}
