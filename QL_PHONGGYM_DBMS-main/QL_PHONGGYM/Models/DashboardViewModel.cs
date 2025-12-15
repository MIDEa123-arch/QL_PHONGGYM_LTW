using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.Models
{
    public class DashboardViewModel
    {
        public decimal DoanhThuThang { get; set; }

        public int HoiVienMoi { get; set; }

        public int KhachDangTap { get; set; }

        public int DonHangThang { get; set; }

        public List<HoaDon> DonHangMoiNhat { get; set; }
    }
}