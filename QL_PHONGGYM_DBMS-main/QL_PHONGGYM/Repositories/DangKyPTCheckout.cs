using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.Repositories
{
    public class DangKyPTCheckout
    {        
        public string TenKH { get; set; }
        public string TenHLV { get; set; }
        public int SoBuoi { get; set; }
        public Decimal GiaMoiBuoi { get; set; }
        public DateTime NgayDK { get; set; }
        public string MucTieu { get; set; }
        public Decimal TongTien { get; set; }
        public Decimal ThanhTien { get; set; }
        public decimal GiamGia { get; set; }

    }
}