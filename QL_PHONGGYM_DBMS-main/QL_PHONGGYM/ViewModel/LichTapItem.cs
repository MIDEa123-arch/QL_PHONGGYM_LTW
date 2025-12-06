using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.Repositories
{
    public class LichTapItem
    {
        public int MaLich { get; set; }
        public string Loai { get; set; }
        public string Ten { get; set; }
        public DateTime Ngay { get; set; }
        public TimeSpan GioBD { get; set; }
        public TimeSpan GioKT { get; set; }
        public string TrangThai { get; set; }
    }
}