using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.Models
{
    public class DashboardViewModel
    {
        public decimal DoanhThuThang { get; set; }

        // Món 2: Chứa số lượng người đăng ký mới (VD: 15)
        public int HoiVienMoi { get; set; }

        // Món 3: Chứa số người đang ở phòng tập (VD: 32)
        public int KhachDangTap { get; set; }

        // Món 4: Chứa tổng số đơn hàng trong tháng (VD: 120)
        public int DonHangThang { get; set; }

        // Món 5: Chứa danh sách 5 hóa đơn mới nhất để hiện lên bảng
        public List<HoaDon> DonHangMoiNhat { get; set; }
    }
}