using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.ViewModel
{
    public class ThongTinLop
    {
        public int MaLop { get; set; }
        public string TenLop { get; set; }
        public string TenHLV { get; set; }
        public string TenChuyenMon { get; set; }
        public DateTime NgayBatDau { get; set; }
        public DateTime NgayKetThuc { get; set; }
        public decimal HocPhi { get; set; }
        public int SiSoHienTai { get; set; }
        public int? SiSoToiDa { get; set; }
        public bool DaDangKy { get; set; }
        public bool BiTrungLich { get; set; }
    }
}