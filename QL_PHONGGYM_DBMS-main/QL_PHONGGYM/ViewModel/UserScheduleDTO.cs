using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.ViewModel
{
    public class UserScheduleDTO
    {
        public DateTime Ngay { get; set; }
        public TimeSpan Start { get; set; }
        public TimeSpan End { get; set; }
    }
}