using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Net;
using System.Net.Mail;

namespace QL_PHONGGYM.Helpers
{
    public class GmailService
    {
        private readonly QL_PHONGGYMEntities _context;

        public GmailService(QL_PHONGGYMEntities context)
        {
            _context = context;
        }

        public bool SendOTP(string userEmail, out string otpCode)
        {
            var khach = _context.KhachHangs.FirstOrDefault(x => x.Email == userEmail);
            if (khach == null)
                throw new Exception("Tài khoản không tồn tại");

            otpCode = new Random().Next(1000, 9999).ToString(); // Tạo mã OTP 6 số
            try
            {
                var fromAddress = new MailAddress("thangdien0169@gmail.com", "The Gym Security");
                var toAddress = new MailAddress(userEmail);

                const string appPassword = "wfjrxxlksiwzvifm"; // Gmail App Password

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, appPassword)
                };

                string bodyContent = $@"
                <div style='font-family: Arial, sans-serif; padding: 20px; background:#f6f6f6'>
                    <div style='max-width: 500px; margin: auto; background: white; padding: 25px; border-radius: 10px; box-shadow: 0 3px 10px rgba(0,0,0,0.1);'>
                        <h2 style='color:#d92027; text-align:center; margin-bottom: 20px;'>THE GYM</h2>

                        <h3 style='color:#333;'>Khôi phục tài khoản</h3>
                        <p style='font-size: 15px; color:#555;'>
                            Bạn vừa yêu cầu đặt lại mật khẩu cho tài khoản The Gym.
                            Vui lòng sử dụng mã OTP bên dưới để xác thực:
                        </p>

                        <div style='text-align:center; margin: 30px 0;'>
                            <div style='
                                display:inline-block;
                                font-size:32px;
                                font-weight:bold;
                                color:white;
                                background:#d92027;
                                padding:15px 35px;
                                border-radius:8px;
                                letter-spacing:5px;
                            '>
                                {otpCode}
                            </div>
                        </div>

                        <p style='color:#777;'>
                            Mã OTP có hiệu lực trong <b>3 phút</b>.
                        </p>

                        <p style='color:#444;'>
                            Nếu bạn không thực hiện yêu cầu này, hãy bỏ qua email.
                        </p>

                        <hr style='margin-top:25px; opacity:0.3;' />
                        <p style='text-align:center; font-size:13px; color:#999;'>
                            © {DateTime.Now.Year} The Gym. All rights reserved.
                        </p>
                    </div>
                </div>";

                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = "THE GYM - Mã xác thực OTP khôi phục tài khoản",
                    Body = bodyContent,
                    IsBodyHtml = true
                })
                {
                    smtp.Send(message);
                }

                return true;
            }
            catch (Exception ex) 
            {
                throw ex;
            }
        }
    }
}