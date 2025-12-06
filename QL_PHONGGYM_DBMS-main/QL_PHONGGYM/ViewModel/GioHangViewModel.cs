using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.ViewModel
{
    public class GioHangViewModel
    {
        public int MaChiTietGH { get; set; }
        public int MaKH { get; set; }
        public int MaSP { get; set; }  
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public decimal? GiaKhuyenMaiSP { get; set; }
        public DateTime NgayThem { get; set; }
        public string TenMonHang { get; set; }
        public string AnhDaiDienSP { get; set; }
        public int SoLuongTon { get; set; }

        public decimal ThanhTien
        {
            get
            {
                int sl = SoLuong;
                decimal gia = GiaKhuyenMaiSP.HasValue && GiaKhuyenMaiSP.Value < DonGia
                              ? GiaKhuyenMaiSP.Value
                              : DonGia;
                return sl * gia;
            }
        }
    }

}