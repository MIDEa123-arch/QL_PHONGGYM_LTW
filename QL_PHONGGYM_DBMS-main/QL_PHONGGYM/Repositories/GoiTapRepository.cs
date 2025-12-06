using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.Repositories
{
   
    public class GoiTapRepository
    {
        private readonly QL_PHONGGYMEntities _context;

        public GoiTapRepository(QL_PHONGGYMEntities context)
        {
            _context = context;
        }
        
        public List<GoiTap> goiTaps()
        {
            return _context.GoiTaps.Where(gt => gt.TrangThai == 1).ToList();
        }

        public GoiTap ThongTinGoiTap(int id)
        {
            var gt = _context.GoiTaps.FirstOrDefault(x => x.MaGoiTap == id);

            if (gt == null)
            {
                throw new Exception("Không tìm thấy thông tin gói tập!");
            }

            if (gt.TrangThai != 1)
            {
                throw new Exception("Gói tập này hiện đã ngừng bán!");
            }

            return gt;
        }
    }
}