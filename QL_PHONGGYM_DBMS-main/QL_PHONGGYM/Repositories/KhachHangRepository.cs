using QL_PHONGGYM.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace QL_PHONGGYM.Repositories
{
    public class KhachHangRepository
    {
        private readonly QL_PHONGGYMEntities _context;

        public KhachHangRepository(QL_PHONGGYMEntities context)
        {
            _context = context;
        }

        public bool KhoiPhucMK(string email, string mk)
        {
            var khach = _context.KhachHangs.FirstOrDefault(x => x.Email == email);
            if (khach == null)
                throw new Exception("Tài khoản không tồn tại");

            try
            {
                khach.MatKhau = mk;
                _context.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool XoaDiaChi(int maDC)
        {
            try
            {
                var diaChi = _context.DiaChis.Find(maDC);

                if (diaChi == null)
                {
                    throw new Exception("Địa chỉ này không tồn tại");
                }
                _context.DiaChis.Remove(diaChi);
                _context.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool CapNhatTt(FormCollection form)
        {
            var makhStr = form["MaKH"];
            var hoten = form["TenKH"];
            var gioiTinh = form["GioiTinh"];
            var ngaySinhStr = form["NgaySinh"];
            var sdt = form["SDT"];
            var email = form["Email"];
            var madcStr = form["MaDC"];

            if (string.IsNullOrEmpty(makhStr) || string.IsNullOrEmpty(hoten) ||
                string.IsNullOrEmpty(gioiTinh) || string.IsNullOrEmpty(ngaySinhStr) ||
                string.IsNullOrEmpty(sdt) || string.IsNullOrEmpty(email))
            {
                return false;
            }

            try
            {
                int id = int.Parse(makhStr);
                int maDCNew = -1;
                if (madcStr != null)
                {
                    maDCNew = int.Parse(madcStr);
                }
                var kh = _context.KhachHangs.FirstOrDefault(k => k.MaKH == id && k.TrangThaiTaiKhoan == 1);

                if (kh == null)
                {
                    throw new Exception("Tài khoản không tồn tại hoặc đã bị khóa.");
                }

                bool daTonTaiSDT = _context.KhachHangs.Any(k => k.SDT == sdt && k.MaKH != id);
                if (daTonTaiSDT)
                {
                    throw new Exception("Số điện thoại này đã được sử dụng bởi tài khoản khác.");
                }

                bool daTonTaiEmail = _context.KhachHangs.Any(k => k.Email == email && k.MaKH != id);
                if (daTonTaiEmail)
                {
                    throw new Exception("Email này đã được sử dụng bởi tài khoản khác.");
                }

                kh.TenKH = hoten;
                kh.GioiTinh = gioiTinh;
                kh.SDT = sdt;
                kh.Email = email;
                kh.NgaySinh = DateTime.Parse(ngaySinhStr);

                if (maDCNew != -1)
                {
                    var diachiMoi = _context.DiaChis.FirstOrDefault(dc => dc.MaKH == kh.MaKH && dc.MaDC == maDCNew);
                    if (diachiMoi == null)
                    {
                        throw new Exception("Địa chỉ đã chọn không tồn tại.");
                    }
                    else
                    {
                        diachiMoi.LaDiaChiMacDinh = true;
                        var diachiCu = _context.DiaChis.FirstOrDefault(dc => dc.MaKH == kh.MaKH && dc.LaDiaChiMacDinh == true && dc.MaDC != diachiMoi.MaDC);

                        if (diachiCu != null)
                        {
                            diachiCu.LaDiaChiMacDinh = false;
                        }
                    }
                }
                _context.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public KhachHang ThongTinKH(int makh)
        {
            return _context.KhachHangs.FirstOrDefault(kh => kh.MaKH == makh);

        }
        public LoaiKhachHang LoaiKh(int maloai)
        {
            return _context.LoaiKhachHangs.FirstOrDefault(kh => kh.MaLoaiKH == maloai);

        }

        public HoaDon GetHoaDon(int mahd)
        {
            return _context.HoaDons.Find(mahd);
        }
        public DiaChi GetDiaChi(int makh)
        {
            var diaChiList = _context.DiaChis.Where(dc => dc.MaKH == makh).OrderByDescending(dc => dc.NgayThem).ToList();

            if (!diaChiList.Any())
                return null;

            var diaChi = diaChiList.FirstOrDefault(dc => dc.LaDiaChiMacDinh);

            return diaChi ?? diaChiList.First();
        }

        public void UpdateDiaChi(int makh, FormCollection form)
        {
            int maDC;
            if (String.IsNullOrEmpty(form["MaDC"]))
                throw new Exception("Địa chỉ không tồn tại");
            else
                maDC = Convert.ToInt32(form["MaDC"]);

            string tinh = form["TinhThanhPho"];
            string huyen = form["QuanHuyen"];
            string xa = form["PhuongXa"];
            string diaChiCuThe = form["DiaChiCuThe"];
            string datMacDinh = form["isDefault"];

            try
            {
                if (string.IsNullOrEmpty(tinh) || string.IsNullOrEmpty(huyen) || string.IsNullOrEmpty(xa)) return;

                var diaChiTonTai = _context.DiaChis.Find(maDC);

                if (diaChiTonTai == null)
                {
                    throw new Exception("Địa chỉ không tồn tại");
                }
                else
                {
                    diaChiTonTai.TinhThanhPho = tinh;
                    diaChiTonTai.QuanHuyen = huyen;
                    diaChiTonTai.PhuongXa = xa;
                    diaChiTonTai.DiaChiCuThe = diaChiCuThe;

                    if (datMacDinh != null)
                    {
                        var diaChiMacDinh = _context.DiaChis.FirstOrDefault(dc => dc.LaDiaChiMacDinh);
                        if (diaChiMacDinh != null)
                            diaChiMacDinh.LaDiaChiMacDinh = false;
                        diaChiTonTai.LaDiaChiMacDinh = true;
                    }
                    else
                        diaChiTonTai.LaDiaChiMacDinh = false;

                }
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public void ThemDiaChi(int makh, FormCollection form)
        {
            string tinh = form["TinhThanhPho"];
            string huyen = form["QuanHuyen"];
            string xa = form["PhuongXa"];
            string diaChiCuThe = form["DiaChiCuThe"];
            string datMacDinh = form["isDefault"];

            try
            {
                if (string.IsNullOrEmpty(tinh) || string.IsNullOrEmpty(huyen) || string.IsNullOrEmpty(xa)) return;

                var diaChiTonTai = _context.DiaChis
                    .FirstOrDefault(dc =>
                        dc.MaKH == makh &&
                        dc.TinhThanhPho == tinh &&
                        dc.QuanHuyen == huyen &&
                        dc.PhuongXa == xa &&
                        dc.DiaChiCuThe == diaChiCuThe);

                if (diaChiTonTai == null)
                {
                    DiaChi diaChiMoi;
                    if (String.IsNullOrEmpty(datMacDinh))
                    {
                        diaChiMoi = new DiaChi
                        {
                            MaKH = makh,
                            TinhThanhPho = tinh,
                            QuanHuyen = huyen,
                            PhuongXa = xa,
                            DiaChiCuThe = diaChiCuThe,
                            LaDiaChiMacDinh = false,
                            NgayThem = DateTime.Now
                        };
                    }
                    else
                    {
                        var diaChiMacDinh = _context.DiaChis.FirstOrDefault(dc => dc.LaDiaChiMacDinh);
                        if (diaChiMacDinh != null)
                            diaChiMacDinh.LaDiaChiMacDinh = false;

                        diaChiMoi = new DiaChi
                        {
                            MaKH = makh,
                            TinhThanhPho = tinh,
                            QuanHuyen = huyen,
                            PhuongXa = xa,
                            DiaChiCuThe = diaChiCuThe,
                            LaDiaChiMacDinh = true,
                            NgayThem = DateTime.Now
                        };
                    }

                    _context.DiaChis.Add(diaChiMoi);
                }
                else
                {
                    throw new Exception("Địa chỉ đã tồn tại");
                }
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public List<DangKyGoiTap> GetGoiTapHienTai(int maKH)
        {
            return _context.DangKyGoiTaps
                           .Where(gt => gt.MaKH == maKH && gt.TrangThai == "Còn hiệu lực")
                           .ToList();
        }

        public List<DiaChi> GetAllDiaChi(int makh)
        {
            return _context.DiaChis.Where(dc => dc.MaKH == makh).OrderByDescending(dc => dc.NgayThem).ToList();
        }

        public List<HoaDon> GetLichSuMuaHang(int maKH)
        {
            return _context.HoaDons.Where(h => h.MaKH == maKH).OrderByDescending(h => h.NgayLap).ToList();
        }

        public List<LichTapItem> GetLichTap(int maKH)
        {
            _context.Database.ExecuteSqlCommand("EXEC sp_UpdateTrangThaiLichLop");

            var lichLop = (from ll in _context.LichLops
                           join dkl in _context.DangKyLops on ll.MaLop equals dkl.MaLop
                           where dkl.MaKH == maKH
                           select new LichTapItem
                           {
                               MaLich = ll.MaLichLop,
                               Loai = "Lớp Học",
                               Ten = ll.LopHoc.TenLop,
                               Ngay = ll.NgayHoc,
                               GioBD = ll.GioBatDau,
                               GioKT = ll.GioKetThuc,
                               TrangThai = ll.TrangThai
                           }).OrderByDescending(x => x.Ngay).ToList();


            var lichPT = (from lpt in _context.LichTapPTs
                          join dkpt in _context.DangKyPTs on lpt.MaDKPT equals dkpt.MaDKPT
                          where dkpt.MaKH == maKH
                          select new LichTapItem
                          {
                              MaLich = lpt.MaLichPT,
                              Loai = "Tập PT",
                              Ten = "PT " + dkpt.NhanVien.TenNV,
                              Ngay = lpt.NgayTap,
                              GioBD = lpt.GioBatDau,
                              GioKT = lpt.GioKetThuc,
                              TrangThai = lpt.TrangThai
                          }).OrderByDescending(x => x.Ngay).ToList();


            var listTong = lichLop.Concat(lichPT)
                                  .OrderByDescending(x => x.Ngay)
                                  .ToList();

            return listTong;
        }    

        public bool DoiMatKhau(int maKH, string mkCu, string mkMoi)
        {
            var kh = _context.KhachHangs.FirstOrDefault(k => k.MaKH == maKH);

            if (mkCu != kh.MatKhau)
                return false;

            kh.MatKhau = mkMoi;
            _context.SaveChanges();
            return true;            
        }
        public void ThietLapMacDinh(int maKH, int maDiaChi)
        {
            var listDiaChi = _context.DiaChis.Where(d => d.MaKH == maKH).ToList();

            foreach (var item in listDiaChi)
            {
                item.LaDiaChiMacDinh = false;
            }

            var diaChiMoi = listDiaChi.FirstOrDefault(d => d.MaDC == maDiaChi);
            if (diaChiMoi != null)
            {
                diaChiMoi.LaDiaChiMacDinh = true;
            }

            _context.SaveChanges();
        }
    }

}