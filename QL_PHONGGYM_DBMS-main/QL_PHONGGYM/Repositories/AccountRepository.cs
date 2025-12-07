using QL_PHONGGYM.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using QL_PHONGGYM.Models;

namespace QL_PHONGGYM.Repositories
{
    public class AccountRepository
    {
        private readonly QL_PHONGGYMEntities _context;

        public AccountRepository(QL_PHONGGYMEntities context)
        {
            _context = context;
        }

        public int GetCartCount(int maKH)
        {
            return _context.ChiTietGioHangs.Where(x => x.MaKH == maKH).Sum(x => (int?)x.SoLuong) ?? 0;
        }

        public bool CusRegister(KhachHangRegisterViewModel model)
        {
            try
            {
                if (_context.KhachHangs.Any(x => x.TenDangNhap == model.TenDangNhap))
                    throw new Exception("Tên đăng nhập này đã được sử dụng. Vui lòng chọn tên khác.");

                if (!string.IsNullOrEmpty(model.SDT) &&
                    _context.KhachHangs.Any(x => x.SDT == model.SDT))
                    throw new Exception("Số điện thoại này đã được đăng ký cho một tài khoản khác.");
                
                if (!string.IsNullOrEmpty(model.Email) &&
                    _context.KhachHangs.Any(x => x.Email == model.Email))
                    throw new Exception("Email này đã được đăng ký cho một tài khoản khác.");

                var kh = new KhachHang
                {
                    TenKH = model.TenKH,
                    GioiTinh = model.GioiTinh,
                    NgaySinh = model.NgaySinh,
                    SDT = model.SDT,
                    Email = model.Email,
                    TenDangNhap = model.TenDangNhap,
                    MatKhau = model.MatKhau,
                    TrangThaiTaiKhoan = 1,
                    MaLoaiKH = 4
                };

                _context.KhachHangs.Add(kh);
                _context.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi đăng ký khách hàng: " + ex.Message);
            }
        }


        public KhachHangLoginResult CusLogin(string tenDangNhap, string matKhau)
        {
            var kh = _context.KhachHangs
                             .Where(x => x.TenDangNhap == tenDangNhap && x.MatKhau == matKhau)
                             .FirstOrDefault();

            if (kh == null)
                return null;
            
            if (kh.TrangThaiTaiKhoan == 0)
                throw new Exception("Tài khoản đã bị khóa. Vui lòng liên hệ hỗ trợ.");

            return new KhachHangLoginResult
            {
                MaKH = kh.MaKH,
                TenKH = kh.TenKH,
                SDT = kh.SDT,
                Email = kh.Email
            };
        }


        public bool DangKyThu(string hoTen, string soDienThoai, string email)
        {
            try
            {
                var dk = new KhachHang
                {
                    TenKH = hoTen,
                    SDT = soDienThoai,
                    Email = email,                    
                };
                _context.KhachHangs.Add(dk);
                _context.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi khi đăng ký tập thử: " + ex.Message);
            }
        }

    }
}