using QL_PHONGGYM.Models;
using QL_PHONGGYM.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;

namespace QL_PHONGGYM.Repositories
{
    public class ProductRepository
    {
        private readonly QL_PHONGGYMEntities _context;

        public ProductRepository(QL_PHONGGYMEntities context)
        {
            _context = context;
        }

        public LopHoc LopHocDetail(int maLop)
        {
            var lop = _context.LopHocs.FirstOrDefault(sp => sp.MaLop == maLop);

            if (lop == null)
            {
                throw new Exception("Không tìm thấy thông tin lớp học!");
            }
            int hienTai = lop.SiSoHienTai ?? 0;
            int toiDa = lop.SiSoToiDa ?? 0;

            if (hienTai >= toiDa)
            {
                throw new Exception("Lớp này đã đủ số lượng học viên.\nKhông được phép đăng ký vào lớp này.");
            }

            return lop;
        }

        public List<ChuyenMon> GetChuyenMons()
        {
            var list = _context.ChuyenMons.ToList();
            return list;
        }

        public List<LoaiSanPham> GetLoaiSanPhams()
        {
            return _context.LoaiSanPhams.ToList();
        }

        public List<string> GetHangsByLoai()
        {
            return _context.SanPhams.Where(sp => sp.Hang != null && sp.TrangThai == 1).Select(sp => sp.Hang).Distinct().ToList();
        }

        public List<string> GetXuatSu()
        {
            return _context.SanPhams.Where(sp => sp.XuatXu != null && sp.TrangThai == 1).Select(sp => sp.XuatXu).Distinct().ToList();
        }
      

        public List<SanPhamViewModel> GetSanPhams()
        {
            var list = (from sp in _context.SanPhams
                        join ha in _context.HINHANHs on sp.MaSP equals ha.MaSP into haGroup           
                        where sp.TrangThai == 1
                        select new SanPhamViewModel
                        {
                            MaSP = sp.MaSP,
                            TenSP = sp.TenSP,
                            LoaiSP = sp.LoaiSanPham.TenLoaiSP,
                            DonGia = sp.DonGia,
                            SoLuongTon = sp.SoLuongTon,
                            GiaKhuyenMai = (decimal)sp.GiaKhuyenMai,
                            Hang = sp.Hang,
                            XuatXu = sp.XuatXu,
                            BaoHanh = sp.BaoHanh,
                            MoTaChung = sp.MoTaChung,
                            MaTaChiTiet = sp.MoTaChiTiet,
                            TrangThai = sp.TrangThai ?? 0,
                            UrlHinhAnhChinh = haGroup.FirstOrDefault(h => h.IsMain == true).Url,
                            UrlHinhAnhsPhu = haGroup.Where(h => h.IsMain == false)
                                                    .Select(h => h.Url)
                                                    .ToList()
                        }).ToList();

            return list;
        }



        public List<ThongTinLop> GetLopHocs(string keyword, int? maCM, int? maKH, string filterType)
        {
            var query = _context.LopHocs.AsQueryable();            
            DateTime today = DateTime.Now.Date;
            query = query.Where(l => l.NgayBatDau > today);            

            if (!string.IsNullOrEmpty(keyword))
                query = query.Where(l => l.TenLop.Contains(keyword));

            if (maCM.HasValue)
                query = query.Where(l => l.MaCM == maCM.Value);

            var listLopRaw = query.OrderBy(l => l.NgayBatDau).ToList(); 

            var result = new List<ThongTinLop>();

            List<UserScheduleDTO> userSchedule = new List<UserScheduleDTO>();
            List<int> joinedClasses = new List<int>();

            if (maKH.HasValue)
            {
                joinedClasses = _context.DangKyLops
                    .Where(dk => dk.MaKH == maKH.Value && dk.TrangThai == "Còn hiệu lực")
                    .Select(dk => dk.MaLop).ToList();

                var lichPT = (from lpt in _context.LichTapPTs
                              join dkpt in _context.DangKyPTs on lpt.MaDKPT equals dkpt.MaDKPT
                              where dkpt.MaKH == maKH.Value && lpt.TrangThai == "Chưa tập"
                              select new UserScheduleDTO
                              {
                                  Ngay = lpt.NgayTap,
                                  Start = lpt.GioBatDau,
                                  End = lpt.GioKetThuc
                              }).ToList();

                var lichLop = (from ll in _context.LichLops
                               join dkl in _context.DangKyLops on ll.MaLop equals dkl.MaLop
                               where dkl.MaKH == maKH.Value
                                  && ll.TrangThai == "Chưa diễn ra"
                                  && dkl.TrangThai == "Còn hiệu lực"
                               select new UserScheduleDTO
                               {
                                   Ngay = ll.NgayHoc,
                                   Start = ll.GioBatDau,
                                   End = ll.GioKetThuc
                               }).ToList();

                userSchedule.AddRange(lichPT);
                userSchedule.AddRange(lichLop);
            }

            foreach (var lop in listLopRaw)
            {
                bool isJoined = joinedClasses.Contains(lop.MaLop);
                bool isConflict = false;
                
                if (maKH.HasValue && !isJoined)
                {
                    var lichCuaLopNay = _context.LichLops
                                            .Where(l => l.MaLop == lop.MaLop)
                                            .Select(l => new { l.NgayHoc, l.GioBatDau, l.GioKetThuc })
                                            .ToList();
                    foreach (var buoiHoc in lichCuaLopNay)
                    {
                        var ngayHocOnly = buoiHoc.NgayHoc.Date;
                        bool biTrung = userSchedule.Any(buoiBan =>
                            buoiBan.Ngay.Date == ngayHocOnly &&
                            buoiHoc.GioBatDau < buoiBan.End &&
                            buoiHoc.GioKetThuc > buoiBan.Start
                        );

                        if (biTrung)
                        {
                            isConflict = true;
                            break;
                        }
                    }
                }

                if (filterType == "not-joined" && isJoined) continue;                
                if (filterType == "suitable" && (isJoined || isConflict)) continue;

                var hlvName = _context.NhanViens.FirstOrDefault(nv => nv.MaNV == lop.MaNV)?.TenNV ?? "Đang cập nhật";
                var chuyenMonName = lop.ChuyenMon?.TenChuyenMon ?? "Gym";

                var siSo = _context.DangKyLops.Count(x => x.MaLop == lop.MaLop && x.TrangThai == "Còn hiệu lực");

                result.Add(new ThongTinLop
                {
                    MaLop = lop.MaLop,
                    TenLop = lop.TenLop,
                    TenHLV = hlvName,
                    TenChuyenMon = chuyenMonName,
                    NgayBatDau = lop.NgayBatDau,
                    NgayKetThuc = lop.NgayKetThuc,
                    HocPhi = lop.HocPhi,
                    SiSoHienTai = siSo,
                    SiSoToiDa = lop.SiSoToiDa,
                    DaDangKy = isJoined,
                    BiTrungLich = isConflict,
                });
            }

            return result;
        }
    }
}