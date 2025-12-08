using QL_PHONGGYM.Models;
using QL_PHONGGYM.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Mvc;


namespace QL_PHONGGYM.Repositories
{
    public class CartRepository
    {
        private readonly QL_PHONGGYMEntities _context;
        private readonly KhachHangRepository _cusRepo;
        public CartRepository(QL_PHONGGYMEntities context)
        {
            _context = context;
            _cusRepo = new KhachHangRepository(new QL_PHONGGYMEntities());
        }

        public bool ThanhToanHoaDonPT(int mahd)
        {
            try
            {
                var hd = _context.HoaDons.FirstOrDefault(h => h.MaHD == mahd);
                hd.TrangThai = "Đã thanh toán";
                _context.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public DangKyPTCheckout HoaDonPT(int maHd)
        {
            var hoaDon = _context.HoaDons.FirstOrDefault(hd => hd.MaHD == maHd);

            var kh = hoaDon.KhachHang.TenKH;
            var hlv = hoaDon.ChiTietHoaDons.First().DangKyPT.NhanVien.TenNV;
            var soBuoi = hoaDon.ChiTietHoaDons.First().DangKyPT.SoBuoi;
            var giaBuoi = hoaDon.ChiTietHoaDons.First().DangKyPT.GiaMoiBuoi;
            var mucTieu = hoaDon.ChiTietHoaDons.First().DangKyPT.GhiChu;
            var ngaydk = hoaDon.ChiTietHoaDons.First().DangKyPT.NgayDangKy;

            DangKyPTCheckout dk = new DangKyPTCheckout()
            {
                TenKH = kh,
                TenHLV = hlv,
                SoBuoi = soBuoi,
                GiaMoiBuoi = giaBuoi,
                NgayDK = ngaydk,
                MucTieu = mucTieu,
                TongTien = hoaDon.TongTien.Value,
                ThanhTien = hoaDon.ThanhTien.Value,
                GiamGia = hoaDon.GiamGia.Value

            };

            return dk;
        }

        public bool DangKyPTDetail(int maHD)
        {
            var hd = _context.HoaDons.Find(maHD);

            if (hd == null)
            {
                return false;
            }

            hd.TrangThai = "Đã thanh toán";
            _context.SaveChanges();

            return true;
        }


        public bool DangKyPT(FormCollection form, int makh)
        {
            try
            {
                DangKyPT dangKy = new DangKyPT
                {
                    MaKH = makh,
                    SoBuoi = Convert.ToInt32(form["soBuoi"]),
                    NgayDangKy = DateTime.Now,
                    TrangThai = "Chờ duyệt",
                    GhiChu = form["ghiChu"]
                };
                _context.DangKyPTs.Add(dangKy);
                _context.SaveChanges();
                return true;
            }
            catch
            {
                throw;
            }
        }

        public bool KiemTraTrung(int makh)
        {
            var goiHienTai = _context.DangKyGoiTaps
                         .Where(x => x.MaKH == makh && x.TrangThai == "Còn hiệu lực")
                         .OrderByDescending(x => x.NgayKetThuc)
                         .FirstOrDefault();
            if (goiHienTai == null)
            {
                return false;
            }
            else
                return true;
        }

        public void TaoHoaDon(FormCollection form, int maKH, List<GioHangViewModel> cart = null, int? maGoiTap = null, int? maLop = null, DiaChi diaChi = null)
        {

            using (var tran = _context.Database.BeginTransaction(IsolationLevel.Serializable))
            {
                DonHang donHang = null;
                try
                {
                    if (cart != null)
                    {
                        var checkDiaChi = _context.DiaChis.FirstOrDefault(x =>
                            x.MaKH == maKH &&
                            x.TinhThanhPho == diaChi.TinhThanhPho &&
                            x.QuanHuyen == diaChi.QuanHuyen &&
                            x.PhuongXa == diaChi.PhuongXa &&
                            x.DiaChiCuThe == diaChi.DiaChiCuThe
                        );

                        int maDiaChiFinal;

                        if (checkDiaChi != null)
                        {                            
                            maDiaChiFinal = checkDiaChi.MaDC;
                        }
                        else
                        {                            
                            var newDC = new DiaChi
                            {
                                MaKH = maKH,
                                TinhThanhPho = diaChi.TinhThanhPho,
                                QuanHuyen = diaChi.QuanHuyen,
                                PhuongXa = diaChi.PhuongXa,
                                DiaChiCuThe = diaChi.DiaChiCuThe,
                                NgayThem = DateTime.Now
                            };

                            _context.DiaChis.Add(newDC);
                            _context.SaveChanges();

                            maDiaChiFinal = newDC.MaDC;
                        }
                        
                        donHang = new DonHang
                        {
                            MaKH = maKH,
                            MaDC = maDiaChiFinal, 
                            NgayDat = DateTime.Now,
                            TrangThaiDonHang = "Chờ xác nhận",
                            TongTien = Convert.ToDecimal(form["thanhTien"])
                        };

                        _context.DonHangs.Add(donHang);
                        _context.SaveChanges();
                    }
                    var hoaDon = new HoaDon
                    {
                        MaKH = maKH,
                        MaDonHang = donHang?.MaDonHang,
                        TongTien = Convert.ToDecimal(form["tongTien"]),
                        ThanhTien = Convert.ToDecimal(form["thanhTien"]),
                        TrangThai = form["paymentMethod"] == "BANK" ? "Đã thanh toán" : "Chưa thanh toán",
                        GiamGia = form["giamGia"] != null ? Convert.ToDecimal(form["giamGia"]) : 0,
                        NgayLap = DateTime.Now,
                    };

                    _context.HoaDons.Add(hoaDon);
                    _context.SaveChanges();

                    if (cart != null && cart.Count > 0)
                    {
                        foreach (var item in cart)
                        {
                            var sp = _context.SanPhams.Find(item.MaSP);

                            if (sp == null)
                                throw new Exception("Sản phẩm không tồn tại!");

                            if (sp.TrangThai == 0)
                                throw new Exception($"Sản phẩm '{sp.TenSP}' đã ngừng bán!");

                            ChiTietHoaDon ct = new ChiTietHoaDon
                            {
                                MaHD = hoaDon.MaHD,
                                MaSP = item.MaSP,
                                SoLuong = item.SoLuong,
                                DonGia = item.GiaKhuyenMaiSP ?? item.DonGia
                            };

                            _context.ChiTietHoaDons.Add(ct);

                            var list = _context.ChiTietGioHangs
                                .Where(x => x.MaKH == maKH && x.MaSP == item.MaSP);

                            _context.ChiTietGioHangs.RemoveRange(list);
                        }
                    }


                    if (maLop.HasValue)
                    {
                        var lop = _context.LopHocs.FirstOrDefault(l => l.MaLop == maLop);

                        if (lop == null)
                            throw new Exception("Lớp học không tồn tại!");

                        bool daDangKy = _context.DangKyLops.Any(dk =>
                                dk.MaKH == maKH &&
                                dk.MaLop == maLop &&
                                dk.TrangThai == "Còn hiệu lực");

                        if (daDangKy)
                            throw new Exception("Bạn đã đăng ký lớp này rồi!");

                        int siSoHienTai = _context.DangKyLops.Count(dk =>
                                dk.MaLop == maLop &&
                                dk.TrangThai == "Còn hiệu lực");

                        if (lop.SiSoToiDa.HasValue && siSoHienTai >= lop.SiSoToiDa)
                            throw new Exception("Lớp đã đủ sĩ số!");

                        DangKyLop dkl = new DangKyLop
                        {
                            MaKH = maKH,
                            MaLop = maLop.Value,
                            NgayDangKy = DateTime.Now,
                            TrangThai = "Còn hiệu lực"
                        };

                        _context.DangKyLops.Add(dkl);
                        _context.SaveChanges();
     
                        _context.ChiTietHoaDons.Add(new ChiTietHoaDon
                        {
                            MaHD = hoaDon.MaHD,
                            MaDKLop = dkl.MaDKLop,
                            SoLuong = 1,
                            DonGia = lop.HocPhi
                        });
                    }

                    if (maGoiTap.HasValue)
                    {
                        var goi = _context.GoiTaps.Find(maGoiTap);

                        if (goi == null)
                            throw new Exception("Gói tập không tồn tại!");

                        if (goi.TrangThai == 0)
                            throw new Exception($"Gói tập này đã ngừng bán!");


                        // Kiểm tra gói đang hoạt động
                        var goiHienTai = _context.DangKyGoiTaps
                            .Where(x => x.MaKH == maKH && x.TrangThai == "Còn hiệu lực")
                            .OrderByDescending(x => x.NgayKetThuc)
                            .FirstOrDefault();

                        DangKyGoiTap dk;

                        if (goiHienTai != null)
                        {
                            goiHienTai.NgayKetThuc = goiHienTai.NgayKetThuc.AddMonths(goi.ThoiHan);
                            dk = goiHienTai;
                        }
                        else
                        {
                            dk = new DangKyGoiTap
                            {
                                MaKH = maKH,
                                MaGoiTap = goi.MaGoiTap,
                                NgayDangKy = DateTime.Now,
                                NgayBatDau = DateTime.Now,
                                NgayKetThuc = DateTime.Now.AddMonths(goi.ThoiHan),
                                TrangThai = "Còn hiệu lực"
                            };
                            _context.DangKyGoiTaps.Add(dk);
                            _context.SaveChanges();
                        }

                        _context.ChiTietHoaDons.Add(new ChiTietHoaDon
                        {
                            MaHD = hoaDon.MaHD,
                            MaDKGT = dk.MaDKGT,
                            SoLuong = 1,
                            DonGia = goi.Gia
                        });
                    }

                    _context.SaveChanges();
                    tran.Commit();
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    throw ex;
                }
            }
        }


        public void Xoa(int id)
        {
            var item = _context.ChiTietGioHangs.FirstOrDefault(sp => sp.MaSP == id && sp.SanPham.TrangThai == 1);

            if (item == null)
                throw new Exception("Sản phẩm đã ngừng bán!");

            item.SoLuong = item.SoLuong - 1;

            if (item.SoLuong <= 0)
                _context.ChiTietGioHangs.Remove(item);

            _context.SaveChanges();
        }
        public void Them(int id, int makh)
        {
            var product = _context.SanPhams.FirstOrDefault(sp => sp.MaSP == id);

            if (product == null)
                throw new Exception("Sản phẩm không tồn tại!");

            if (product.TrangThai == 0)
                throw new Exception("Sản phẩm đã ngừng bán!");

            if (product.SoLuongTon <= 0)
                throw new Exception("Sản phẩm đã hết hàng!");

            var item = _context.ChiTietGioHangs.FirstOrDefault(sp => sp.MaSP == id && sp.MaKH == makh);

            if (item == null)
                throw new Exception("Sản phẩm này không có trong giỏ hàng!");

            if (item.SoLuong + 1 > product.SoLuongTon)
                throw new Exception("Số lượng sản phẩm đã đạt đến mức tối đa");

            item.SoLuong = item.SoLuong + 1;

            _context.SaveChanges();
        }

        public void XoaDon(int id, int makh)
        {


            var item = _context.ChiTietGioHangs.FirstOrDefault(c => c.MaKH == makh && c.MaSP == id);
            if (item != null)
            {
                _context.ChiTietGioHangs.Remove(item);
                _context.SaveChanges();
            }

        }
        public void XoaDaChon(FormCollection form, int makh)
        {
            string[] selected = form.GetValues("selectedItems");
            List<int> selectedIds = selected.Select(int.Parse).ToList();
            foreach (var id in selectedIds)
            {
                var item = _context.ChiTietGioHangs.FirstOrDefault(c => c.MaKH == makh && c.MaSP == id);
                if (item != null)
                    _context.ChiTietGioHangs.Remove(item);
            }

            _context.SaveChanges();
        }


        public List<GioHangViewModel> ChonSanPham(FormCollection form, int makh)
        {
            string[] selected = form.GetValues("selectedItems");
            List<int> selectedIds = selected.Select(int.Parse).ToList();
            List<GioHangViewModel> list = new List<GioHangViewModel>();
            var cart = GetCart(makh);

            foreach (var id in selectedIds)
            {
                var item = cart.FirstOrDefault(c => c.MaKH == makh && c.MaSP == id);
                if (item != null)
                    list.Add(item);
            }

            return list;
        }
        public bool AddToCart(int maKH, int maSP, int soLuong)
        {
            if (soLuong <= 0)
                return false;

            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    var sanPham = _context.SanPhams.FirstOrDefault(sp => sp.MaSP == maSP);

                    if (sanPham == null)
                        throw new Exception("Sản phẩm không tồn tại!");

                    if (sanPham.TrangThai == 0)
                        throw new Exception("Sản phẩm đã ngừng bán!");

                    if (sanPham.SoLuongTon <= 0)
                        throw new Exception("Sản phẩm đã hết hàng!");

                    var chiTiet = _context.ChiTietGioHangs
                        .FirstOrDefault(x => x.MaKH == maKH && x.MaSP == maSP);

                    if (chiTiet != null)
                    {
                        chiTiet.SoLuong += soLuong;
                        chiTiet.NgayThem = DateTime.Now;
                    }
                    else
                    {
                        chiTiet = new ChiTietGioHang
                        {
                            MaKH = maKH,
                            MaSP = maSP,
                            SoLuong = soLuong,
                            NgayThem = DateTime.Now
                        };

                        _context.ChiTietGioHangs.Add(chiTiet);
                    }

                    _context.SaveChanges();
                    transaction.Commit();

                    return true;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw ex;
                }
            }
        }

        public List<GioHangViewModel> GetCart(int maKH)
        {
            try
            {
                var cart = _context.ChiTietGioHangs
                    .Where(c => c.MaKH == maKH && c.SanPham.TrangThai == 1)
                    .Select(c => new GioHangViewModel
                    {
                        MaChiTietGH = c.MaChiTietGH,
                        MaKH = c.MaKH,
                        MaSP = c.MaSP,
                        SoLuong = c.SoLuong,
                        DonGia = c.SanPham.DonGia,
                        NgayThem = c.NgayThem,
                        GiaKhuyenMaiSP = c.SanPham.GiaKhuyenMai,
                        TenMonHang = c.SanPham.TenSP,
                        AnhDaiDienSP = c.SanPham.HINHANHs.FirstOrDefault(a => a.IsMain.HasValue && a.IsMain.Value == true).Url,
                        SoLuongTon = c.SanPham.SoLuongTon
                    }).ToList();

                return cart;
            }
            catch
            {
                throw;
            }
        }
        public bool DangKyLop(int maKH, int maLop)
        {
            try
            {
                var daDangKy = _context.DangKyLops.Any(x => x.MaKH == maKH && x.MaLop == maLop && x.TrangThai == "Còn hiệu lực");
                if (daDangKy) return false;

                var lop = _context.LopHocs.Find(maLop);
                int siSoHienTai = _context.DangKyLops.Count(x => x.MaLop == maLop && x.TrangThai == "Còn hiệu lực");

                if (lop.SiSoToiDa.HasValue && siSoHienTai >= lop.SiSoToiDa.Value) return false;

                var dangKy = new DangKyLop
                {
                    MaKH = maKH,
                    MaLop = maLop,
                    NgayDangKy = DateTime.Now,
                    TrangThai = "Còn hiệu lực"
                };

                _context.DangKyLops.Add(dangKy);
                _context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }


    }
}