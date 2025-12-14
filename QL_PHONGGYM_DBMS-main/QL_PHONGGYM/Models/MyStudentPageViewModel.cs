using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.Models
{
    public class MyStudentPageViewModel
    {
        public List<StudentViewModel> PtStudents { get; set; }
        public List<ClassViewModel> MyClasses { get; set; }
    }

    public class ClassViewModel
    {
        public int MaLop { get; set; }
        public string TenLop { get; set; }
        public string ChuyenMon { get; set; }
        public int SoLuongHocVien { get; set; }
        public int TongBuoi { get; set; }
        public int DaDay { get; set; }
        public int ConLai { get { return TongBuoi - DaDay; } }
    }

    public class ClassMemberViewModel
    {
        public string TenKH { get; set; }
        public string SDT { get; set; }
        public string GioiTinh { get; set; }
        public DateTime? NgayDangKy { get; set; }
        public int TongBuoi { get; set; }
        public int DaHoc { get; set; }
        public int ConLai { get; set; }
    }
}