using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.Models
{
    public class StudentViewModel
    {
        public int MaDKPT { get; set; }
        public string TenKH { get; set; }
        public string SDT { get; set; }
        public string GioiTinh { get; set; }
        public int TongBuoi { get; set; }
        public int DaTap { get; set; }

        public int ConLai { get { return TongBuoi - DaTap; } }
        public decimal TienDo
        {
            get
            {
                return TongBuoi > 0 ? (decimal)DaTap * 100 / TongBuoi : 0;
            }
        }
        public string TrangThai { get; set; }
        public DateTime? NgayDangKy { get; set; }
        public string GhiChuMucTieu { get; set; }
    }
}