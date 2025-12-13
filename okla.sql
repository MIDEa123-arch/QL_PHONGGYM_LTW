
/****** Object:  Table [dbo].[CheckIn]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckIn](
	[MaCheckIn] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[ThoiGianVao] [datetime] NOT NULL,
	[ThoiGianRa] [datetime] NULL,
	[TrangThai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCheckIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[MaChiTietGH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[NgayThem] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaCTHD] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaDKGT] [int] NULL,
	[MaDKPT] [int] NULL,
	[MaDKLop] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](12, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [int] IDENTITY(1,1) NOT NULL,
	[TenChucVu] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuyenMon]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenMon](
	[MaCM] [int] IDENTITY(1,1) NOT NULL,
	[TenChuyenMon] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangKyGoiTap]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKyGoiTap](
	[MaDKGT] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaGoiTap] [int] NOT NULL,
	[NgayDangKy] [date] NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[NgayKetThuc] [date] NOT NULL,
	[TrangThai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDKGT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangKyLop]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKyLop](
	[MaDKLop] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaLop] [int] NOT NULL,
	[NgayDangKy] [date] NOT NULL,
	[TrangThai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDKLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangKyPT]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKyPT](
	[MaDKPT] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaNV] [int] NULL,
	[SoBuoi] [int] NOT NULL,
	[GiaMoiBuoi] [decimal](12, 2) NOT NULL,
	[NgayDangKy] [date] NOT NULL,
	[TrangThai] [nvarchar](20) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDKPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaChi]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaChi](
	[MaDC] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[TinhThanhPho] [nvarchar](100) NOT NULL,
	[QuanHuyen] [nvarchar](100) NOT NULL,
	[PhuongXa] [nvarchar](100) NOT NULL,
	[DiaChiCuThe] [nvarchar](255) NOT NULL,
	[LaDiaChiMacDinh] [bit] NOT NULL,
	[NgayThem] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[TongTien] [decimal](12, 2) NOT NULL,
	[PhiShip] [decimal](12, 2) NOT NULL,
	[TrangThaiDonHang] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](250) NULL,
	[DiaChi_Full] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoiTap]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoiTap](
	[MaGoiTap] [int] IDENTITY(1,1) NOT NULL,
	[TenGoi] [nvarchar](50) NOT NULL,
	[ThoiHan] [int] NOT NULL,
	[Gia] [decimal](12, 2) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGoiTap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HINHANH]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HINHANH](
	[MaHinh] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NOT NULL,
	[Url] [nvarchar](500) NOT NULL,
	[IsMain] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[NgayLap] [datetime] NULL,
	[TongTien] [decimal](12, 2) NULL,
	[ThanhTien] [decimal](12, 2) NULL,
	[TrangThai] [nvarchar](20) NULL,
	[GiamGia] [decimal](12, 2) NULL,
	[MaDonHang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NULL,
	[SDT] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[MaLoaiKH] [int] NULL,
	[GioiTinh] [nvarchar](60) NULL,
	[TenDangNhap] [varchar](300) NULL,
	[MatKhau] [varchar](1000) NULL,
	[TrangThaiTaiKhoan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichLop]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichLop](
	[MaLichLop] [int] IDENTITY(1,1) NOT NULL,
	[MaLop] [int] NOT NULL,
	[MaNV] [int] NULL,
	[NgayHoc] [date] NOT NULL,
	[GioBatDau] [time](7) NOT NULL,
	[GioKetThuc] [time](7) NOT NULL,
	[TrangThai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLichLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichTapPT]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichTapPT](
	[MaLichPT] [int] IDENTITY(1,1) NOT NULL,
	[MaDKPT] [int] NOT NULL,
	[NgayTap] [date] NOT NULL,
	[GioBatDau] [time](7) NOT NULL,
	[GioKetThuc] [time](7) NOT NULL,
	[TrangThai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLichPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiKhachHang]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKhachHang](
	[MaLoaiKH] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[MucGiam] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHoc]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHoc](
	[MaLop] [int] IDENTITY(1,1) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[MaCM] [int] NOT NULL,
	[HocPhi] [decimal](12, 2) NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[NgayKetThuc] [date] NOT NULL,
	[SoBuoi] [int] NULL,
	[SiSoToiDa] [int] NULL,
	[SiSoHienTai] [int] NULL,
	[MaNV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[MaChucVu] [int] NULL,
	[TenDangNhap] [varchar](300) NULL,
	[MatKhau] [varchar](1000) NULL,
	[GioiTinh] [nvarchar](60) NULL,
	[TenNV] [nvarchar](100) NOT NULL,
	[SDT] [nvarchar](15) NULL,
	[NgaySinh] [date] NULL,
	[TrangThaiTaiKhoan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVienChuyenMon]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVienChuyenMon](
	[MaNV] [int] NOT NULL,
	[MaCM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[MaCM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[MaLoaiSP] [int] NULL,
	[DonGia] [decimal](12, 2) NOT NULL,
	[SoLuongTon] [int] NOT NULL,
	[GiaKhuyenMai] [decimal](12, 2) NULL,
	[Hang] [nvarchar](100) NULL,
	[XuatXu] [nvarchar](100) NULL,
	[BaoHanh] [nvarchar](50) NULL,
	[MoTaChung] [nvarchar](1000) NULL,
	[MoTaChiTiet] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuCauHoTro]    Script Date: 10/12/2025 1:25:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuCauHoTro](
	[MaYC] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[TieuDe] [nvarchar](200) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[LoaiYeuCau] [nvarchar](50) NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
	[MaNV] [int] NULL,
	[PhanHoi] [nvarchar](max) NULL,
	[NgayGui] [datetime] NULL,
	[NgayXuLy] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaYC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietGioHang] ON 
GO
INSERT [dbo].[ChiTietGioHang] ([MaChiTietGH], [MaKH], [MaSP], [SoLuong], [NgayThem]) VALUES (156, 1, 1, 1, CAST(N'2025-12-06T21:56:13.360' AS DateTime))
GO
INSERT [dbo].[ChiTietGioHang] ([MaChiTietGH], [MaKH], [MaSP], [SoLuong], [NgayThem]) VALUES (157, 1, 11, 1, CAST(N'2025-12-06T21:56:31.773' AS DateTime))
GO
INSERT [dbo].[ChiTietGioHang] ([MaChiTietGH], [MaKH], [MaSP], [SoLuong], [NgayThem]) VALUES (192, 2, 4, 1, CAST(N'2025-12-10T12:30:30.730' AS DateTime))
GO
INSERT [dbo].[ChiTietGioHang] ([MaChiTietGH], [MaKH], [MaSP], [SoLuong], [NgayThem]) VALUES (193, 2, 15, 1, CAST(N'2025-12-10T13:17:45.547' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ChiTietGioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 
GO
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaDKGT], [MaDKPT], [MaDKLop], [MaSP], [SoLuong], [DonGia]) VALUES (1174, 1199, NULL, NULL, NULL, 11, 2, CAST(550000.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaDKGT], [MaDKPT], [MaDKLop], [MaSP], [SoLuong], [DonGia]) VALUES (1175, 1200, NULL, NULL, NULL, 4, 1, CAST(620000.00 AS Decimal(12, 2)))
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[ChucVu] ON 
GO
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (1, N'HLV Lớp')
GO
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (4, N'Lễ tân')
GO
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (2, N'PT')
GO
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (3, N'Quản lý')
GO
SET IDENTITY_INSERT [dbo].[ChucVu] OFF
GO
SET IDENTITY_INSERT [dbo].[ChuyenMon] ON 
GO
INSERT [dbo].[ChuyenMon] ([MaCM], [TenChuyenMon], [MoTa]) VALUES (6, N'Boxing', N'Học các kỹ thuật tấn công và phòng thủ cơ bản của Boxing, bao gồm tư thế đứng, di chuyển, đòn đấm thẳng, đấm móc và đấm xiên. Lớp học không chỉ rèn luyện kỹ năng tự vệ mà còn là một bài tập tim mạch cường độ cao, giúp đốt mỡ, tăng tốc độ, sức mạnh và phản xạ.')
GO
INSERT [dbo].[ChuyenMon] ([MaCM], [TenChuyenMon], [MoTa]) VALUES (7, N'Yoga', N'Một hành trình kết nối Thân - Tâm - Trí. Các lớp Yoga tập trung vào việc đồng bộ hóa hơi thở (pranayama) với các tư thế (asana), giúp tăng cường sự dẻo dai, cải thiện thăng bằng, sức mạnh cơ lõi và giải tỏa căng thẳng. Phù hợp với mọi cấp độ, từ người mới bắt đầu đến nâng cao.')
GO
INSERT [dbo].[ChuyenMon] ([MaCM], [TenChuyenMon], [MoTa]) VALUES (8, N'Aerobics', N'Các bài tập vận động nhịp điệu theo nhạc truyền thống. Lớp học được thiết kế để tăng cường sức bền tim mạch, cải thiện hệ hô hấp và đốt cháy calo một cách vui nhộn. Phù hợp cho những ai yêu thích vận động trên nền nhạc sôi động mà không cần các động tác phức tạp.')
GO
INSERT [dbo].[ChuyenMon] ([MaCM], [TenChuyenMon], [MoTa]) VALUES (9, N'New Combat', N'Giải phóng năng lượng với bài tập cardio võ thuật tổng hợp. Lớp học mô phỏng các động tác mạnh mẽ từ Kickboxing, Muay Thái, Karate và Taekwondo trên nền nhạc cuồng nhiệt. Đây là bài tập không đối kháng, giúp đốt mỡ, tăng sức bền và giải tỏa stress cực kỳ hiệu quả.')
GO
INSERT [dbo].[ChuyenMon] ([MaCM], [TenChuyenMon], [MoTa]) VALUES (10, N'New Pump', N'Lớp tập tạ nhóm (group weightlifting) sử dụng tạ đòn (barbell) và tạ đơn. Bài tập được thiết kế khoa học để tác động lên tất cả các nhóm cơ chính trong 60 phút, giúp tăng cường sức mạnh, sức bền cơ bắp và định hình cơ thể săn chắc trên nền nhạc truyền cảm hứng.')
GO
INSERT [dbo].[ChuyenMon] ([MaCM], [TenChuyenMon], [MoTa]) VALUES (11, N'Zumba', N'Biến phòng tập thành một sàn nhảy! Zumba kết hợp các vũ điệu Latin nóng bỏng như Salsa, Merengue, Cumbia và Reggaeton với các động tác fitness. Lớp học không yêu cầu kỹ năng nhảy, chỉ cần bạn sẵn sàng vui vẻ, đốt calo và đổ mồ hôi theo điệu nhạc.')
GO
INSERT [dbo].[ChuyenMon] ([MaCM], [TenChuyenMon], [MoTa]) VALUES (12, N'Bum N Tum', N'Lớp học chuyên biệt "Bums and Tums" (Mông và Bụng) tập trung vào việc điêu khắc và làm săn chắc hai nhóm cơ quan trọng nhất. Sử dụng các bài tập với dây kháng lực, tạ nhỏ và trọng lượng cơ thể để định hình vòng eo và phát triển cơ mông tối đa.')
GO
INSERT [dbo].[ChuyenMon] ([MaCM], [TenChuyenMon], [MoTa]) VALUES (13, N'Dance Fit', N'Giải phóng hình thể và thể hiện cá tính qua các vũ điệu hiện đại. Lớp học tập trung vào các thể loại như Hiphop, K-Pop Dance Cover và Sexy Dance. Không chỉ đốt calo, lớp học còn giúp bạn tăng cường trí nhớ, sự tự tin và khả năng cảm thụ âm nhạc.')
GO
INSERT [dbo].[ChuyenMon] ([MaCM], [TenChuyenMon], [MoTa]) VALUES (14, N'Cardio & Core', N'Sự kết hợp hoàn hảo để tối ưu hóa việc đốt mỡ và xây dựng cơ lõi. Lớp học bao gồm các bài tập tim mạch cường độ cao (HIIT) xen kẽ với các bài tập chuyên sâu cho cơ bụng (Abs) và cơ lõi (Core), giúp siết eo, tăng sức bền và cải thiện tư thế hiệu quả.')
GO
SET IDENTITY_INSERT [dbo].[ChuyenMon] OFF
GO
SET IDENTITY_INSERT [dbo].[DangKyGoiTap] ON 
GO
INSERT [dbo].[DangKyGoiTap] ([MaDKGT], [MaKH], [MaGoiTap], [NgayDangKy], [NgayBatDau], [NgayKetThuc], [TrangThai]) VALUES (1, 1, 1, CAST(N'2025-12-06' AS Date), CAST(N'2025-12-06' AS Date), CAST(N'2026-04-06' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyGoiTap] ([MaDKGT], [MaKH], [MaGoiTap], [NgayDangKy], [NgayBatDau], [NgayKetThuc], [TrangThai]) VALUES (2, 9, 4, CAST(N'2025-12-08' AS Date), CAST(N'2025-12-08' AS Date), CAST(N'2026-01-08' AS Date), N'Còn hiệu lực')
GO
SET IDENTITY_INSERT [dbo].[DangKyGoiTap] OFF
GO
SET IDENTITY_INSERT [dbo].[DangKyLop] ON 
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (26, 1, 1, CAST(N'2025-12-05' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (27, 1, 7, CAST(N'2025-12-05' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (28, 1, 12, CAST(N'2025-12-05' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (29, 1, 11, CAST(N'2025-12-05' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (30, 1, 4, CAST(N'2025-12-05' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (31, 1, 18, CAST(N'2025-12-05' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (32, 1, 9, CAST(N'2025-12-06' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (33, 2, 1, CAST(N'2025-12-07' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (34, 1, 14, CAST(N'2025-12-07' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (35, 9, 1, CAST(N'2025-12-08' AS Date), N'Còn hiệu lực')
GO
INSERT [dbo].[DangKyLop] ([MaDKLop], [MaKH], [MaLop], [NgayDangKy], [TrangThai]) VALUES (36, 2, 2, CAST(N'2025-12-08' AS Date), N'Còn hiệu lực')
GO
SET IDENTITY_INSERT [dbo].[DangKyLop] OFF
GO
SET IDENTITY_INSERT [dbo].[DangKyPT] ON 
GO
INSERT [dbo].[DangKyPT] ([MaDKPT], [MaKH], [MaNV], [SoBuoi], [GiaMoiBuoi], [NgayDangKy], [TrangThai], [GhiChu]) VALUES (16, 1, 11, 32, CAST(300000.00 AS Decimal(12, 2)), CAST(N'2025-12-06' AS Date), N'Còn hiệu lực', N'Giảm cân')
GO
INSERT [dbo].[DangKyPT] ([MaDKPT], [MaKH], [MaNV], [SoBuoi], [GiaMoiBuoi], [NgayDangKy], [TrangThai], [GhiChu]) VALUES (17, 2, 11, 24, CAST(500000.00 AS Decimal(12, 2)), CAST(N'2025-12-06' AS Date), N'Còn hiệu lực', N'Tăng cơ
')
GO
INSERT [dbo].[DangKyPT] ([MaDKPT], [MaKH], [MaNV], [SoBuoi], [GiaMoiBuoi], [NgayDangKy], [TrangThai], [GhiChu]) VALUES (18, 2, NULL, 24, CAST(0.00 AS Decimal(12, 2)), CAST(N'2025-12-08' AS Date), N'Chờ duyệt', N'')
GO
INSERT [dbo].[DangKyPT] ([MaDKPT], [MaKH], [MaNV], [SoBuoi], [GiaMoiBuoi], [NgayDangKy], [TrangThai], [GhiChu]) VALUES (19, 2, NULL, 24, CAST(0.00 AS Decimal(12, 2)), CAST(N'2025-12-08' AS Date), N'Chờ duyệt', N'')
GO
SET IDENTITY_INSERT [dbo].[DangKyPT] OFF
GO
SET IDENTITY_INSERT [dbo].[DiaChi] ON 
GO
INSERT [dbo].[DiaChi] ([MaDC], [MaKH], [TinhThanhPho], [QuanHuyen], [PhuongXa], [DiaChiCuThe], [LaDiaChiMacDinh], [NgayThem]) VALUES (29, 1, N'Hải Phòng', N'Cát Hải', N'Xuân Đám', N'112 Yên Lãng', 1, CAST(N'2025-12-06T21:49:29.893' AS DateTime))
GO
INSERT [dbo].[DiaChi] ([MaDC], [MaKH], [TinhThanhPho], [QuanHuyen], [PhuongXa], [DiaChiCuThe], [LaDiaChiMacDinh], [NgayThem]) VALUES (30, 1, N'Quảng Ninh', N'Vân Đồn', N'Đài Xuyên', N'111 Trần Nhật Duật', 0, CAST(N'2025-12-06T21:55:51.563' AS DateTime))
GO
INSERT [dbo].[DiaChi] ([MaDC], [MaKH], [TinhThanhPho], [QuanHuyen], [PhuongXa], [DiaChiCuThe], [LaDiaChiMacDinh], [NgayThem]) VALUES (31, 2, N'Khánh Hòa', N'Nha Trang', N'Phước Long', N'326/32/7 Lê Hồng Phong', 0, CAST(N'2025-12-07T00:14:56.953' AS DateTime))
GO
INSERT [dbo].[DiaChi] ([MaDC], [MaKH], [TinhThanhPho], [QuanHuyen], [PhuongXa], [DiaChiCuThe], [LaDiaChiMacDinh], [NgayThem]) VALUES (32, 2, N'Khánh Hòa', N'Nha Trang', N'Phước Long', N'326/32/7 Lê Hồng Phong', 0, CAST(N'2025-12-07T00:16:12.577' AS DateTime))
GO
INSERT [dbo].[DiaChi] ([MaDC], [MaKH], [TinhThanhPho], [QuanHuyen], [PhuongXa], [DiaChiCuThe], [LaDiaChiMacDinh], [NgayThem]) VALUES (33, 2, N'Khánh Hòa', N'Nha Trang', N'Phước Long', N'326/32/7 Lê Hồng Phong', 0, CAST(N'2025-12-07T00:17:12.630' AS DateTime))
GO
INSERT [dbo].[DiaChi] ([MaDC], [MaKH], [TinhThanhPho], [QuanHuyen], [PhuongXa], [DiaChiCuThe], [LaDiaChiMacDinh], [NgayThem]) VALUES (34, 2, N'Khánh Hòa', N'Nha Trang', N'Phước Long', N'326/32/7 Lê Hồng Phong', 0, CAST(N'2025-12-07T00:18:45.577' AS DateTime))
GO
INSERT [dbo].[DiaChi] ([MaDC], [MaKH], [TinhThanhPho], [QuanHuyen], [PhuongXa], [DiaChiCuThe], [LaDiaChiMacDinh], [NgayThem]) VALUES (35, 2, N'Khánh Hòa', N'Nha Trang', N'Phước Long', N'326/32/7 Lê Hồng Phong', 0, CAST(N'2025-12-07T00:36:31.910' AS DateTime))
GO
INSERT [dbo].[DiaChi] ([MaDC], [MaKH], [TinhThanhPho], [QuanHuyen], [PhuongXa], [DiaChiCuThe], [LaDiaChiMacDinh], [NgayThem]) VALUES (36, 2, N'Khánh Hòa', N'Nha Trang', N'Phước Long', N'326/32/7 Lê Hồng Phong', 0, CAST(N'2025-12-07T12:45:12.657' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DiaChi] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 
GO
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDat], [TongTien], [PhiShip], [TrangThaiDonHang], [GhiChu], [DiaChi_Full]) VALUES (57, 2, CAST(N'2025-12-10T12:28:59.177' AS DateTime), CAST(1045000.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), N'Chờ xác nhận', NULL, N'326/32/7 Lê Hồng Phong, Phước Long, Nha Trang, Khánh Hòa')
GO
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDat], [TongTien], [PhiShip], [TrangThaiDonHang], [GhiChu], [DiaChi_Full]) VALUES (58, 2, CAST(N'2025-12-10T12:30:00.107' AS DateTime), CAST(589000.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), N'Chờ xác nhận', NULL, N'31/5 Lê Hồng Phong, Phước Long, Nha Trang, Khánh Hòa')
GO
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[GoiTap] ON 
GO
INSERT [dbo].[GoiTap] ([MaGoiTap], [TenGoi], [ThoiHan], [Gia], [MoTa], [TrangThai]) VALUES (1, N'1 tháng', 1, CAST(399000.00 AS Decimal(12, 2)), N'Gói thành viên cơ bản của The Gym, không giới hạn các dụng cụ và máy tập.', 1)
GO
INSERT [dbo].[GoiTap] ([MaGoiTap], [TenGoi], [ThoiHan], [Gia], [MoTa], [TrangThai]) VALUES (2, N'12 tháng', 12, CAST(10000000.00 AS Decimal(12, 2)), N'Gói VIP: Quyền truy cập khu VIP và toàn bộ tiện ích tại mọi chi nhánh. Miễn phí quầy bar protein và ưu đãi giảm giá hóa đơn.', 1)
GO
INSERT [dbo].[GoiTap] ([MaGoiTap], [TenGoi], [ThoiHan], [Gia], [MoTa], [TrangThai]) VALUES (3, N'6 tháng', 6, CAST(2200000.00 AS Decimal(12, 2)), N'Tập luyện tại toàn hệ thống The New Gym trên toàn quốc, miễn phí kiểm tra sức khỏe, kiểm tra sai lệch tư thế, và nhiều hơn thế nữa.', 1)
GO
INSERT [dbo].[GoiTap] ([MaGoiTap], [TenGoi], [ThoiHan], [Gia], [MoTa], [TrangThai]) VALUES (4, N'1 tháng', 1, CAST(499000.00 AS Decimal(12, 2)), N'Gói thành viên cơ bản của The Gym, không giới hạn các dụng cụ và máy tập, miễn phí kiểm tra sức khỏe và kiểm tra sai lệch tư thế.', 1)
GO
INSERT [dbo].[GoiTap] ([MaGoiTap], [TenGoi], [ThoiHan], [Gia], [MoTa], [TrangThai]) VALUES (5, N'3 tháng', 3, CAST(1499000.00 AS Decimal(12, 2)), N'Tập luyện tại toàn hệ thống The New Gym trên toàn quốc, miễn phí kiểm tra sức khỏe, kiểm tra sai lệch tư thế, và nhiều hơn thế nữa.', 1)
GO
INSERT [dbo].[GoiTap] ([MaGoiTap], [TenGoi], [ThoiHan], [Gia], [MoTa], [TrangThai]) VALUES (6, N'GÓI TẬP TQBINH', 2, CAST(1200000.00 AS Decimal(12, 2)), N'THAY TQBINH', 1)
GO
INSERT [dbo].[GoiTap] ([MaGoiTap], [TenGoi], [ThoiHan], [Gia], [MoTa], [TrangThai]) VALUES (7, N'Gói 24 tháng', 24, CAST(20000000.00 AS Decimal(12, 2)), N'Gói Gym 24 Tháng là gói tập dài hạn giúp hội viên trải nghiệm đầy đủ tiện ích và dịch vụ cao cấp tại phòng gym với mức chi phí tiết kiệm nhất. Đây là lựa chọn lý tưởng dành cho người tập luyện lâu dài, cần sự ổn định, cam kết và mong muốn phát triển thể hình toàn diện.', 1)
GO
INSERT [dbo].[GoiTap] ([MaGoiTap], [TenGoi], [ThoiHan], [Gia], [MoTa], [TrangThai]) VALUES (8, N'5 tháng', 5, CAST(5000000.00 AS Decimal(12, 2)), N'Gói Gym 5 Tháng là lựa chọn phù hợp cho người mới bắt đầu hoặc người muốn tập luyện ổn định trong thời gian trung hạn.', 1)
GO
SET IDENTITY_INSERT [dbo].[GoiTap] OFF
GO
SET IDENTITY_INSERT [dbo].[HINHANH] ON 
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (1, 1, N'rule1-whey-choco-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (2, 1, N'rule1-whey-choco-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (3, 1, N'rule1-whey-choco-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (4, 1, N'rule1-whey-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (5, 2, N'on-whey-vanilla-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (6, 2, N'on-whey-vanilla-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (7, 2, N'on-whey-vanilla-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (8, 2, N'on-whey-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (9, 3, N'on-serious-mass-banana-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (10, 3, N'on-serious-mass-banana-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (11, 3, N'on-serious-mass-banana-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (12, 3, N'on-serious-mass-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (13, 4, N'xtend-bcaa-watermelon-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (14, 4, N'xtend-bcaa-watermelon-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (15, 4, N'xtend-bcaa-watermelon-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (16, 4, N'xtend-bcaa-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (17, 5, N'curse-preworkout-punch-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (18, 5, N'curse-preworkout-punch-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (19, 5, N'curse-preworkout-punch-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (20, 5, N'curse-preworkout-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (21, 6, N'rule1-creatine-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (22, 6, N'rule1-creatine-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (23, 6, N'rule1-creatine-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (24, 6, N'rule1-creatine-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (25, 7, N'isoxp-cafelatte-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (26, 7, N'isoxp-cafelatte-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (27, 7, N'isoxp-cafelatte-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (28, 7, N'isoxp-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (29, 8, N'mutant-mass-choco-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (30, 8, N'mutant-mass-choco-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (31, 8, N'mutant-mass-choco-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (32, 8, N'mutant-mass-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (33, 9, N'nutrabolics-eaa-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (34, 9, N'nutrabolics-eaa-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (35, 9, N'nutrabolics-eaa-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (36, 9, N'nutrabolics-eaa-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (37, 10, N'rule1-casein-choco-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (38, 10, N'rule1-casein-choco-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (39, 10, N'rule1-casein-choco-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (40, 10, N'rule1-casein-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (41, 11, N'now-omega3-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (42, 11, N'now-omega3-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (43, 11, N'now-omega3-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (44, 11, N'now-omega3-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (45, 12, N'abe-preworkout-energy-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (46, 12, N'abe-preworkout-energy-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (47, 12, N'abe-preworkout-energy-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (48, 12, N'abe-preworkout-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (49, 13, N'on-protein-bar-box-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (50, 13, N'on-protein-bar-single-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (51, 13, N'on-protein-bar-single-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (52, 13, N'on-protein-bar-facts-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (53, 14, N'applied-collagen-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (54, 14, N'applied-collagen-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (55, 14, N'applied-collagen-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (56, 14, N'applied-collagen-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (57, 15, N'now-vitd3-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (58, 15, N'now-vitd3-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (59, 15, N'now-vitd3-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (60, 15, N'now-vitd3-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (61, 16, N'ao-thun-nam-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (62, 16, N'ao-thun-nam-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (63, 16, N'ao-thun-nam-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (64, 16, N'ao-thun-nam-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (65, 17, N'quan-dui-nam-xam-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (66, 17, N'quan-dui-nam-xam-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (67, 17, N'quan-dui-nam-xam-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (68, 17, N'quan-dui-nam-xam-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (69, 18, N'ao-balo-nam-trang-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (70, 18, N'ao-balo-nam-trang-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (71, 18, N'ao-balo-nam-trang-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (72, 18, N'ao-balo-nam-trang-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (73, 19, N'quan-legging-nu-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (74, 19, N'quan-legging-nu-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (75, 19, N'quan-legging-nu-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (76, 19, N'quan-legging-nu-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (77, 20, N'ao-bra-nu-hong-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (78, 20, N'ao-bra-nu-hong-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (79, 20, N'ao-bra-nu-hong-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (80, 20, N'ao-bra-nu-hong-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (81, 21, N'quan-jogger-nam-xam-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (82, 21, N'quan-jogger-nam-xam-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (83, 21, N'quan-jogger-nam-xam-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (84, 21, N'quan-jogger-nam-xam-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (85, 22, N'ao-croptop-nu-trang-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (86, 22, N'ao-croptop-nu-trang-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (87, 22, N'ao-croptop-nu-trang-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (88, 22, N'ao-croptop-nu-trang-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (89, 23, N'quan-short-nu-xanh-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (90, 23, N'quan-short-nu-xanh-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (91, 23, N'quan-short-nu-xanh-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (92, 23, N'quan-short-nu-xanh-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (93, 24, N'ao-khoac-gio-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (94, 24, N'ao-khoac-gio-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (95, 24, N'ao-khoac-gio-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (96, 24, N'ao-khoac-gio-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (97, 25, N'tat-co-cao-combo-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (98, 25, N'tat-co-cao-combo-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (99, 25, N'tat-co-cao-combo-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (100, 25, N'tat-co-cao-combo-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (101, 26, N'ao-hoodie-be-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (102, 26, N'ao-hoodie-be-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (103, 26, N'ao-hoodie-be-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (104, 26, N'ao-hoodie-be-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (105, 27, N'quan-legging-nam-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (106, 27, N'quan-legging-nam-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (107, 27, N'quan-legging-nam-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (108, 27, N'quan-legging-nam-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (109, 28, N'ao-thun-nu-luoi-hong-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (110, 28, N'ao-thun-nu-luoi-hong-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (111, 28, N'ao-thun-nu-luoi-hong-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (112, 28, N'ao-thun-nu-luoi-hong-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (113, 29, N'mu-the-thao-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (114, 29, N'mu-the-thao-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (115, 29, N'mu-the-thao-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (116, 29, N'mu-the-thao-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (117, 30, N'ao-polo-nam-navy-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (118, 30, N'ao-polo-nam-navy-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (119, 30, N'ao-polo-nam-navy-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (120, 30, N'ao-polo-nam-navy-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (121, 31, N'shaker-3ngan-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (122, 31, N'shaker-3ngan-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (123, 31, N'shaker-3ngan-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (124, 31, N'shaker-3ngan-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (125, 32, N'gang-tay-nam-cuon-co-tay-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (126, 32, N'gang-tay-nam-cuon-co-tay-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (127, 32, N'gang-tay-nam-cuon-co-tay-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (128, 32, N'gang-tay-nam-cuon-co-tay-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (129, 33, N'dai-lung-mem-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (130, 33, N'dai-lung-mem-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (131, 33, N'dai-lung-mem-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (132, 33, N'dai-lung-mem-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (133, 34, N'day-keo-lung-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (134, 34, N'day-keo-lung-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (135, 34, N'day-keo-lung-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (136, 34, N'day-keo-lung-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (137, 35, N'tui-the-thao-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (138, 35, N'tui-the-thao-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (139, 35, N'tui-the-thao-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (140, 35, N'tui-the-thao-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (141, 36, N'bang-goi-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (142, 36, N'bang-goi-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (143, 36, N'bang-goi-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (144, 36, N'bang-goi-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (145, 37, N'day-quan-co-tay-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (146, 37, N'day-quan-co-tay-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (147, 37, N'day-quan-co-tay-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (148, 37, N'day-quan-co-tay-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (149, 38, N'dai-lung-cung-da-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (150, 38, N'dai-lung-cung-da-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (151, 38, N'dai-lung-cung-da-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (152, 38, N'dai-lung-cung-da-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (153, 39, N'binh-nuoc-1lit5-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (154, 39, N'binh-nuoc-1lit5-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (155, 39, N'binh-nuoc-1lit5-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (156, 39, N'binh-nuoc-1lit5-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (157, 40, N'bang-khuyu-tay-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (158, 40, N'bang-khuyu-tay-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (159, 40, N'bang-khuyu-tay-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (160, 40, N'bang-khuyu-tay-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (161, 41, N'khan-lanh-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (162, 41, N'khan-lanh-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (163, 41, N'khan-lanh-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (164, 41, N'khan-lanh-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (165, 42, N'gang-tay-nu-hong-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (166, 42, N'gang-tay-nu-hong-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (167, 42, N'gang-tay-nu-hong-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (168, 42, N'gang-tay-nu-hong-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (169, 43, N'tham-yoga-tpe-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (170, 43, N'tham-yoga-tpe-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (171, 43, N'tham-yoga-tpe-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (172, 43, N'tham-yoga-tpe-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (173, 44, N'foam-roller-gai-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (174, 44, N'foam-roller-gai-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (175, 44, N'foam-roller-gai-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (176, 44, N'foam-roller-gai-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (177, 45, N'day-nhay-toc-do-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (178, 45, N'day-nhay-toc-do-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (179, 45, N'day-nhay-toc-do-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (180, 45, N'day-nhay-toc-do-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (181, 46, N'bo-day-band-5muc-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (182, 46, N'bo-day-band-5muc-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (183, 46, N'bo-day-band-5muc-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (184, 46, N'bo-day-band-5muc-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (185, 47, N'power-band-vang-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (186, 47, N'power-band-vang-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (187, 47, N'power-band-vang-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (188, 47, N'power-band-vang-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (189, 48, N'bong-yoga-65cm-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (190, 48, N'bong-yoga-65cm-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (191, 48, N'bong-yoga-65cm-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (192, 48, N'bong-yoga-65cm-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (193, 49, N'con-lan-bung-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (194, 49, N'con-lan-bung-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (195, 49, N'con-lan-bung-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (196, 49, N'con-lan-bung-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (197, 50, N'gach-yoga-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (198, 50, N'gach-yoga-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (199, 50, N'gach-yoga-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (200, 50, N'gach-yoga-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (201, 51, N'nike-pro-dri-fit-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (202, 51, N'nike-pro-dri-fit-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (203, 51, N'nike-pro-dri-fit-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (204, 51, N'nike-pro-dri-fit-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (213, 54, N'nike-dri-fit-short-xam-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (214, 54, N'nike-dri-fit-short-xam-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (215, 54, N'nike-dri-fit-short-xam-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (216, 54, N'nike-dri-fit-short-xam-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (217, 55, N'nike-tech-fleece-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (218, 55, N'nike-tech-fleece-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (219, 55, N'nike-tech-fleece-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (220, 55, N'nike-tech-fleece-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (221, 56, N'nike-pro-tights-nam-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (222, 56, N'nike-pro-tights-nam-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (223, 56, N'nike-pro-tights-nam-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (224, 56, N'nike-pro-tights-nam-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (225, 57, N'nike-indy-bra-trang-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (226, 57, N'nike-indy-bra-trang-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (227, 57, N'nike-indy-bra-trang-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (228, 57, N'nike-indy-bra-trang-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (229, 58, N'nike-one-legging-nu-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (230, 58, N'nike-one-legging-nu-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (231, 58, N'nike-one-legging-nu-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (232, 58, N'nike-one-legging-nu-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (233, 59, N'nike-socks-combo-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (234, 59, N'nike-socks-combo-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (235, 59, N'nike-socks-combo-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (236, 59, N'nike-socks-combo-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (237, 60, N'nike-brasilia-bag-den-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (238, 60, N'nike-brasilia-bag-den-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (239, 60, N'nike-brasilia-bag-den-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (240, 60, N'nike-brasilia-bag-den-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (241, 61, N'nike-gloves-nam-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (242, 61, N'nike-gloves-nam-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (243, 61, N'nike-gloves-nam-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (244, 61, N'nike-gloves-nam-4.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (245, 62, N'nike-cap-heritage-trang-1.jpg', 1)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (246, 62, N'nike-cap-heritage-trang-2.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (247, 62, N'nike-cap-heritage-trang-3.jpg', 0)
GO
INSERT [dbo].[HINHANH] ([MaHinh], [MaSP], [Url], [IsMain]) VALUES (248, 62, N'nike-cap-heritage-trang-4.jpg', 0)
GO
SET IDENTITY_INSERT [dbo].[HINHANH] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 
GO
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongTien], [ThanhTien], [TrangThai], [GiamGia], [MaDonHang]) VALUES (1199, 2, CAST(N'2025-12-10T12:28:59.190' AS DateTime), CAST(1100000.00 AS Decimal(12, 2)), CAST(1045000.00 AS Decimal(12, 2)), N'Chưa thanh toán', CAST(55000.00 AS Decimal(12, 2)), 57)
GO
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongTien], [ThanhTien], [TrangThai], [GiamGia], [MaDonHang]) VALUES (1200, 2, CAST(N'2025-12-10T12:30:00.110' AS DateTime), CAST(620000.00 AS Decimal(12, 2)), CAST(589000.00 AS Decimal(12, 2)), N'Đã thanh toán', CAST(31000.00 AS Decimal(12, 2)), 58)
GO
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (1, N'Nguyễn Văn An', CAST(N'1995-10-20' AS Date), N'0905123456', N'nguyenvanan@email.com', 2, N'Nam', N'annguyen', N'password123', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (2, N'Nguyễn Ngà', CAST(N'2005-10-30' AS Date), N'0377827641', N'nguyenngadeptrai2004@gmail.com', 1, N'Nam', N'ADMIN', N'yeuuyen1234', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (3, N'Tấn Thành', CAST(N'2005-02-06' AS Date), N'0982872501', N'nguyenngadeptrai2005@gmail.com', 1, N'Nam', N'tanthanh', N'12345sa', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (4, N'Nguyễn Xuân Hùng', CAST(N'1999-02-04' AS Date), N'0397815958', N'nmgm0982@gmail.com', 4, N'Nam', N'hungdz', N'hungdz123', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (5, N'Mai Xuân Ngọc', CAST(N'2001-02-03' AS Date), N'0917267122', N'nganguyen009@gmail.com', 2, N'Nữ', N'ngocdg', N'ngoc1234', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (6, N'Nguyễn Xuân Long', CAST(N'1987-10-07' AS Date), N'0827384823', N'long123@gmail.com', 2, N'Nam', N'Midea123', N'long1234', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (7, N'Lê Xuân Hải', CAST(N'2000-05-09' AS Date), N'0937137486', N'hai1232@gmail.com', 4, N'Nam', N'haidcm', N'hai1234', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (8, N'Nguyễn Xuân Phúc', CAST(N'1978-12-08' AS Date), N'0826382134', N'nguyenxp@gmail.com', 2, N'Nam', N'xuanphuc123', N'xuanphuc123', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (9, N'Hồ Xuân Hương', CAST(N'1999-06-21' AS Date), N'0928471938', N'hxh249@gmail.com', 2, N'Nữ', N'hxh193', N'hxh192831', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (10, N'Lê Thánh Tông', NULL, N'0826471839', N'ltt228@gmail.com', 4, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (11, N'Lương Thế Vinh', CAST(N'2008-03-05' AS Date), N'0827364812', N'luongthevinh123@gmail.com', 3, N'Nam', N'luongthevinh123', N'luongthevinh123', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (13, N'Trần Bình Trọng', CAST(N'2000-12-09' AS Date), N'083738284', N'trong123@gmail.com', 4, N'Nam', N'trongtran122', N'trongtran122', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (14, N'Nguyễn Xuân Phúc', CAST(N'1999-02-08' AS Date), N'0728499999', N'nguyenxuanphuc@gmail.com', 3, N'Nam', N'nguyenxuanphuc123@', N'nguyenxuanphuc123@', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (15, N'Lê Xuân Đạt', NULL, N'098227250', N'lexuandat8882@gmail.com', 4, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (16, N'Đinh Tiên Hoàng', CAST(N'2007-02-06' AS Date), N'0827364222', N'dinhtienhoang099@gmail.com', 2, N'Nam', N'dinhtienhoang2007', N'dinhtienhoang2007', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (17, N'Nguyễn Huy Hoàng', CAST(N'2009-03-12' AS Date), N'08373848888', N'nguyenhuyhoang2009@gmail.com', 2, N'Nam', N'huyhoang03122009', N'huyhoang03122009', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (18, N'NGuyen van thanh', CAST(N'1994-11-05' AS Date), N'0358375639', N'xuanpq359@gmail.com', 4, N'Nam', N'Thanh', N'thanhsolo113', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (19, N'Nguyễn Hoàng Thành', CAST(N'2005-05-22' AS Date), N'0911012462', N'nhoangthanh@gmail.com', 1, N'Nam', N'hoangthanh', N'123123', 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (20, N'Nguyễn Thanh Hoàng', NULL, N'08373888882', N'nguyenthanghoang@gmail.com', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [SDT], [Email], [MaLoaiKH], [GioiTinh], [TenDangNhap], [MatKhau], [TrangThaiTaiKhoan]) VALUES (21, N'Lê Thanh Hải', CAST(N'2000-01-02' AS Date), N'0382728832', N'nguyenthanhhai@gmail.com', 4, N'Nam', N'nguyenthanhhai', N'nguyenthanhhai123', 1)
GO
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LichLop] ON 
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (1, 1, 11, CAST(N'2025-12-01' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (2, 1, 11, CAST(N'2025-12-03' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (3, 1, 11, CAST(N'2025-12-05' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (4, 1, 11, CAST(N'2025-12-08' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (5, 1, 11, CAST(N'2025-12-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (6, 1, 11, CAST(N'2025-12-12' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (7, 1, 11, CAST(N'2025-12-15' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (8, 1, 11, CAST(N'2025-12-17' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (9, 1, 11, CAST(N'2025-12-19' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (10, 1, 11, CAST(N'2025-12-22' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (11, 2, 20, CAST(N'2025-12-01' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (12, 2, 20, CAST(N'2025-12-03' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (13, 2, 20, CAST(N'2025-12-05' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (14, 2, 20, CAST(N'2025-12-08' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (15, 2, 20, CAST(N'2025-12-10' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (16, 2, 20, CAST(N'2025-12-12' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (17, 2, 20, CAST(N'2025-12-15' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (18, 2, 20, CAST(N'2025-12-17' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (19, 2, 20, CAST(N'2025-12-19' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (20, 2, 20, CAST(N'2025-12-22' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (21, 3, 11, CAST(N'2025-12-02' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (22, 3, 11, CAST(N'2025-12-04' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (23, 3, 11, CAST(N'2025-12-06' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (24, 3, 11, CAST(N'2025-12-09' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (25, 3, 11, CAST(N'2025-12-11' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (26, 3, 11, CAST(N'2025-12-13' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (27, 3, 11, CAST(N'2025-12-14' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (28, 3, 11, CAST(N'2025-12-15' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (29, 4, 11, CAST(N'2025-12-01' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (30, 4, 11, CAST(N'2025-12-03' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (31, 4, 11, CAST(N'2025-12-05' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (32, 4, 11, CAST(N'2025-12-08' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (33, 5, 20, CAST(N'2025-12-02' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (34, 5, 20, CAST(N'2025-12-04' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (35, 5, 20, CAST(N'2025-12-06' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (36, 5, 20, CAST(N'2025-12-09' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (37, 5, 20, CAST(N'2025-12-11' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (38, 5, 20, CAST(N'2025-12-13' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (39, 5, 20, CAST(N'2025-12-14' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (40, 5, 20, CAST(N'2025-12-15' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (41, 6, 12, CAST(N'2025-12-01' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (42, 6, 12, CAST(N'2025-12-03' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (43, 6, 12, CAST(N'2025-12-05' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (44, 6, 12, CAST(N'2025-12-08' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (45, 6, 12, CAST(N'2025-12-10' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (46, 6, 12, CAST(N'2025-12-12' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (47, 6, 12, CAST(N'2025-12-15' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (48, 6, 12, CAST(N'2025-12-17' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (49, 6, 12, CAST(N'2025-12-19' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (50, 6, 12, CAST(N'2025-12-22' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (51, 6, 12, CAST(N'2025-12-24' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (52, 6, 12, CAST(N'2025-12-26' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (53, 6, 12, CAST(N'2025-12-29' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (54, 7, 21, CAST(N'2025-12-02' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (55, 7, 21, CAST(N'2025-12-04' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (56, 7, 21, CAST(N'2025-12-06' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (57, 7, 21, CAST(N'2025-12-09' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (58, 7, 21, CAST(N'2025-12-11' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (59, 7, 21, CAST(N'2025-12-13' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (60, 7, 21, CAST(N'2025-12-16' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (61, 7, 21, CAST(N'2025-12-18' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (62, 7, 21, CAST(N'2025-12-20' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (63, 7, 21, CAST(N'2025-12-23' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (64, 7, 21, CAST(N'2025-12-25' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (65, 7, 21, CAST(N'2025-12-27' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (66, 7, 21, CAST(N'2025-12-30' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (67, 8, 22, CAST(N'2025-12-01' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (68, 8, 22, CAST(N'2025-12-03' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (69, 8, 22, CAST(N'2025-12-05' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (70, 8, 22, CAST(N'2025-12-08' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (71, 8, 22, CAST(N'2025-12-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (72, 8, 22, CAST(N'2025-12-12' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (73, 8, 22, CAST(N'2025-12-15' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (74, 8, 22, CAST(N'2025-12-17' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (75, 8, 22, CAST(N'2025-12-19' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (76, 8, 22, CAST(N'2025-12-22' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (77, 8, 22, CAST(N'2025-12-24' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (78, 8, 22, CAST(N'2025-12-26' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (79, 8, 22, CAST(N'2025-12-29' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (80, 9, 23, CAST(N'2025-12-01' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (81, 9, 23, CAST(N'2025-12-03' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (82, 9, 23, CAST(N'2025-12-05' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (83, 9, 23, CAST(N'2025-12-08' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (84, 9, 23, CAST(N'2025-12-10' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (85, 9, 23, CAST(N'2025-12-12' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (86, 9, 23, CAST(N'2025-12-15' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (87, 9, 23, CAST(N'2025-12-17' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (88, 9, 23, CAST(N'2025-12-19' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (89, 9, 23, CAST(N'2025-12-22' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (90, 9, 23, CAST(N'2025-12-24' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (91, 9, 23, CAST(N'2025-12-26' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (92, 9, 23, CAST(N'2025-12-29' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (93, 10, 13, CAST(N'2025-12-02' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (94, 10, 13, CAST(N'2025-12-04' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (95, 10, 13, CAST(N'2025-12-06' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (96, 10, 13, CAST(N'2025-12-09' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (97, 10, 13, CAST(N'2025-12-11' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (98, 10, 13, CAST(N'2025-12-13' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (99, 10, 13, CAST(N'2025-12-16' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (100, 10, 13, CAST(N'2025-12-18' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (101, 10, 13, CAST(N'2025-12-20' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (102, 10, 13, CAST(N'2025-12-23' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (103, 10, 13, CAST(N'2025-12-25' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (104, 10, 13, CAST(N'2025-12-27' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (105, 10, 13, CAST(N'2025-12-30' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (106, 11, 22, CAST(N'2025-12-01' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (107, 11, 22, CAST(N'2025-12-03' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (108, 11, 22, CAST(N'2025-12-05' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (109, 11, 22, CAST(N'2025-12-08' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (110, 11, 22, CAST(N'2025-12-10' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (111, 11, 22, CAST(N'2025-12-12' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (112, 11, 22, CAST(N'2025-12-15' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (113, 11, 22, CAST(N'2025-12-17' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (114, 11, 22, CAST(N'2025-12-19' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (115, 11, 22, CAST(N'2025-12-22' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (116, 11, 22, CAST(N'2025-12-24' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (117, 11, 22, CAST(N'2025-12-26' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (118, 11, 22, CAST(N'2025-12-29' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (119, 12, 23, CAST(N'2025-12-02' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (120, 12, 23, CAST(N'2025-12-04' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (121, 12, 23, CAST(N'2025-12-06' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (122, 12, 23, CAST(N'2025-12-09' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (123, 12, 23, CAST(N'2025-12-11' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (124, 12, 23, CAST(N'2025-12-13' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (125, 12, 23, CAST(N'2025-12-16' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (126, 12, 23, CAST(N'2025-12-18' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (127, 12, 23, CAST(N'2025-12-20' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (128, 12, 23, CAST(N'2025-12-23' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (129, 12, 23, CAST(N'2025-12-25' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (130, 12, 23, CAST(N'2025-12-27' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (131, 12, 23, CAST(N'2025-12-30' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (132, 13, 41, CAST(N'2025-12-01' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (133, 13, 41, CAST(N'2025-12-03' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (134, 13, 41, CAST(N'2025-12-05' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (135, 13, 41, CAST(N'2025-12-08' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (136, 13, 41, CAST(N'2025-12-10' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (137, 13, 41, CAST(N'2025-12-12' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (138, 13, 41, CAST(N'2025-12-15' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (139, 13, 41, CAST(N'2025-12-17' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (140, 13, 41, CAST(N'2025-12-19' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (141, 13, 41, CAST(N'2025-12-22' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (142, 13, 41, CAST(N'2025-12-24' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (143, 13, 41, CAST(N'2025-12-26' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (144, 13, 41, CAST(N'2025-12-29' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (145, 14, 15, CAST(N'2025-12-02' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (146, 14, 15, CAST(N'2025-12-04' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (147, 14, 15, CAST(N'2025-12-06' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (148, 14, 15, CAST(N'2025-12-09' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (149, 14, 15, CAST(N'2025-12-11' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (150, 14, 15, CAST(N'2025-12-13' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (151, 14, 15, CAST(N'2025-12-16' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (152, 14, 15, CAST(N'2025-12-18' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (153, 14, 15, CAST(N'2025-12-20' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (154, 14, 15, CAST(N'2025-12-23' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (155, 14, 15, CAST(N'2025-12-25' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (156, 14, 15, CAST(N'2025-12-27' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (157, 14, 15, CAST(N'2025-12-30' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (158, 15, 24, CAST(N'2025-12-01' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (159, 15, 24, CAST(N'2025-12-03' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (160, 15, 24, CAST(N'2025-12-05' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (161, 15, 24, CAST(N'2025-12-08' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (162, 15, 24, CAST(N'2025-12-10' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (163, 15, 24, CAST(N'2025-12-12' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (164, 15, 24, CAST(N'2025-12-15' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (165, 15, 24, CAST(N'2025-12-17' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (166, 15, 24, CAST(N'2025-12-19' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (167, 15, 24, CAST(N'2025-12-22' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (168, 15, 24, CAST(N'2025-12-24' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (169, 15, 24, CAST(N'2025-12-26' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (170, 15, 24, CAST(N'2025-12-29' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (171, 16, 16, CAST(N'2025-12-01' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (172, 16, 16, CAST(N'2025-12-03' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (173, 16, 16, CAST(N'2025-12-05' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (174, 16, 16, CAST(N'2025-12-08' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (175, 16, 16, CAST(N'2025-12-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (176, 16, 16, CAST(N'2025-12-12' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (177, 16, 16, CAST(N'2025-12-15' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (178, 16, 16, CAST(N'2025-12-17' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (179, 16, 16, CAST(N'2025-12-19' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (180, 16, 16, CAST(N'2025-12-22' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (181, 16, 16, CAST(N'2025-12-24' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (182, 16, 16, CAST(N'2025-12-26' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (183, 16, 16, CAST(N'2025-12-29' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (184, 17, 25, CAST(N'2025-12-02' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (185, 17, 25, CAST(N'2025-12-04' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (186, 17, 25, CAST(N'2025-12-06' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (187, 17, 25, CAST(N'2025-12-09' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (188, 17, 25, CAST(N'2025-12-11' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (189, 17, 25, CAST(N'2025-12-13' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (190, 17, 25, CAST(N'2025-12-16' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (191, 17, 25, CAST(N'2025-12-18' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (192, 17, 25, CAST(N'2025-12-20' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (193, 17, 25, CAST(N'2025-12-23' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (194, 17, 25, CAST(N'2025-12-25' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (195, 17, 25, CAST(N'2025-12-27' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (196, 17, 25, CAST(N'2025-12-30' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (197, 18, 17, CAST(N'2025-12-01' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (198, 18, 17, CAST(N'2025-12-03' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (199, 18, 17, CAST(N'2025-12-05' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (200, 18, 17, CAST(N'2025-12-08' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (201, 18, 17, CAST(N'2025-12-10' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (202, 18, 17, CAST(N'2025-12-12' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (203, 18, 17, CAST(N'2025-12-15' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (204, 18, 17, CAST(N'2025-12-17' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (205, 18, 17, CAST(N'2025-12-19' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (206, 18, 17, CAST(N'2025-12-22' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (207, 18, 17, CAST(N'2025-12-24' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (208, 18, 17, CAST(N'2025-12-26' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (209, 18, 17, CAST(N'2025-12-29' AS Date), CAST(N'20:00:00' AS Time), CAST(N'21:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (210, 19, 19, CAST(N'2025-12-02' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (211, 19, 19, CAST(N'2025-12-04' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (212, 19, 19, CAST(N'2025-12-06' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (213, 19, 19, CAST(N'2025-12-09' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (214, 19, 19, CAST(N'2025-12-11' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (215, 19, 19, CAST(N'2025-12-13' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (216, 19, 19, CAST(N'2025-12-16' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (217, 19, 19, CAST(N'2025-12-18' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (218, 19, 19, CAST(N'2025-12-20' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (219, 19, 19, CAST(N'2025-12-23' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (220, 19, 19, CAST(N'2025-12-25' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (221, 19, 19, CAST(N'2025-12-27' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (222, 19, 19, CAST(N'2025-12-30' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (223, 20, 20, CAST(N'2025-12-01' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (224, 20, 20, CAST(N'2025-12-03' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (225, 20, 20, CAST(N'2025-12-05' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (226, 20, 20, CAST(N'2025-12-08' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (227, 20, 20, CAST(N'2025-12-10' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (228, 20, 20, CAST(N'2025-12-12' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (229, 20, 20, CAST(N'2025-12-15' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (230, 20, 20, CAST(N'2025-12-17' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (231, 20, 20, CAST(N'2025-12-19' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (232, 20, 20, CAST(N'2025-12-22' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (233, 20, 20, CAST(N'2025-12-24' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (234, 20, 20, CAST(N'2025-12-26' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (235, 20, 20, CAST(N'2025-12-29' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (236, 21, 21, CAST(N'2025-12-02' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (237, 21, 21, CAST(N'2025-12-04' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (238, 21, 21, CAST(N'2025-12-06' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (239, 21, 21, CAST(N'2025-12-09' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (240, 21, 21, CAST(N'2025-12-11' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (241, 21, 21, CAST(N'2025-12-13' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (242, 21, 21, CAST(N'2025-12-16' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (243, 21, 21, CAST(N'2025-12-18' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (244, 21, 21, CAST(N'2025-12-20' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (245, 21, 21, CAST(N'2025-12-23' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (246, 21, 21, CAST(N'2025-12-25' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (247, 21, 21, CAST(N'2025-12-27' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (248, 21, 21, CAST(N'2025-12-30' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (249, 22, 28, CAST(N'2025-12-01' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (250, 22, 28, CAST(N'2025-12-03' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (251, 22, 28, CAST(N'2025-12-05' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (252, 22, 28, CAST(N'2025-12-08' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (253, 22, 28, CAST(N'2025-12-10' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (254, 22, 28, CAST(N'2025-12-12' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (255, 22, 28, CAST(N'2025-12-15' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (256, 22, 28, CAST(N'2025-12-17' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (257, 22, 28, CAST(N'2025-12-19' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (258, 22, 28, CAST(N'2025-12-22' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (259, 23, 46, CAST(N'2025-12-02' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (260, 23, 46, CAST(N'2025-12-04' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (261, 23, 46, CAST(N'2025-12-07' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (262, 23, 46, CAST(N'2025-12-09' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (263, 23, 46, CAST(N'2025-12-11' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (264, 23, 46, CAST(N'2025-12-13' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (265, 23, 46, CAST(N'2025-12-16' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (266, 23, 46, CAST(N'2025-12-18' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (267, 23, 46, CAST(N'2025-12-20' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (268, 23, 46, CAST(N'2025-12-22' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Chưa diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (269, 24, 20, CAST(N'2025-01-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (270, 24, 20, CAST(N'2025-01-13' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (271, 24, 20, CAST(N'2025-01-15' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (272, 24, 20, CAST(N'2025-01-17' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (273, 24, 20, CAST(N'2025-01-20' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (274, 24, 20, CAST(N'2025-01-22' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (275, 24, 20, CAST(N'2025-01-24' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (276, 24, 20, CAST(N'2025-01-27' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (277, 24, 20, CAST(N'2025-01-29' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (278, 24, 20, CAST(N'2025-01-31' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (279, 24, 20, CAST(N'2025-02-03' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (280, 24, 20, CAST(N'2025-02-05' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (281, 24, 20, CAST(N'2025-02-07' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (282, 24, 20, CAST(N'2025-02-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (283, 24, 20, CAST(N'2025-02-12' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (284, 24, 20, CAST(N'2025-02-14' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (285, 24, 20, CAST(N'2025-02-17' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (286, 24, 20, CAST(N'2025-02-19' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (287, 24, 20, CAST(N'2025-02-21' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (288, 24, 20, CAST(N'2025-02-24' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (289, 24, 20, CAST(N'2025-02-26' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (290, 24, 20, CAST(N'2025-02-28' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (291, 24, 20, CAST(N'2025-03-03' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (292, 24, 20, CAST(N'2025-03-05' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (293, 24, 20, CAST(N'2025-03-07' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (294, 24, 20, CAST(N'2025-03-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (295, 24, 20, CAST(N'2025-03-12' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (296, 24, 20, CAST(N'2025-03-14' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (297, 24, 20, CAST(N'2025-03-17' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (298, 24, 20, CAST(N'2025-03-19' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (299, 24, 20, CAST(N'2025-03-21' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (300, 24, 20, CAST(N'2025-03-24' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (301, 24, 20, CAST(N'2025-03-26' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (302, 24, 20, CAST(N'2025-03-28' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (303, 24, 20, CAST(N'2025-03-31' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (304, 24, 20, CAST(N'2025-04-02' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (305, 24, 20, CAST(N'2025-04-04' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (306, 24, 20, CAST(N'2025-04-07' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (307, 24, 20, CAST(N'2025-04-09' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (308, 24, 20, CAST(N'2025-04-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (309, 25, 21, CAST(N'2025-02-04' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (310, 25, 21, CAST(N'2025-02-06' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (311, 25, 21, CAST(N'2025-02-11' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (312, 25, 21, CAST(N'2025-02-13' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (313, 25, 21, CAST(N'2025-02-18' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (314, 25, 21, CAST(N'2025-02-20' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (315, 25, 21, CAST(N'2025-02-25' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (316, 25, 21, CAST(N'2025-02-27' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (317, 25, 21, CAST(N'2025-03-03' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (318, 25, 21, CAST(N'2025-03-05' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (319, 25, 21, CAST(N'2025-03-10' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (320, 25, 21, CAST(N'2025-03-12' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (321, 25, 21, CAST(N'2025-03-17' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (322, 25, 21, CAST(N'2025-03-19' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (323, 25, 21, CAST(N'2025-03-24' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (324, 25, 21, CAST(N'2025-03-26' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (325, 25, 21, CAST(N'2025-03-31' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (326, 25, 21, CAST(N'2025-04-02' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (327, 25, 21, CAST(N'2025-04-07' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (328, 25, 21, CAST(N'2025-04-09' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (329, 26, 22, CAST(N'2025-01-15' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (330, 26, 22, CAST(N'2025-01-17' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (331, 26, 22, CAST(N'2025-01-20' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (332, 26, 22, CAST(N'2025-01-22' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (333, 26, 22, CAST(N'2025-01-24' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (334, 26, 22, CAST(N'2025-01-27' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (335, 26, 22, CAST(N'2025-01-29' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (336, 26, 22, CAST(N'2025-01-31' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (337, 26, 22, CAST(N'2025-02-03' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (338, 26, 22, CAST(N'2025-02-05' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (339, 26, 22, CAST(N'2025-02-07' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (340, 26, 22, CAST(N'2025-02-10' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (341, 26, 22, CAST(N'2025-02-12' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (342, 26, 22, CAST(N'2025-02-14' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (343, 26, 22, CAST(N'2025-02-17' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (344, 26, 22, CAST(N'2025-02-19' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (345, 26, 22, CAST(N'2025-02-21' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (346, 26, 22, CAST(N'2025-02-24' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (347, 26, 22, CAST(N'2025-02-26' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (348, 26, 22, CAST(N'2025-02-28' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (349, 26, 22, CAST(N'2025-03-03' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (350, 26, 22, CAST(N'2025-03-05' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (351, 26, 22, CAST(N'2025-03-07' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (352, 26, 22, CAST(N'2025-03-10' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (353, 26, 22, CAST(N'2025-03-12' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (354, 26, 22, CAST(N'2025-03-14' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (355, 26, 22, CAST(N'2025-03-17' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (356, 26, 22, CAST(N'2025-03-19' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (357, 26, 22, CAST(N'2025-03-21' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (358, 26, 22, CAST(N'2025-03-24' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (359, 26, 22, CAST(N'2025-03-26' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (360, 26, 22, CAST(N'2025-03-28' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (361, 26, 22, CAST(N'2025-03-31' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (362, 26, 22, CAST(N'2025-04-02' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (363, 26, 22, CAST(N'2025-04-04' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (364, 26, 22, CAST(N'2025-04-07' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (365, 26, 22, CAST(N'2025-04-09' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (366, 26, 22, CAST(N'2025-04-11' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (367, 26, 22, CAST(N'2025-04-14' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (368, 26, 22, CAST(N'2025-04-16' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (369, 26, 22, CAST(N'2025-04-18' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (370, 26, 22, CAST(N'2025-04-21' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (371, 26, 22, CAST(N'2025-04-23' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (372, 26, 22, CAST(N'2025-04-25' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (373, 26, 22, CAST(N'2025-04-28' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (374, 26, 22, CAST(N'2025-04-30' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (375, 26, 22, CAST(N'2025-05-02' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (376, 26, 22, CAST(N'2025-05-05' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (377, 26, 22, CAST(N'2025-05-07' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (378, 26, 22, CAST(N'2025-05-09' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (379, 26, 22, CAST(N'2025-05-12' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (380, 26, 22, CAST(N'2025-05-14' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (381, 26, 22, CAST(N'2025-05-15' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (382, 27, 23, CAST(N'2025-03-04' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (383, 27, 23, CAST(N'2025-03-06' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (384, 27, 23, CAST(N'2025-03-11' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (385, 27, 23, CAST(N'2025-03-13' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (386, 27, 23, CAST(N'2025-03-18' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (387, 27, 23, CAST(N'2025-03-20' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (388, 27, 23, CAST(N'2025-03-25' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (389, 27, 23, CAST(N'2025-03-27' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (390, 27, 23, CAST(N'2025-04-01' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (391, 27, 23, CAST(N'2025-04-03' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (392, 27, 23, CAST(N'2025-04-08' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (393, 27, 23, CAST(N'2025-04-10' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (394, 27, 23, CAST(N'2025-04-15' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (395, 27, 23, CAST(N'2025-04-17' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (396, 27, 23, CAST(N'2025-04-22' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (397, 27, 23, CAST(N'2025-04-24' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (398, 27, 23, CAST(N'2025-04-29' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (399, 27, 23, CAST(N'2025-05-01' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (400, 27, 23, CAST(N'2025-05-06' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (401, 27, 23, CAST(N'2025-05-08' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (402, 27, 23, CAST(N'2025-05-13' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (403, 27, 23, CAST(N'2025-05-15' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (404, 27, 23, CAST(N'2025-05-20' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (405, 27, 23, CAST(N'2025-05-22' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (406, 27, 23, CAST(N'2025-05-27' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (407, 27, 23, CAST(N'2025-05-29' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (408, 27, 23, CAST(N'2025-06-03' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (409, 27, 23, CAST(N'2025-06-05' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (410, 27, 23, CAST(N'2025-06-10' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (411, 27, 23, CAST(N'2025-06-12' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (412, 27, 23, CAST(N'2025-06-17' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (413, 27, 23, CAST(N'2025-06-19' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (414, 27, 23, CAST(N'2025-06-24' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (415, 27, 23, CAST(N'2025-06-26' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (416, 27, 23, CAST(N'2025-07-01' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (417, 28, 24, CAST(N'2025-02-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (418, 28, 24, CAST(N'2025-02-12' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (419, 28, 24, CAST(N'2025-02-17' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (420, 28, 24, CAST(N'2025-02-19' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (421, 28, 24, CAST(N'2025-02-24' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (422, 28, 24, CAST(N'2025-02-26' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (423, 28, 24, CAST(N'2025-03-03' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (424, 28, 24, CAST(N'2025-03-05' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (425, 28, 24, CAST(N'2025-03-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (426, 28, 24, CAST(N'2025-03-12' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (427, 28, 24, CAST(N'2025-03-17' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (428, 28, 24, CAST(N'2025-03-19' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (429, 28, 24, CAST(N'2025-03-24' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (430, 28, 24, CAST(N'2025-03-26' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (431, 28, 24, CAST(N'2025-03-31' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (432, 28, 24, CAST(N'2025-04-02' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (433, 28, 24, CAST(N'2025-04-07' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (434, 28, 24, CAST(N'2025-04-09' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (435, 28, 24, CAST(N'2025-04-14' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (436, 28, 24, CAST(N'2025-04-16' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (437, 28, 24, CAST(N'2025-04-21' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (438, 28, 24, CAST(N'2025-04-23' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (439, 28, 24, CAST(N'2025-04-28' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (440, 28, 24, CAST(N'2025-04-30' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (441, 28, 24, CAST(N'2025-05-05' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (442, 28, 24, CAST(N'2025-05-07' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (443, 28, 24, CAST(N'2025-05-12' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (444, 28, 24, CAST(N'2025-05-14' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (445, 28, 24, CAST(N'2025-05-19' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (446, 28, 24, CAST(N'2025-05-21' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (447, 28, 24, CAST(N'2025-05-26' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (448, 28, 24, CAST(N'2025-05-28' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (449, 28, 24, CAST(N'2025-06-02' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (450, 28, 24, CAST(N'2025-06-04' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (451, 28, 24, CAST(N'2025-06-09' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (452, 28, 24, CAST(N'2025-06-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (453, 29, 25, CAST(N'2025-01-21' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (454, 29, 25, CAST(N'2025-01-23' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (455, 29, 25, CAST(N'2025-01-28' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (456, 29, 25, CAST(N'2025-01-30' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (457, 29, 25, CAST(N'2025-02-04' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (458, 29, 25, CAST(N'2025-02-06' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (459, 29, 25, CAST(N'2025-02-11' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (460, 29, 25, CAST(N'2025-02-13' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (461, 29, 25, CAST(N'2025-02-18' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (462, 29, 25, CAST(N'2025-02-20' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (463, 29, 25, CAST(N'2025-02-25' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (464, 29, 25, CAST(N'2025-02-27' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (465, 29, 25, CAST(N'2025-03-04' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (466, 29, 25, CAST(N'2025-03-06' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (467, 29, 25, CAST(N'2025-03-11' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (468, 29, 25, CAST(N'2025-03-13' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (469, 29, 25, CAST(N'2025-03-18' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (470, 29, 25, CAST(N'2025-03-20' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (471, 29, 25, CAST(N'2025-03-25' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (472, 29, 25, CAST(N'2025-03-27' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (473, 29, 25, CAST(N'2025-04-01' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (474, 29, 25, CAST(N'2025-04-03' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (475, 29, 25, CAST(N'2025-04-08' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (476, 29, 25, CAST(N'2025-04-10' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (477, 29, 25, CAST(N'2025-04-15' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (478, 29, 25, CAST(N'2025-04-17' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (479, 29, 25, CAST(N'2025-04-22' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (480, 29, 25, CAST(N'2025-04-24' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (481, 29, 25, CAST(N'2025-04-29' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (482, 29, 25, CAST(N'2025-05-01' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (483, 29, 25, CAST(N'2025-05-06' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (484, 29, 25, CAST(N'2025-05-08' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (485, 29, 25, CAST(N'2025-05-13' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (486, 29, 25, CAST(N'2025-05-15' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (487, 29, 25, CAST(N'2025-05-20' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (488, 30, 26, CAST(N'2025-02-05' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (489, 30, 26, CAST(N'2025-02-07' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (490, 30, 26, CAST(N'2025-02-10' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (491, 30, 26, CAST(N'2025-02-12' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (492, 30, 26, CAST(N'2025-02-17' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (493, 30, 26, CAST(N'2025-02-19' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (494, 30, 26, CAST(N'2025-02-24' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (495, 30, 26, CAST(N'2025-02-26' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (496, 30, 26, CAST(N'2025-03-03' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (497, 30, 26, CAST(N'2025-03-05' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (498, 30, 26, CAST(N'2025-03-10' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (499, 30, 26, CAST(N'2025-03-12' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (500, 30, 26, CAST(N'2025-03-17' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (501, 30, 26, CAST(N'2025-03-19' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (502, 30, 26, CAST(N'2025-03-24' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (503, 30, 26, CAST(N'2025-03-26' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (504, 30, 26, CAST(N'2025-03-31' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (505, 30, 26, CAST(N'2025-04-02' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (506, 30, 26, CAST(N'2025-04-07' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (507, 30, 26, CAST(N'2025-04-09' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (508, 30, 26, CAST(N'2025-04-14' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (509, 30, 26, CAST(N'2025-04-16' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (510, 30, 26, CAST(N'2025-04-21' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (511, 30, 26, CAST(N'2025-04-23' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (512, 30, 26, CAST(N'2025-04-28' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (513, 30, 26, CAST(N'2025-04-30' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (514, 30, 26, CAST(N'2025-05-05' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (515, 30, 26, CAST(N'2025-05-07' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (516, 30, 26, CAST(N'2025-05-12' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (517, 30, 26, CAST(N'2025-05-14' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (518, 30, 26, CAST(N'2025-05-19' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (519, 30, 26, CAST(N'2025-05-21' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (520, 30, 26, CAST(N'2025-05-26' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (521, 30, 26, CAST(N'2025-05-28' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (522, 30, 26, CAST(N'2025-06-02' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (523, 30, 26, CAST(N'2025-06-04' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (524, 30, 26, CAST(N'2025-06-05' AS Date), CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (525, 31, 27, CAST(N'2025-03-11' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (526, 31, 27, CAST(N'2025-03-13' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (527, 31, 27, CAST(N'2025-03-18' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (528, 31, 27, CAST(N'2025-03-20' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (529, 31, 27, CAST(N'2025-03-25' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (530, 31, 27, CAST(N'2025-03-27' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (531, 31, 27, CAST(N'2025-04-01' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (532, 31, 27, CAST(N'2025-04-03' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (533, 31, 27, CAST(N'2025-04-08' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (534, 31, 27, CAST(N'2025-04-10' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (535, 31, 27, CAST(N'2025-04-15' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (536, 31, 27, CAST(N'2025-04-17' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (537, 31, 27, CAST(N'2025-04-22' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (538, 31, 27, CAST(N'2025-04-24' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (539, 31, 27, CAST(N'2025-04-29' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (540, 31, 27, CAST(N'2025-05-01' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (541, 31, 27, CAST(N'2025-05-06' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (542, 31, 27, CAST(N'2025-05-08' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (543, 31, 27, CAST(N'2025-05-13' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (544, 31, 27, CAST(N'2025-05-15' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (545, 31, 27, CAST(N'2025-05-20' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (546, 31, 27, CAST(N'2025-05-22' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (547, 31, 27, CAST(N'2025-05-27' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (548, 31, 27, CAST(N'2025-05-29' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (549, 31, 27, CAST(N'2025-06-03' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (550, 31, 27, CAST(N'2025-06-05' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (551, 31, 27, CAST(N'2025-06-10' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (552, 31, 27, CAST(N'2025-06-12' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (553, 31, 27, CAST(N'2025-06-17' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (554, 31, 27, CAST(N'2025-06-19' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (555, 31, 27, CAST(N'2025-06-24' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (556, 31, 27, CAST(N'2025-06-26' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (557, 31, 27, CAST(N'2025-07-01' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (558, 31, 27, CAST(N'2025-07-03' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (559, 31, 27, CAST(N'2025-07-08' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (560, 31, 27, CAST(N'2025-07-10' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (561, 32, 28, CAST(N'2025-01-27' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (562, 32, 28, CAST(N'2025-01-29' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (563, 32, 28, CAST(N'2025-02-03' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (564, 32, 28, CAST(N'2025-02-05' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (565, 32, 28, CAST(N'2025-02-10' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (566, 32, 28, CAST(N'2025-02-12' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (567, 32, 28, CAST(N'2025-02-17' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (568, 32, 28, CAST(N'2025-02-19' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (569, 32, 28, CAST(N'2025-02-24' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (570, 32, 28, CAST(N'2025-02-26' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (571, 32, 28, CAST(N'2025-03-03' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (572, 32, 28, CAST(N'2025-03-05' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (573, 32, 28, CAST(N'2025-03-10' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (574, 32, 28, CAST(N'2025-03-12' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (575, 32, 28, CAST(N'2025-03-17' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (576, 32, 28, CAST(N'2025-03-19' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (577, 32, 28, CAST(N'2025-03-24' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (578, 32, 28, CAST(N'2025-03-26' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (579, 32, 28, CAST(N'2025-03-31' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (580, 32, 28, CAST(N'2025-04-02' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (581, 32, 28, CAST(N'2025-04-07' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (582, 32, 28, CAST(N'2025-04-09' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (583, 32, 28, CAST(N'2025-04-14' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (584, 32, 28, CAST(N'2025-04-16' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (585, 32, 28, CAST(N'2025-04-21' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (586, 32, 28, CAST(N'2025-04-23' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (587, 32, 28, CAST(N'2025-04-25' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (588, 33, 21, CAST(N'2025-03-05' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (589, 33, 21, CAST(N'2025-03-07' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (590, 33, 21, CAST(N'2025-03-12' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (591, 33, 21, CAST(N'2025-03-14' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (592, 33, 21, CAST(N'2025-03-19' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (593, 33, 21, CAST(N'2025-03-21' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (594, 33, 21, CAST(N'2025-03-26' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (595, 33, 21, CAST(N'2025-03-28' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (596, 33, 21, CAST(N'2025-04-02' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (597, 33, 21, CAST(N'2025-04-04' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (598, 33, 21, CAST(N'2025-04-09' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (599, 33, 21, CAST(N'2025-04-11' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (600, 33, 21, CAST(N'2025-04-16' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (601, 33, 21, CAST(N'2025-04-18' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (602, 33, 21, CAST(N'2025-04-23' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (603, 33, 21, CAST(N'2025-04-25' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (604, 33, 21, CAST(N'2025-04-30' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (605, 33, 21, CAST(N'2025-05-02' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (606, 33, 21, CAST(N'2025-05-07' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (607, 33, 21, CAST(N'2025-05-09' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (608, 33, 21, CAST(N'2025-05-14' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (609, 33, 21, CAST(N'2025-05-16' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (610, 33, 21, CAST(N'2025-05-21' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (611, 33, 21, CAST(N'2025-05-23' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (612, 33, 21, CAST(N'2025-05-28' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (613, 33, 21, CAST(N'2025-05-30' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (614, 33, 21, CAST(N'2025-06-04' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (615, 33, 21, CAST(N'2025-06-06' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (616, 33, 21, CAST(N'2025-06-11' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (617, 33, 21, CAST(N'2025-06-13' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (618, 33, 21, CAST(N'2025-06-18' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (619, 33, 21, CAST(N'2025-06-20' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (620, 33, 21, CAST(N'2025-06-25' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (621, 33, 21, CAST(N'2025-06-27' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (622, 33, 21, CAST(N'2025-07-02' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
INSERT [dbo].[LichLop] ([MaLichLop], [MaLop], [MaNV], [NgayHoc], [GioBatDau], [GioKetThuc], [TrangThai]) VALUES (623, 33, 21, CAST(N'2025-07-04' AS Date), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Đã diễn ra')
GO
SET IDENTITY_INSERT [dbo].[LichLop] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiKhachHang] ON 
GO
INSERT [dbo].[LoaiKhachHang] ([MaLoaiKH], [TenLoai], [MucGiam]) VALUES (1, N'Học sinh, Sinh viên', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LoaiKhachHang] ([MaLoaiKH], [TenLoai], [MucGiam]) VALUES (2, N'Gym Member', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LoaiKhachHang] ([MaLoaiKH], [TenLoai], [MucGiam]) VALUES (3, N'Gym VIP', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LoaiKhachHang] ([MaLoaiKH], [TenLoai], [MucGiam]) VALUES (4, N'Gym Null', CAST(0.00 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[LoaiKhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (1, N'Thực phẩm bổ sung')
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (2, N'Quần áo tập luyện')
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (3, N'Phụ kiện tập luyện')
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (4, N'Dụng cụ tập nhỏ')
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[LopHoc] ON 
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (1, N'Boxing Nhập Môn', 6, CAST(800000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-22' AS Date), 10, 20, 2, 11)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (2, N'Boxing Nâng Cao', 6, CAST(900000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-22' AS Date), 10, 20, 1, 20)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (3, N'Cardio Boxing', 6, CAST(750000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), 8, 20, 0, 11)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (4, N'Boxing Đối Kháng', 6, CAST(950000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-08' AS Date), 4, 20, 1, 11)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (5, N'Boxing Cho Bé', 6, CAST(500000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), 8, 15, 0, 20)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (6, N'Yoga Cơ Bản', 7, CAST(600000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-29' AS Date), 13, 30, 0, 12)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (7, N'Yoga Trị Liệu Cột Sống', 7, CAST(800000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-29' AS Date), 13, 30, 1, 21)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (8, N'Yoga Nâng Cao Vinyasa', 7, CAST(900000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), 13, 30, 0, 39)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (9, N'Yoga Dưỡng Sinh', 7, CAST(450000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), 13, 30, 1, 12)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (10, N'Aerobics Đốt Mỡ', 8, CAST(550000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-29' AS Date), 13, 35, 0, 13)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (11, N'Step Aerobics Cơ Bản', 8, CAST(500000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), 13, 35, 1, 22)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (12, N'Combat Thể Lực', 9, CAST(700000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-29' AS Date), 13, 30, 1, 23)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (13, N'Combat Cường Độ Cao', 9, CAST(600000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), 13, 30, 0, 41)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (14, N'New Pump Tạ Nhóm', 10, CAST(650000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-22' AS Date), 13, 25, 0, 15)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (15, N'New Pump Cường Độ Cao', 10, CAST(700000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), 13, 25, 0, 24)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (16, N'Zumba Fitness', 11, CAST(500000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-22' AS Date), 13, 40, 0, 16)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (17, N'Zumba Nâng Cao', 11, CAST(550000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), 13, 40, 0, 25)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (18, N'Bum N Tum Siết Mông Đùi', 12, CAST(600000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-22' AS Date), 13, 25, 1, 17)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (19, N'Bum N Tum Cường Độ Cao', 12, CAST(600000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), 13, 25, 0, 26)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (20, N'K-Pop Dance Cover', 13, CAST(700000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-22' AS Date), 13, 30, 0, 18)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (21, N'Sexy Dance', 13, CAST(700000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), 13, 30, 0, 27)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (22, N'HIIT & Core', 14, CAST(750000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-22' AS Date), 10, 25, 0, 28)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (23, N'HIIT Toàn Thân', 14, CAST(750000.00 AS Decimal(12, 2)), CAST(N'2025-12-01' AS Date), CAST(N'2025-12-22' AS Date), 10, 25, 0, 46)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (24, N'Boxing Cơ Bản', 6, CAST(800000.00 AS Decimal(12, 2)), CAST(N'2025-01-10' AS Date), CAST(N'2025-04-10' AS Date), 40, 25, 0, 20)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (25, N'Yoga Sức Bền', 7, CAST(750000.00 AS Decimal(12, 2)), CAST(N'2025-02-01' AS Date), CAST(N'2025-05-01' AS Date), 20, 25, 0, 21)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (26, N'Aerobic Giảm Cân', 8, CAST(700000.00 AS Decimal(12, 2)), CAST(N'2025-01-15' AS Date), CAST(N'2025-05-15' AS Date), 53, 30, 0, 22)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (27, N'New Combat Nâng Cao', 9, CAST(850000.00 AS Decimal(12, 2)), CAST(N'2025-03-01' AS Date), CAST(N'2025-07-01' AS Date), 35, 25, 0, 23)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (28, N'New Pump Sức Mạnh', 10, CAST(900000.00 AS Decimal(12, 2)), CAST(N'2025-02-10' AS Date), CAST(N'2025-06-10' AS Date), 36, 25, 0, 24)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (29, N'Zumba Vui Khoẻ', 11, CAST(700000.00 AS Decimal(12, 2)), CAST(N'2025-01-20' AS Date), CAST(N'2025-05-20' AS Date), 35, 30, 0, 25)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (30, N'Bum N Tum Đốt Mỡ', 12, CAST(700000.00 AS Decimal(12, 2)), CAST(N'2025-02-05' AS Date), CAST(N'2025-06-05' AS Date), 37, 25, 0, 26)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (31, N'Dance Fit Động Lực', 13, CAST(750000.00 AS Decimal(12, 2)), CAST(N'2025-03-10' AS Date), CAST(N'2025-07-10' AS Date), 36, 25, 0, 27)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (32, N'Cardio & Core Cường Độ Cao', 14, CAST(850000.00 AS Decimal(12, 2)), CAST(N'2025-01-25' AS Date), CAST(N'2025-04-25' AS Date), 27, 25, 0, 28)
GO
INSERT [dbo].[LopHoc] ([MaLop], [TenLop], [MaCM], [HocPhi], [NgayBatDau], [NgayKetThuc], [SoBuoi], [SiSoToiDa], [SiSoHienTai], [MaNV]) VALUES (33, N'Yoga Giãn Cơ', 7, CAST(750000.00 AS Decimal(12, 2)), CAST(N'2025-03-05' AS Date), CAST(N'2025-07-05' AS Date), 36, 25, 0, 21)
GO
SET IDENTITY_INSERT [dbo].[LopHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (4, 4, N'lethitan', N'Welcome@2025', N'Nữ', N'Lê Thị Tân', N'0901000001', CAST(N'1998-05-10' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (5, 4, N'nguyenthile', N'Welcome@2025', N'Nữ', N'Nguyễn Thị Lễ', N'0901000002', CAST(N'1999-08-15' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (6, 3, N'phamvanquan', N'Welcome@2025', N'Nam', N'Phạm Văn Quản', N'0902000001', CAST(N'1985-03-20' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (7, 3, N'tranthily', N'Welcome@2025', N'Nữ', N'Trần Thị Lý', N'0902000002', CAST(N'1987-06-12' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (8, 3, N'ngominhquan', N'Welcome@2025', N'Nam', N'Ngô Minh Quản', N'0902000003', CAST(N'1986-11-05' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (9, 3, N'hoanglan', N'Welcome@2025', N'Nữ', N'Hoàng Lan Quản', N'0902000004', CAST(N'1988-09-25' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (10, 3, N'dinhvanly', N'Welcome@2025', N'Nam', N'Đinh Văn Lý', N'0902000005', CAST(N'1984-01-30' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (11, 1, N'nguyenhoangthanh', N'123456', N'Nam', N'Nguyễn Hoàng Thành', N'0903000001', CAST(N'2005-05-22' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (12, 1, N'levanquan', N'Welcome@2025', N'Nam', N'Lê Văn Quân', N'0903000002', CAST(N'1990-07-19' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (13, 1, N'phamhonganh', N'Welcome@2025', N'Nữ', N'Phạm Hồng Ánh', N'0903000003', CAST(N'1993-02-28' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (14, 1, N'tranquocbao', N'Welcome@2025', N'Nam', N'Trần Quốc Bảo', N'0903000004', CAST(N'1989-12-10' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (15, 1, N'hoangmaithu', N'Welcome@2025', N'Nữ', N'Hoàng Mai Thư', N'0903000005', CAST(N'1991-06-06' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (16, 1, N'dovanphuc', N'Welcome@2025', N'Nam', N'Đỗ Văn Phúc', N'0903000006', CAST(N'1994-09-09' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (17, 1, N'buithikim', N'Welcome@2025', N'Nữ', N'Bùi Thị Kim', N'0903000007', CAST(N'1995-03-03' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (18, 1, N'nguyenhuuthanh', N'Welcome@2025', N'Nam', N'Nguyễn Hữu Thành', N'0903000008', CAST(N'1996-07-07' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (19, 1, N'tathithao', N'Welcome@2025', N'Nữ', N'Tạ Thị Thảo', N'0903000009', CAST(N'1997-10-10' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (20, 2, N'nguyenvanphong', N'Welcome@2025', N'Nam', N'Nguyễn Văn Phong', N'0904000001', CAST(N'1993-01-01' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (21, 2, N'lethithanh', N'Welcome@2025', N'Nữ', N'Lê Thị Thanh', N'0904000002', CAST(N'1994-02-02' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (22, 2, N'phamvankhanh', N'Welcome@2025', N'Nam', N'Phạm Văn Khánh', N'0904000003', CAST(N'1995-03-03' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (23, 2, N'tranthibich', N'Welcome@2025', N'Nữ', N'Trần Thị Bích', N'0904000004', CAST(N'1996-04-04' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (24, 2, N'hoangvanhieu', N'Welcome@2025', N'Nam', N'Hoàng Văn Hiếu', N'0904000005', CAST(N'1997-05-05' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (25, 2, N'dinhthihang', N'Welcome@2025', N'Nữ', N'Đinh Thị Hằng', N'0904000006', CAST(N'1998-06-06' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (26, 2, N'ngovanminh', N'Welcome@2025', N'Nam', N'Ngô Văn Minh', N'0904000007', CAST(N'1999-07-07' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (27, 2, N'buithithao', N'Welcome@2025', N'Nữ', N'Bùi Thị Thảo', N'0904000008', CAST(N'2000-08-08' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (28, 2, N'dovananh', N'Welcome@2025', N'Nam', N'Đỗ Văn Anh', N'0904000009', CAST(N'2001-09-09' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (29, 2, N'tathilan', N'Welcome@2025', N'Nữ', N'Tạ Thị Lan', N'0904000010', CAST(N'2002-10-10' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (39, 1, N'phamthuyhang', N'Welcome@2025', N'Nữ', N'Phạm Thùy Hằng', N'0903500010', CAST(N'1992-04-14' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (40, 1, N'tranminhduc', N'Welcome@2025', N'Nam', N'Trần Minh Đức', N'0903500011', CAST(N'1990-07-19' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (41, 1, N'lengochan', N'Welcome@2025', N'Nữ', N'Lê Ngọc Hân', N'0903500012', CAST(N'1993-02-28' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (42, 1, N'nguyenvanhoang', N'Welcome@2025', N'Nam', N'Nguyễn Văn Hoàng', N'0903500013', CAST(N'1989-12-10' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (43, 1, N'dothithuytien', N'Welcome@2025', N'Nữ', N'Đỗ Thị Thúy Tiên', N'0903500014', CAST(N'1991-06-06' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (44, 1, N'vuonganhkhoa', N'Welcome@2025', N'Nam', N'Vương Anh Khoa', N'0903500015', CAST(N'1994-09-09' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (45, 1, N'phamthikimnga', N'Welcome@2025', N'Nữ', N'Phạm Thị Kim Nga', N'0903500016', CAST(N'1995-03-03' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (46, 1, N'truonganhthanh', N'Welcome@2025', N'Nam', N'Trương Anh Thành', N'0903500017', CAST(N'1996-07-07' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (47, 1, N'ngothithuynga', N'Welcome@2025', N'Nữ', N'Ngô Thị Thùy Nga', N'0903500018', CAST(N'1997-10-10' AS Date), 1)
GO
INSERT [dbo].[NhanVien] ([MaNV], [MaChucVu], [TenDangNhap], [MatKhau], [GioiTinh], [TenNV], [SDT], [NgaySinh], [TrangThaiTaiKhoan]) VALUES (52, 1, N'TQBINH', N'12345678', N'Nam', N'HLVTQBINH', N'0918223332', CAST(N'2000-02-15' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (11, 6)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (11, 7)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (12, 7)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (13, 8)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (14, 9)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (15, 10)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (16, 11)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (17, 12)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (18, 13)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (19, 14)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (20, 6)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (21, 7)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (22, 8)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (23, 9)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (24, 10)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (25, 11)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (26, 12)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (27, 13)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (28, 14)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (29, 6)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (39, 7)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (40, 8)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (41, 9)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (42, 10)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (43, 11)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (44, 12)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (45, 13)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (46, 14)
GO
INSERT [dbo].[NhanVienChuyenMon] ([MaNV], [MaCM]) VALUES (47, 6)
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (1, N'Rule 1 Protein 5Lbs (Hương Chocolate)', 1, CAST(1850000.00 AS Decimal(12, 2)), 0, CAST(1750000.00 AS Decimal(12, 2)), N'Rule 1', N'USA', NULL, N'Rule 1 Protein là dòng Whey Protein cao cấp với 100% Whey Isolate và Hydrolysate. Sản phẩm cung cấp 25g protein mỗi lần dùng, hỗ trợ phục hồi và phát triển cơ bắp nhanh chóng sau khi tập luyện.', N'Nguồn protein: 100% Whey Isolate & Hydrolysate|Protein: 25g mỗi lần dùng|BCAA: 6g|Glutamine: 4g|Hương vị: Chocolate Fudge|Trọng lượng: 5Lbs (2.27kg)', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (2, N'Optimum Nutrition Gold Standard Whey 5Lbs (Vanilla)', 1, CAST(1900000.00 AS Decimal(12, 2)), 0, NULL, N'Optimum Nutrition', N'USA', NULL, N'Whey Protein bán chạy nhất thế giới. Gold Standard 100% Whey cung cấp 24g protein chất lượng cao, chủ yếu từ Whey Protein Isolate, giúp xây dựng cơ bắp hiệu quả.', N'Nguồn protein: Whey Protein Isolate (chính)|Protein: 24g mỗi lần dùng|BCAA: 5.5g|Glutamine: 4g|Hương vị: Vanilla Ice Cream|Trọng lượng: 5Lbs (2.27kg)', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (3, N'Serious Mass 12Lbs (Hương Chuối)', 1, CAST(1600000.00 AS Decimal(12, 2)), 30, NULL, N'Optimum Nutrition', N'USA', NULL, N'Sữa tăng cân Serious Mass được thiết kế cho người gầy, khó tăng cân. Mỗi lần dùng cung cấp 1250 calo, 50g protein và hơn 250g carbohydrate, cùng với Creatine và Glutamine.', N'Loại: Sữa tăng cân (Mass Gainer)|Calo: 1250 kcal mỗi lần dùng|Protein: 50g|Carbohydrate: 253g|Bổ sung: Creatine, Glutamine, 25 Vitamin & Khoáng chất|Trọng lượng: 12Lbs (5.44kg)', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (4, N'BCAA Xtend 30 Servings (Hương Dưa Hấu)', 1, CAST(650000.00 AS Decimal(12, 2)), 94, CAST(620000.00 AS Decimal(12, 2)), N'Scivation', N'USA', NULL, N'Xtend BCAA là sản phẩm phục hồi cơ bắp trong tập, cung cấp 7g BCAA theo tỷ lệ 2:1:1. Giúp giảm mệt mỏi, tăng sức bền và điện giải, không chứa đường và calo.', N'Loại: BCAA (Phục hồi trong tập)|BCAA: 7g (tỷ lệ 2:1:1)|Chất điện giải: Có|Đường: 0g|Calo: 0|Số lần dùng: 30', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (5, N'The Curse Pre-Workout 50 Servings (Fruit Punch)', 1, CAST(700000.00 AS Decimal(12, 2)), 99, NULL, N'JNX Sports', N'USA', NULL, N'Pre-workout The Curse! giúp tăng cường năng lượng, sức mạnh và sự tập trung tối đa trước buổi tập. Công thức mạnh mẽ giúp bạn bùng nổ trong phòng gym.', N'Loại: Pre-workout (Tăng sức mạnh)|Công dụng: Tăng năng lượng, tập trung, sức bền|Thành phần chính: Beta-Alanine, Creatine, Caffeine|Số lần dùng: 50', 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (6, N'Rule 1 Creatine 75 Servings (Không Mùi)', 1, CAST(450000.00 AS Decimal(12, 2)), 73, NULL, N'Rule 1', N'USA', NULL, N'Cung cấp 100% Creatine Monohydrate tinh khiết dạng bột mịn (micronized) dễ dàng hấp thụ. Giúp tăng sức mạnh, sức bền và khối lượng cơ bắp.', N'Loại: Creatine Monohydrate|Độ tinh khiết: 100% Micronized|Công dụng: Tăng sức mạnh, hiệu suất tập|Số lần dùng: 75', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (7, N'Applied Nutrition ISO-XP 2kg (Cafe Latte)', 1, CAST(1700000.00 AS Decimal(12, 2)), 35, CAST(1650000.00 AS Decimal(12, 2)), N'Applied Nutrition', N'Anh Quốc', NULL, N'Dòng Whey Isolate cao cấp từ Anh Quốc, siêu tinh khiết, không chứa đường, carb, fat và lactose. Cung cấp 22.5g protein mỗi muỗng 25g.', N'Nguồn protein: 100% Whey Isolate|Protein: 22.5g|Carb: 0g|Đường: 0g|Fat: 0g|Trọng lượng: 2kg', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (8, N'Mutant Mass 15Lbs (Triple Chocolate)', 1, CAST(1950000.00 AS Decimal(12, 2)), 25, NULL, N'Mutant', N'Canada', NULL, N'Sữa tăng cân Mutant Mass là một lựa chọn hàng đầu cho việc tăng cân nạc. Cung cấp 1100 calo, 56g protein từ nhiều nguồn và 192g carb phức hợp.', N'Loại: Sữa tăng cân (Mass Gainer)|Calo: 1100 kcal|Protein: 56g (Đa nguồn)|Carbohydrate: 192g|Trọng lượng: 15Lbs (6.8kg)', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (9, N'Nutrabolics EAA 30 Servings (Peach Mango)', 1, CAST(750000.00 AS Decimal(12, 2)), 45, NULL, N'Nutrabolics', N'Canada', NULL, N'Cung cấp 9 axit amin thiết yếu (EAA) mà cơ thể không tự tổng hợp được. Hỗ trợ tổng hợp protein, phục hồi cơ bắp và chống dị hóa cơ.', N'Loại: EAA (9 Axit amin thiết yếu)|Công dụng: Phục hồi, chống dị hóa cơ|Số lần dùng: 30', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (10, N'Rule 1 Casein 4Lbs (Chocolate Creme)', 1, CAST(1600000.00 AS Decimal(12, 2)), 0, NULL, N'Rule 1', N'USA', NULL, N'Casein protein là dòng protein hấp thụ chậm, lý tưởng để sử dụng trước khi ngủ. Cung cấp 25g protein trải dài, nuôi cơ suốt 7-8 tiếng.', N'Loại: Micellar Casein (Hấp thụ chậm)|Protein: 25g|Công dụng: Nuôi cơ ban đêm, chống đói|Trọng lượng: 4Lbs', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (11, N'Now Foods Omega-3 200 Softgels', 1, CAST(550000.00 AS Decimal(12, 2)), 55, NULL, N'Now Foods', N'USA', NULL, N'Dầu cá Omega-3 tinh khiết, hỗ trợ sức khỏe tim mạch, não bộ và mắt. Mỗi viên cung cấp 180 EPA và 120 DHA.', N'Loại: Dầu cá (Fish Oil)|Thành phần: 1000mg Dầu cá|EPA: 180mg|DHA: 120mg|Số lượng: 200 viên mềm', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (12, N'Applied Nutrition ABE Pre-Workout (Energy Flavour)', 1, CAST(720000.00 AS Decimal(12, 2)), 49, CAST(700000.00 AS Decimal(12, 2)), N'Applied Nutrition', N'Anh Quốc', NULL, N'ABE (All Black Everything) là một trong những pre-workout mạnh nhất thị trường. Công thức kết hợp Citrulline Malate, Creatine, Beta-Alanine và Caffeine cho sức mạnh bùng nổ.', N'Loại: Pre-workout (Tăng sức mạnh)|Citrulline Malate: 4g|Creatine: 3.25g|Beta-Alanine: 2g|Caffeine: 200mg|Số lần dùng: 30', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (13, N'Thanh Protein Bar (Hộp 12 thanh)', 1, CAST(720000.00 AS Decimal(12, 2)), 40, NULL, N'Optimum Nutrition', N'USA', NULL, N'Bữa ăn phụ tiện lợi, cung cấp 20g protein chất lượng cao, giàu chất xơ và ít đường. Lý tưởng để mang theo khi đi làm, đi tập.', N'Loại: Bữa ăn phụ (Protein Bar)|Protein: 20g mỗi thanh|Đường: < 2g|Số lượng: Hộp 12 thanh', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (14, N'Hydrolyzed Collagen Type 1 & 3 198g', 1, CAST(600000.00 AS Decimal(12, 2)), 30, NULL, N'Applied Nutrition', N'Anh Quốc', NULL, N'Collagen thủy phân tinh khiết, hỗ trợ sức khỏe da, tóc, móng và khớp. Dạng bột không mùi vị, dễ dàng pha chung với các loại nước uống khác.', N'Loại: Collagen Thủy Phân (Type 1 & 3)|Công dụng: Đẹp da, khỏe khớp|Dạng: Bột không mùi|Số lần dùng: 30', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (15, N'Vitamin D3 5000 IU 120 viên', 1, CAST(350000.00 AS Decimal(12, 2)), 51, NULL, N'Now Foods', N'USA', NULL, N'Vitamin D3 hàm lượng cao, hỗ trợ hấp thụ canxi, tăng cường hệ miễn dịch và sức khỏe xương khớp.', N'Loại: Vitamin|Hàm lượng: 5000 IU|Công dụng: Hỗ trợ xương, miễn dịch|Số lượng: 120 viên', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (16, N'Áo Thun Tập Gym Nam Dry-Fit (Đen)', 2, CAST(250000.00 AS Decimal(12, 2)), 100, CAST(199000.00 AS Decimal(12, 2)), N'GymShark', N'Việt Nam', NULL, N'Áo thun nam chuyên dụng cho gym, chất liệu vải polyester pha spandex siêu nhẹ, co giãn 4 chiều và thấm hút mồ hôi cực tốt. Giúp bạn luôn khô thoáng và thoải mái.', N'Chất liệu: 90% Polyester, 10% Spandex|Công nghệ: Dry-Fit (Thấm hút nhanh)|Form: Slim Fit|Màu: Đen|Size: S, M, L, XL', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (17, N'Quần Đùi Tập Gym Nam 2 Lớp (Xám)', 2, CAST(320000.00 AS Decimal(12, 2)), 80, NULL, N'Aolikes', N'Trung Quốc', NULL, N'Quần đùi 2 lớp với lớp thun bên trong bó sát cơ, giúp hỗ trợ vận động và giảm ma sát. Lớp ngoài chất liệu gió mỏng nhẹ, có túi khóa kéo tiện lợi.', N'Thiết kế: 2 lớp (lớp trong D-legging, lớp ngoài-short)|Tiện ích: Túi zip, chỗ dắt khăn|Màu: Xám|Size: M, L, XL', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (18, N'Áo Ba Lỗ (Tank Top) Nam Cotton (Trắng)', 2, CAST(180000.00 AS Decimal(12, 2)), 119, NULL, N'LocalBrand VN', N'Việt Nam', NULL, N'Áo tank top nam với chất liệu 100% cotton thoáng mát, form áo rộng rãi (regular fit) phù hợp cho các bài tập nặng, cần sự thoải mái tối đa.', N'Chất liệu: 100% Cotton 2 chiều|Form: Regular Fit|Đặc điểm: Cổ tròn, khoét nách rộng|Màu: Trắng|Size: L, XL, XXL', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (19, N'Quần Legging Nữ Cạp Cao Nâng Mông (Đen)', 2, CAST(380000.00 AS Decimal(12, 2)), 100, CAST(350000.00 AS Decimal(12, 2)), N'Lululemon', N'Trung Quốc', NULL, N'Quần legging cạp cao với thiết kế đường may chìm giúp nâng mông và gen bụng hiệu quả. Chất liệu thun lạnh co giãn 4 chiều, không lộ, không bai dão.', N'Chất liệu: 80% Nylon, 20% Spandex|Thiết kế: Cạp cao 12cm|Đặc điểm: Vải dệt kim (seamless), không đường may|Công dụng: Tập gym, yoga, cardio|Size: S, M, L', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (20, N'Áo Bra Tập Luyện Nữ Hỗ Trợ Cao (Hồng)', 2, CAST(290000.00 AS Decimal(12, 2)), 87, NULL, N'Nike', N'Việt Nam', NULL, N'Áo bra thể thao (sport bra) thiết kế hỗ trợ vận động mạnh (high support), phù hợp cho các bài tập nhảy, chạy bộ. Có mút đệm tháo rời.', N'Loại hỗ trợ: High Support (Hỗ trợ cao)|Chất liệu: Polyester, Spandex|Đặc điểm: Đệm mút tháo rời, dây áo to bản|Màu: Hồng Pastel|Size: S, M, L', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (21, N'Quần Jogger Nam Vải Nỉ (Xám Đậm)', 2, CAST(400000.00 AS Decimal(12, 2)), 60, NULL, N'Adidas', N'Campuchia', NULL, N'Quần jogger nam chất nỉ da cá, giữ ấm tốt, phù hợp để mặc khởi động hoặc tập vào mùa lạnh. Form quần ống bó, tôn dáng năng động.', N'Chất liệu: Nỉ da cá (Cotton pha Polyester)|Form: Jogger (ống bó)|Đặc điểm: Cạp chun, dây rút, 2 túi khóa kéo|Màu: Xám Đậm|Size: M, L, XL', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (22, N'Áo Croptop Nữ Tay Dài (Trắng)', 2, CAST(260000.00 AS Decimal(12, 2)), 70, NULL, N'LocalBrand VN', N'Việt Nam', NULL, N'Áo croptop tay dài chất thun gân, ôm sát cơ thể, khoe eo thon. Phù hợp để mặc tập hoặc phối đồ thời trang thể thao.', N'Chất liệu: Thun gân (Cotton Spandex)|Kiểu dáng: Croptop, tay dài|Màu: Trắng|Size: S, M', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (23, N'Quần Short Nữ 2 Lớp (Xanh Mint)', 2, CAST(280000.00 AS Decimal(12, 2)), 80, NULL, N'GymShark', N'Trung Quốc', NULL, N'Quần short 2 lớp cạp cao cho nữ, lớp trong thun lạnh co giãn, lớp ngoài vải dù mỏng nhẹ, thoáng khí. Thiết kế trẻ trung, năng động.', N'Thiết kế: 2 lớp, cạp cao|Chất liệu: Vải dù và thun lạnh|Màu: Xanh Mint|Size: S, M, L', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (24, N'Áo Khoác Gió Tập Luyện (Đen Phối Neon)', 2, CAST(450000.00 AS Decimal(12, 2)), 49, CAST(420000.00 AS Decimal(12, 2)), N'Under Armour', N'Việt Nam', NULL, N'Áo khoác gió 1 lớp siêu mỏng nhẹ, cản gió và chống nước nhẹ. Phù hợp để chạy bộ ngoài trời hoặc giữ ấm cơ thể trước khi tập.', N'Chất liệu: Vải gió 100% Polyester|Đặc điểm: Siêu nhẹ, có mũ, bo gấu|Màu: Đen phối Xanh Neon|Size: M, L, XL', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (25, N'Tất (Vớ) Cổ Cao Thể Thao (Combo 3 Đôi)', 2, CAST(150000.00 AS Decimal(12, 2)), 0, NULL, N'Nike', N'Trung Quốc', NULL, N'Combo 3 đôi tất cổ cao, chất liệu cotton dày dặn, thấm hút mồ hôi và hỗ trợ vòm chân, giảm sốc khi vận động.', N'Chất liệu: Cotton, Spandex, Polyester|Đặc điểm: Cổ cao, đệm dày lòng bàn chân|Số lượng: 3 đôi/combo|Màu: Trắng, Đen, Xám', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (26, N'Áo Hoodie Nỉ Bông (Be)', 2, CAST(550000.00 AS Decimal(12, 2)), 40, NULL, N'Champion', N'Việt Nam', NULL, N'Áo hoodie chất nỉ bông dày dặn, giữ ấm cực tốt. Form oversize (form rộng) thời trang, phù hợp mặc sau khi tập hoặc thời trang dạo phố.', N'Chất liệu: Nỉ bông 100% Cotton|Form: Oversize|Đặc điểm: Có mũ, túi kangaroo|Màu: Be (Kem)|Size: M, L', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (27, N'Quần Legging Nam Bó Cơ (Đen Sọc)', 2, CAST(300000.00 AS Decimal(12, 2)), 60, NULL, N'Aolikes', N'Trung Quốc', NULL, N'Quần legging nam (quần bó cơ) hỗ trợ tuần hoàn máu, giữ ấm cơ và giảm chấn thương khi tập luyện. Thường mặc bên trong quần short.', N'Chất liệu: Thun lạnh (Polyester, Spandex)|Công dụng: Hỗ trợ cơ bắp (compression)|Màu: Đen sọc xám|Size: M, L, XL', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (28, N'Áo Thun Tập Gym Nữ Lưới (Hồng Phấn)', 2, CAST(230000.00 AS Decimal(12, 2)), 70, NULL, N'LocalBrand VN', N'Việt Nam', NULL, N'Áo thun nữ form rộng, chất liệu thun cotton mềm mại, phối lưới sau lưng tạo sự thoáng khí và thời trang.', N'Chất liệu: Cotton 4 chiều|Thiết kế: Phối lưới thoáng khí sau lưng|Form: Regular Fit|Màu: Hồng Phấn|Size: S, M, L', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (29, N'Mũ Lưỡi Trai Thể Thao (Đen)', 2, CAST(180000.00 AS Decimal(12, 2)), 90, NULL, N'Puma', N'Việt Nam', NULL, N'Mũ lưỡi trai chất liệu vải dù mỏng nhẹ, thoáng khí, chuyên dụng cho các hoạt động thể thao, đặc biệt là chạy bộ hoặc tập ngoài trời.', N'Chất liệu: Vải dù (Polyester)|Đặc điểm: Siêu nhẹ, có lỗ thoáng khí|Khóa: Khóa dán (Velcro)|Màu: Đen', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (30, N'Áo Polo Thể Thao Nam (Xanh Navy)', 2, CAST(350000.00 AS Decimal(12, 2)), 50, NULL, N'Uniqlo', N'Việt Nam', NULL, N'Áo polo thể thao với chất liệu vải cá sấu co giãn, thấm hút tốt. Kiểu dáng lịch sự, có thể mặc đi tập hoặc đi chơi.', N'Chất liệu: Vải cá sấu (Polyester, Cotton)|Công nghệ: Dry-Ex|Kiểu dáng: Áo có cổ (Polo)|Màu: Xanh Navy|Size: M, L, XL', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (31, N'Bình Lắc Shaker 3 Ngăn 700ml (Đen)', 3, CAST(120000.00 AS Decimal(12, 2)), 200, CAST(99000.00 AS Decimal(12, 2)), N'Generic', N'Trung Quốc', NULL, N'Bình lắc 3 ngăn tiện lợi, bao gồm 1 ngăn chính chứa nước, 1 ngăn đựng bột whey và 1 ngăn chia viên. Chất liệu nhựa PP5 an toàn, không chứa BPA.', N'Dung tích: 700ml|Thiết kế: 3 ngăn (Nước, Bột, Viên)|Chất liệu: Nhựa PP5 (BPA-Free)|Phụ kiện: Lò xo inox 304 chống gỉ|Màu: Đen', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (32, N'Găng Tay Tập Gym Có Cuốn Cổ Tay (Size L)', 3, CAST(220000.00 AS Decimal(12, 2)), 150, NULL, N'Aolikes', N'Trung Quốc', N'3 Tháng', N'Găng tay tập gym chuyên nghiệp với lớp đệm mút dày ở lòng bàn tay, giúp giảm chai tay và tăng độ bám. Tích hợp dây cuốn cổ tay dài 40cm, bảo vệ khớp cổ tay khi nâng tạ nặng.', N'Chất liệu: Vải lưới, Da lộn, Đệm mút|Dây cuốn cổ tay: Có (dài 40cm)|Đặc điểm: Hở ngón, thoáng khí|Size: L|Màu: Đen Đỏ', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (33, N'Đai Lưng Mềm Tập Gym (Size M)', 3, CAST(300000.00 AS Decimal(12, 2)), 80, NULL, N'Valeo', N'Trung Quốc', N'6 Tháng', N'Đai lưng mềm (đai vải) bản to 12cm, hỗ trợ bảo vệ cột sống, gồng bụng tốt hơn trong các bài tập Squat, Deadlift. Lõi xốp nén, khóa dán tiện lợi.', N'Loại: Đai mềm (Vải dù + Xốp nén)|Bản rộng: 12cm (phần lưng)|Khóa: Khóa dán (Velcro)|Công dụng: Hỗ trợ cột sống|Size: M (vòng eo 70-85cm)', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (34, N'Dây Kéo Lưng (Lifting Straps) (Cặp)', 3, CAST(150000.00 AS Decimal(12, 2)), 130, NULL, N'Aolikes', N'Trung Quốc', N'1 Tháng', N'Dây kéo lưng giúp tăng cường sức nắm, giảm tải cho cẳng tay, cho phép bạn tập trung vào cơ lưng trong các bài kéo (Deadlift, Rows) với mức tạ nặng hơn.', N'Chất liệu: Cotton pha dù|Thiết kế: Dây quấn có đệm cổ tay|Đặc điểm: Chống trượt, chịu lực cao|Số lượng: 1 cặp', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (35, N'Túi Xách Thể Thao Chống Nước (50L)', 3, CAST(550000.00 AS Decimal(12, 2)), 59, CAST(499000.00 AS Decimal(12, 2)), N'Adidas', N'Việt Nam', N'12 Tháng', N'Túi xách (túi trống) dung tích lớn 50L, chất liệu vải polyester chống nước. Có ngăn đựng giày và ngăn đồ ướt riêng biệt, rất tiện lợi cho gymer.', N'Dung tích: 50 Lít|Chất liệu: Polyester chống nước|Ngăn: Ngăn giày riêng, ngăn đồ ướt|Dây đeo: Có thể tháo rời|Màu: Đen', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (36, N'Băng Bảo Vệ Khớp Gối (Cặp)', 3, CAST(280000.00 AS Decimal(12, 2)), 97, NULL, N'Aolikes', N'Trung Quốc', N'3 Tháng', N'Băng bảo vệ gối co giãn 4 chiều, giúp cố định và giữ ấm khớp gối, giảm chấn thương khi gánh tạ (Squat) hoặc các bài tập chân.', N'Chất liệu: Spandex, Nylon, Cotton|Thiết kế: Dạng ống co giãn|Công dụng: Cố định, giữ ấm khớp gối|Số lượng: 1 cặp|Size: M, L', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (37, N'Dây Quấn Cổ Tay (Wrist Wraps) (Cặp)', 3, CAST(180000.00 AS Decimal(12, 2)), 110, NULL, N'Harbinger', N'Trung Quốc', N'3 Tháng', N'Dây quấn cổ tay chuyên dụng cho các bài tập đẩy (Bench Press, OHP), giúp cố định khớp cổ tay, tránh trật khớp, bong gân khi đẩy tạ nặng.', N'Chất liệu: Thun co giãn + Cotton|Chiều dài: 45cm|Bản rộng: 8cm|Khóa: Khóa dán + Xỏ ngón cái|Số lượng: 1 cặp', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (38, N'Đai Lưng Cứng Powerlifting (Da Thật)', 3, CAST(1200000.00 AS Decimal(12, 2)), 20, NULL, N'Generic', N'Việt Nam', N'24 Tháng', N'Đai lưng cứng chuyên dụng cho Powerlifting, làm từ da thật 100%, dày 10mm. Cực kỳ chắc chắn, hỗ trợ tối đa cho các bài nâng tạ kỷ lục.', N'Loại: Đai cứng (Powerlifting)|Chất liệu: Da bò thật 100%|Độ dày: 10mm|Khóa: Khóa gài inox không gỉ|Size: M, L', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (39, N'Bình Nước Thể Thao 1.5 Lít', 3, CAST(160000.00 AS Decimal(12, 2)), 150, NULL, N'Generic', N'Trung Quốc', NULL, N'Bình nước dung tích lớn 1.5 lít, đủ nước cho cả buổi tập dài. Chất liệu nhựa PETG số 1, an toàn, không chứa BPA. Có quai xách và vạch chia ml.', N'Dung tích: 1.5 Lít|Chất liệu: Nhựa PETG (BPA-Free)|Thiết kế: Nắp vặn, quai xách|Lưu ý: Không đựng nước nóng', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (40, N'Băng Bảo Vệ Khuỷu Tay (Cặp)', 3, CAST(190000.00 AS Decimal(12, 2)), 89, NULL, N'Aolikes', N'Trung Quốc', N'1 Tháng', N'Băng bảo vệ khớp khuỷu tay (cùi chỏ), chất liệu thun co giãn, giúp giữ ấm và cố định khớp khi thực hiện các bài đẩy nặng.', N'Chất liệu: Spandex, Nylon|Thiết kế: Dạng ống co giãn|Công dụng: Bảo vệ khớp khuỷu tay|Số lượng: 1 cặp|Size: M, L', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (41, N'Khăn Lạnh Tập Gym (Cooling Towel)', 3, CAST(90000.00 AS Decimal(12, 2)), 129, NULL, N'Generic', N'Trung Quốc', NULL, N'Khăn công nghệ làm lạnh tức thì. Chỉ cần nhúng nước, vắt khô và giũ mạnh, khăn sẽ lạnh sâu, giúp giải nhiệt nhanh chóng trong lúc tập.', N'Chất liệu: Vải sợi công nghệ cao|Kích thước: 30cm x 90cm|Công dụng: Làm mát, hạ nhiệt|Đặc điểm: Tái sử dụng nhiều lần', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (42, N'Găng Tay Nữ (Không Cuốn Cổ Tay)', 3, CAST(170000.00 AS Decimal(12, 2)), 80, NULL, N'Aolikes', N'Trung Quốc', N'3 Tháng', N'Găng tay tập gym cho nữ, thiết kế mỏng nhẹ, thời trang. Lớp đệm silicon lòng bàn tay giúp chống chai tay mà vẫn giữ cảm giác cầm tạ tốt.', N'Chất liệu: Vải lưới, đệm Silicon|Thiết kế: Hở ngón, không cuốn cổ tay|Màu: Hồng, Đen|Size: S, M', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (43, N'Thảm Tập Yoga TPE 6mm (Hai Lớp)', 4, CAST(350000.00 AS Decimal(12, 2)), 100, CAST(320000.00 AS Decimal(12, 2)), N'Generic', N'Đài Loan', N'6 Tháng', N'Thảm tập Yoga làm từ chất liệu TPE (cao su non) an toàn, đàn hồi cao và chống trơn trượt tuyệt đối. Thiết kế 2 lớp 2 màu, độ dày 6mm êm ái, phù hợp cho Yoga và các bài tập tại nhà.', N'Chất liệu: TPE (Không PVC, không độc hại)|Độ dày: 6mm|Kích thước: 183cm x 61cm|Đặc điểm: Chống trơn 2 mặt, có vạch định tuyến|Phụ kiện: Tặng kèm túi đựng và dây buộc', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (44, N'Con Lăn Giãn Cơ (Foam Roller) Gai 33cm', 4, CAST(280000.00 AS Decimal(12, 2)), 70, NULL, N'Generic', N'Trung Quốc', N'3 Tháng', N'Con lăn giãn cơ (foam roller) với bề mặt gai 3D, mô phỏng động tác massage của chuyên gia. Giúp phá vỡ các điểm căng cơ (trigger points), phục hồi cơ bắp, giảm đau mỏi sau tập.', N'Chất liệu: Lõi PVC, bọc mút EVA|Thiết kế: Bề mặt gai 3D|Kích thước: Dài 33cm, đường kính 14cm|Công dụng: Tự massage, giãn cơ, phục hồi', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (45, N'Dây Nhảy Tốc Độ Lõi Thép', 4, CAST(190000.00 AS Decimal(12, 2)), 120, NULL, N'Aolikes', N'Trung Quốc', N'3 Tháng', N'Dây nhảy tốc độ (speed rope) chuyên dụng cho Cardio, Crossfit. Lõi cáp thép bọc nhựa, tay cầm nhôm có vòng bi, giúp dây quay cực nhanh và mượt.', N'Loại: Dây nhảy tốc độ|Chất liệu: Lõi thép bọc nhựa, tay cầm nhôm|Vòng bi: Có (tăng tốc độ)|Chiều dài dây: 3m (có thể điều chỉnh)', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (46, N'Bộ Dây Kháng Lực (Resistance Band) 5 Mức', 4, CAST(400000.00 AS Decimal(12, 2)), 86, CAST(350000.00 AS Decimal(12, 2)), N'Generic', N'Trung Quốc', N'6 Tháng', N'Bộ 5 dây kháng lực (dây ngũ sắc) với các mức lực khác nhau, từ 10Lbs đến 50Lbs. Có thể kết hợp tập tại nhà hoặc tại phòng gym, đi kèm tay cầm, neo cửa và quai cổ chân.', N'Chất liệu: Cao su TPE|Số lượng: 5 dây (Vàng, Đỏ, Xanh L, Xanh Đ, Đen)|Mức lực: 10Lbs - 50Lbs (Tổng 150Lbs)|Phụ kiện: 2 tay cầm, 2 quai cổ chân, 1 neo cửa, 1 túi đựng', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (47, N'Dây Kháng Lực (Power Band) - Mức Vàng (15-35Lbs)', 4, CAST(180000.00 AS Decimal(12, 2)), 79, NULL, N'Generic', N'Trung Quốc', N'3 Tháng', N'Dây power band dạng vòng, chất liệu cao su tự nhiên, siêu bền. Dây vàng (mức 2) phù hợp để khởi động, tập các nhóm cơ nhỏ hoặc hỗ trợ tập hít xà (pull-up).', N'Loại: Power Band (dạng vòng)|Chất liệu: Cao su tự nhiên|Mức lực: Vàng (15-35 Lbs / 7-16 kg)|Chu vi: 208cm|Bản rộng: 1.3cm', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (48, N'Bóng Tập Yoga (Gym Ball) 65cm (Kèm Bơm)', 4, CAST(300000.00 AS Decimal(12, 2)), 60, NULL, N'Generic', N'Trung Quốc', N'3 Tháng', N'Bóng tập yoga (gym ball) chất liệu PVC chống nổ, dày dặn. Hỗ trợ các bài tập thăng bằng, tập bụng (core) và giãn cơ.', N'Chất liệu: PVC chống nổ|Đường kính: 65cm (phù hợp chiều cao 1m55 - 1m70)|Tải trọng: Tối đa 150kg|Phụ kiện: Kèm bơm tay', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (49, N'Con Lăn Tập Bụng (AB Roller) 1 Bánh', 4, CAST(250000.00 AS Decimal(12, 2)), 70, NULL, N'Aolikes', N'Trung Quốc', N'6 Tháng', N'Dụng cụ tập cơ bụng 6 múi hiệu quả. Bánh xe bọc cao su, chạy êm ái, tay cầm bọc mút chống trơn. Tặng kèm thảm lót gối.', N'Thiết kế: 1 bánh xe to|Chất liệu: Lõi thép, bánh xe PVC bọc cao su|Tay cầm: Bọc mút|Phụ kiện: Tặng thảm lót gối', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (50, N'Gạch Tập Yoga (Yoga Block) (Cặp)', 4, CAST(150000.00 AS Decimal(12, 2)), 90, NULL, N'Generic', N'Đài Loan', NULL, N'Gạch tập yoga làm từ mút EVA cứng, mật độ cao, không xẹp. Hỗ trợ thực hiện các tư thế yoga khó, giúp giữ thăng bằng và vào tư thế đúng hơn.', N'Chất liệu: Mút EVA cứng|Kích thước: 23cm x 15cm x 7.6cm|Đặc điểm: Bo tròn 4 góc, chống trơn|Số lượng: 1 cặp (2 viên)', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (51, N'Áo Thun Nam Nike Pro Dri-FIT (Đen)', 2, CAST(850000.00 AS Decimal(12, 2)), 100, NULL, N'Nike', N'Việt Nam', NULL, N'Áo thun Nike Pro với công nghệ Dri-FIT giúp thấm hút mồ hôi, giữ cho bạn luôn khô ráo và thoải mái trong suốt buổi tập. Chất vải nhẹ, co giãn.', N'Công nghệ: Dri-FIT|Chất liệu: 92% Polyester, 8% Spandex|Form: Standard Fit|Đặc điểm: Vải lưới thoáng khí ở lưng|Màu: Đen', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (54, N'Quần Đùi Nam Nike Dri-FIT (Xám)', 2, CAST(790000.00 AS Decimal(12, 2)), 119, NULL, N'Nike', N'Trung Quốc', NULL, N'Quần short dệt kim co giãn theo mọi chuyển động của bạn. Công nghệ Dri-FIT giúp bạn luôn khô ráo, phù hợp cho cả tập luyện và chạy bộ.', N'Công nghệ: Dri-FIT|Chất liệu: 100% Polyester|Đặc điểm: Có 2 túi bên, cạp chun co giãn|Chiều dài: 7 inch (trên gối)|Màu: Xám', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (55, N'Áo Hoodie Nam Nike Sportswear Tech Fleece (Đen)', 2, CAST(2800000.00 AS Decimal(12, 2)), 48, NULL, N'Nike', N'Việt Nam', NULL, N'Áo khoác giữ ấm cao cấp với chất liệu Tech Fleece nhẹ và êm. Thiết kế hiện đại, khóa kéo toàn thân và túi zip đặc trưng trên tay áo.', N'Chất liệu: Tech Fleece (Cotton/Polyester)|Thiết kế: Khóa kéo toàn thân, mũ trùm|Đặc điểm: Túi zip tay áo, giữ ấm tốt|Màu: Đen', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (56, N'Quần Bó Cơ Nam Nike Pro Tights (Đen)', 2, CAST(900000.00 AS Decimal(12, 2)), 80, NULL, N'Nike', N'Indonesia', NULL, N'Quần bó cơ (tights) hỗ trợ tập luyện, giữ cơ bắp ấm và giảm rung động. Chất liệu Dri-FIT co giãn 4 chiều, mặc thoải mái như lớp da thứ hai.', N'Công nghệ: Dri-FIT|Chất liệu: 90% Polyester, 10% Spandex|Đặc điểm: Cạp quần co giãn, vải lưới thoáng khí|Công dụng: Hỗ trợ cơ bắp', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (57, N'Áo Bra Nữ Nike Indy (Trắng)', 2, CAST(750000.00 AS Decimal(12, 2)), 88, CAST(699000.00 AS Decimal(12, 2)), N'Nike', N'Việt Nam', NULL, N'Áo bra hỗ trợ nhẹ (Light Support) với thiết kế dây đai mỏng, thanh lịch. Phù hợp cho các bộ môn như Yoga, Pilates. Có đệm mút tháo rời.', N'Loại hỗ trợ: Light Support|Công nghệ: Dri-FIT|Đặc điểm: Dây đai điều chỉnh được, đệm mút tháo rời|Màu: Trắng', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (58, N'Quần Legging Nữ Nike One (Đen)', 2, CAST(1100000.00 AS Decimal(12, 2)), 98, NULL, N'Nike', N'Indonesia', NULL, N'Quần legging đa năng, phù hợp cho mọi hoạt động từ tập gym đến dạo phố. Chất vải mềm, không nhìn xuyên thấu và cạp cao ôm bụng.', N'Công nghệ: Dri-FIT|Thiết kế: Cạp cao, không xuyên thấu|Chất liệu: Polyester/Spandex|Đặc điểm: Có 2 túi ẩn ở cạp quần|Màu: Đen', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (59, N'Tất Nike Everyday Plus (Combo 3 Đôi)', 3, CAST(350000.00 AS Decimal(12, 2)), 198, NULL, N'Nike', N'Trung Quốc', NULL, N'Combo 3 đôi tất cổ cao (crew socks) với đệm lót êm ái ở lòng bàn chân. Chất liệu Dri-FIT thấm hút mồ hôi, hỗ trợ vòm chân.', N'Số lượng: 3 đôi/combo|Chất liệu: Cotton/Polyester/Spandex|Đặc điểm: Cổ cao, đệm lót, công nghệ Dri-FIT|Màu: Trắng/Đen', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (60, N'Túi Xách Nike Brasilia Duffle (Size S - 41L)', 3, CAST(900000.00 AS Decimal(12, 2)), 59, NULL, N'Nike', N'Indonesia', N'6 Tháng', N'Túi trống thể thao đa năng với ngăn chính rộng rãi và ngăn đựng giày riêng biệt. Chất liệu polyester bền bỉ, chống thấm nước.', N'Dung tích: 41 Lít (Size Nhỏ)|Chất liệu: 100% Polyester|Ngăn: Ngăn giày riêng, ngăn đồ ướt|Dây đeo: Có thể tháo rời|Màu: Đen', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (61, N'Găng Tay Tập Luyện Nike (Nam - Size M)', 3, CAST(550000.00 AS Decimal(12, 2)), 67, NULL, N'Nike', N'Trung Quốc', N'3 Tháng', N'Găng tay tập gym với lớp đệm mút ở lòng bàn tay giúp bảo vệ và tăng độ bám. Chất liệu vải lưới thoáng khí trên mu bàn tay.', N'Chất liệu: Đệm mút, Vải lưới, Da tổng hợp|Đặc điểm: Thoáng khí, khóa dán cổ tay|Size: M|Màu: Đen', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (62, N'Mũ Nike Heritage86 (Trắng)', 3, CAST(450000.00 AS Decimal(12, 2)), 0, CAST(420000.00 AS Decimal(12, 2)), N'Nike', N'Việt Nam', NULL, N'Mũ lưỡi trai (nón kết) thời trang với chất liệu cotton mềm mại. Logo Nike thêu nổi, khóa gài kim loại có thể điều chỉnh.', N'Chất liệu: 100% Cotton|Thiết kế: 6 múi, logo thêu|Khóa: Khóa gài kim loại|Màu: Trắng', 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [DonGia], [SoLuongTon], [GiaKhuyenMai], [Hang], [XuatXu], [BaoHanh], [MoTaChung], [MoTaChiTiet], [TrangThai]) VALUES (65, N'san pham moi tq binh', 2, CAST(50000.00 AS Decimal(12, 2)), 19, CAST(45000.00 AS Decimal(12, 2)), N'NIke', N'VN', N'1 thang', N'aaa', N'aaa', 1)
GO
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChucVu__A7E2123E0C90A267]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[ChucVu] ADD UNIQUE NONCLUSTERED 
(
	[TenChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChucVu__A7E2123E3FA14014]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[ChucVu] ADD UNIQUE NONCLUSTERED 
(
	[TenChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChucVu__A7E2123E64E70D0B]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[ChucVu] ADD UNIQUE NONCLUSTERED 
(
	[TenChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChucVu__A7E2123E74DBD760]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[ChucVu] ADD UNIQUE NONCLUSTERED 
(
	[TenChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChucVu__A7E2123E84D7FD13]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[ChucVu] ADD UNIQUE NONCLUSTERED 
(
	[TenChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChucVu__A7E2123EA3386BCA]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[ChucVu] ADD UNIQUE NONCLUSTERED 
(
	[TenChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChucVu__A7E2123EDDD6695C]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[ChucVu] ADD UNIQUE NONCLUSTERED 
(
	[TenChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChucVu__A7E2123EF5CEC9E6]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[ChucVu] ADD UNIQUE NONCLUSTERED 
(
	[TenChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__A9D105343B28C67F]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__A9D105346FBF8886]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__A9D10534939037E2]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__A9D10534C4F2C130]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__CA1930A52F3AA119]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__CA1930A5E455304B]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__55F68FC01B4880ED]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__55F68FC0214C504F]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__55F68FC07B4EBA93]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__55F68FC0BDEABC9A]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__CA1930A510EE1533]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__CA1930A5163104D2]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__CA1930A54862294B]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NhanVien__CA1930A597DF8581]    Script Date: 10/12/2025 1:25:46 CH ******/
ALTER TABLE [dbo].[NhanVien] ADD UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CheckIn] ADD  DEFAULT (getdate()) FOR [ThoiGianVao]
GO
ALTER TABLE [dbo].[ChiTietGioHang] ADD  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[ChiTietGioHang] ADD  DEFAULT (getdate()) FOR [NgayThem]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[DangKyGoiTap] ADD  DEFAULT (getdate()) FOR [NgayDangKy]
GO
ALTER TABLE [dbo].[DangKyLop] ADD  DEFAULT (getdate()) FOR [NgayDangKy]
GO
ALTER TABLE [dbo].[DangKyLop] ADD  DEFAULT (N'Còn hiệu lực') FOR [TrangThai]
GO
ALTER TABLE [dbo].[DangKyPT] ADD  DEFAULT (getdate()) FOR [NgayDangKy]
GO
ALTER TABLE [dbo].[DangKyPT] ADD  DEFAULT (N'Còn hiệu lực') FOR [TrangThai]
GO
ALTER TABLE [dbo].[DiaChi] ADD  DEFAULT ((0)) FOR [LaDiaChiMacDinh]
GO
ALTER TABLE [dbo].[DiaChi] ADD  DEFAULT (getdate()) FOR [NgayThem]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT ((0)) FOR [PhiShip]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT (N'Chờ xác nhận') FOR [TrangThaiDonHang]
GO
ALTER TABLE [dbo].[GoiTap] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[HINHANH] ADD  DEFAULT ((0)) FOR [IsMain]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ((0)) FOR [ThanhTien]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (N'Chưa thanh toán') FOR [TrangThai]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_KhachHang_TrangThai]  DEFAULT ((1)) FOR [TrangThaiTaiKhoan]
GO
ALTER TABLE [dbo].[LichLop] ADD  DEFAULT (N'Chưa diễn ra') FOR [TrangThai]
GO
ALTER TABLE [dbo].[LichTapPT] ADD  DEFAULT (N'Chưa tập') FOR [TrangThai]
GO
ALTER TABLE [dbo].[LoaiKhachHang] ADD  DEFAULT ((0)) FOR [MucGiam]
GO
ALTER TABLE [dbo].[LopHoc] ADD  DEFAULT ((30)) FOR [SiSoToiDa]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_Nhanvien_TrangThai]  DEFAULT ((1)) FOR [TrangThaiTaiKhoan]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[YeuCauHoTro] ADD  DEFAULT (N'Mới gửi') FOR [TrangThai]
GO
ALTER TABLE [dbo].[YeuCauHoTro] ADD  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[CheckIn]  WITH CHECK ADD  CONSTRAINT [FK_CheckIn_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[CheckIn] CHECK CONSTRAINT [FK_CheckIn_KH]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_KhachHang]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPham_LoggedIn] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_GioHang_SanPham_LoggedIn]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_HD] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_CT_HD]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_HD_DKGT] FOREIGN KEY([MaDKGT])
REFERENCES [dbo].[DangKyGoiTap] ([MaDKGT])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_CT_HD_DKGT]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_HD_DKLop] FOREIGN KEY([MaDKLop])
REFERENCES [dbo].[DangKyLop] ([MaDKLop])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_CT_HD_DKLop]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_HD_DKPT] FOREIGN KEY([MaDKPT])
REFERENCES [dbo].[DangKyPT] ([MaDKPT])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_CT_HD_DKPT]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_CT_SP]
GO
ALTER TABLE [dbo].[DangKyGoiTap]  WITH CHECK ADD  CONSTRAINT [FK_DKGT_GT] FOREIGN KEY([MaGoiTap])
REFERENCES [dbo].[GoiTap] ([MaGoiTap])
GO
ALTER TABLE [dbo].[DangKyGoiTap] CHECK CONSTRAINT [FK_DKGT_GT]
GO
ALTER TABLE [dbo].[DangKyGoiTap]  WITH CHECK ADD  CONSTRAINT [FK_DKGT_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DangKyGoiTap] CHECK CONSTRAINT [FK_DKGT_KH]
GO
ALTER TABLE [dbo].[DangKyLop]  WITH CHECK ADD  CONSTRAINT [FK_DKLop_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DangKyLop] CHECK CONSTRAINT [FK_DKLop_KH]
GO
ALTER TABLE [dbo].[DangKyLop]  WITH CHECK ADD  CONSTRAINT [FK_DKLop_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LopHoc] ([MaLop])
GO
ALTER TABLE [dbo].[DangKyLop] CHECK CONSTRAINT [FK_DKLop_Lop]
GO
ALTER TABLE [dbo].[DangKyPT]  WITH CHECK ADD  CONSTRAINT [FK_DKPT_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DangKyPT] CHECK CONSTRAINT [FK_DKPT_KH]
GO
ALTER TABLE [dbo].[DangKyPT]  WITH CHECK ADD  CONSTRAINT [FK_DKPT_NV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DangKyPT] CHECK CONSTRAINT [FK_DKPT_NV]
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD  CONSTRAINT [FK_DiaChi_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DiaChi] CHECK CONSTRAINT [FK_DiaChi_KhachHang]
GO
ALTER TABLE [dbo].[HINHANH]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnh_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HINHANH] CHECK CONSTRAINT [FK_HinhAnh_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_DonHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KH]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_LoaiKH] FOREIGN KEY([MaLoaiKH])
REFERENCES [dbo].[LoaiKhachHang] ([MaLoaiKH])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_LoaiKH]
GO
ALTER TABLE [dbo].[LichLop]  WITH CHECK ADD  CONSTRAINT [FK_LichLop_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LopHoc] ([MaLop])
GO
ALTER TABLE [dbo].[LichLop] CHECK CONSTRAINT [FK_LichLop_Lop]
GO
ALTER TABLE [dbo].[LichLop]  WITH CHECK ADD  CONSTRAINT [FK_LichLop_NhanVien_MaNV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[LichLop] CHECK CONSTRAINT [FK_LichLop_NhanVien_MaNV]
GO
ALTER TABLE [dbo].[LichTapPT]  WITH CHECK ADD  CONSTRAINT [FK_LichPT_DKPT] FOREIGN KEY([MaDKPT])
REFERENCES [dbo].[DangKyPT] ([MaDKPT])
GO
ALTER TABLE [dbo].[LichTapPT] CHECK CONSTRAINT [FK_LichPT_DKPT]
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_Lop_CM] FOREIGN KEY([MaCM])
REFERENCES [dbo].[ChuyenMon] ([MaCM])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_Lop_CM]
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_NhanVien_MaNV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_NhanVien_MaNV]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[NhanVienChuyenMon]  WITH CHECK ADD  CONSTRAINT [FK_NVCM_CM] FOREIGN KEY([MaCM])
REFERENCES [dbo].[ChuyenMon] ([MaCM])
GO
ALTER TABLE [dbo].[NhanVienChuyenMon] CHECK CONSTRAINT [FK_NVCM_CM]
GO
ALTER TABLE [dbo].[NhanVienChuyenMon]  WITH CHECK ADD  CONSTRAINT [FK_NVCM_NV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NhanVienChuyenMon] CHECK CONSTRAINT [FK_NVCM_NV]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SP_LSP] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SP_LSP]
GO
ALTER TABLE [dbo].[YeuCauHoTro]  WITH CHECK ADD  CONSTRAINT [FK_YeuCau_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuCauHoTro] CHECK CONSTRAINT [FK_YeuCau_KhachHang]
GO
ALTER TABLE [dbo].[YeuCauHoTro]  WITH CHECK ADD  CONSTRAINT [FK_YeuCau_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[YeuCauHoTro] CHECK CONSTRAINT [FK_YeuCau_NhanVien]
GO
ALTER TABLE [dbo].[CheckIn]  WITH CHECK ADD  CONSTRAINT [CK_TRANGTHAI] CHECK  (([TrangThai]=N'Hết hạn' OR [TrangThai]=N'Hợp lệ'))
GO
ALTER TABLE [dbo].[CheckIn] CHECK CONSTRAINT [CK_TRANGTHAI]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [CK_CTHD_LoaiDichVu] CHECK  (((((case when [MaDKGT] IS NOT NULL then (1) else (0) end+case when [MaDKPT] IS NOT NULL then (1) else (0) end)+case when [MaDKLop] IS NOT NULL then (1) else (0) end)+case when [MaSP] IS NOT NULL then (1) else (0) end)=(1)))
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [CK_CTHD_LoaiDichVu]
GO
ALTER TABLE [dbo].[DangKyGoiTap]  WITH CHECK ADD  CONSTRAINT [CK_DKGT_Ngay] CHECK  (([NgayKetThuc]>=[NgayBatDau]))
GO
ALTER TABLE [dbo].[DangKyGoiTap] CHECK CONSTRAINT [CK_DKGT_Ngay]
GO
ALTER TABLE [dbo].[DangKyGoiTap]  WITH CHECK ADD  CONSTRAINT [CK_TRANGTHAIGT] CHECK  (([TrangThai]=N'Còn hiệu lực' OR [TrangThai]=N'Hết hạn' OR [TrangThai]=N'Đã hủy'))
GO
ALTER TABLE [dbo].[DangKyGoiTap] CHECK CONSTRAINT [CK_TRANGTHAIGT]
GO
ALTER TABLE [dbo].[DangKyLop]  WITH CHECK ADD  CONSTRAINT [CK_TRANGTHAILOP] CHECK  (([TrangThai]=N'Còn hiệu lực' OR [TrangThai]=N'Hủy' OR [TrangThai]=N'Kết thúc'))
GO
ALTER TABLE [dbo].[DangKyLop] CHECK CONSTRAINT [CK_TRANGTHAILOP]
GO
ALTER TABLE [dbo].[DangKyPT]  WITH CHECK ADD CHECK  (([SoBuoi]>(0)))
GO
ALTER TABLE [dbo].[DangKyPT]  WITH CHECK ADD CHECK  (([SoBuoi]>(0)))
GO
ALTER TABLE [dbo].[DangKyPT]  WITH CHECK ADD CHECK  (([SoBuoi]>(0)))
GO
ALTER TABLE [dbo].[DangKyPT]  WITH CHECK ADD CHECK  (([SoBuoi]>(0)))
GO
ALTER TABLE [dbo].[DangKyPT]  WITH CHECK ADD  CONSTRAINT [CK_TRANGTHAIPT] CHECK  (([TrangThai]=N'Chờ duyệt' OR [TrangThai]=N'Kết thúc' OR [TrangThai]=N'Hủy' OR [TrangThai]=N'Còn hiệu lực' OR [TrangThai]=N'Chờ thanh toán'))
GO
ALTER TABLE [dbo].[DangKyPT] CHECK CONSTRAINT [CK_TRANGTHAIPT]
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD  CONSTRAINT [CK_DiaChi_MacDinh] CHECK  (([LaDiaChiMacDinh]=(1) OR [LaDiaChiMacDinh]=(0)))
GO
ALTER TABLE [dbo].[DiaChi] CHECK CONSTRAINT [CK_DiaChi_MacDinh]
GO
ALTER TABLE [dbo].[GoiTap]  WITH CHECK ADD CHECK  (([Gia]>(0)))
GO
ALTER TABLE [dbo].[GoiTap]  WITH CHECK ADD CHECK  (([Gia]>(0)))
GO
ALTER TABLE [dbo].[GoiTap]  WITH CHECK ADD CHECK  (([Gia]>(0)))
GO
ALTER TABLE [dbo].[GoiTap]  WITH CHECK ADD CHECK  (([Gia]>(0)))
GO
ALTER TABLE [dbo].[GoiTap]  WITH CHECK ADD CHECK  (([ThoiHan]>(0)))
GO
ALTER TABLE [dbo].[GoiTap]  WITH CHECK ADD CHECK  (([ThoiHan]>(0)))
GO
ALTER TABLE [dbo].[GoiTap]  WITH CHECK ADD CHECK  (([ThoiHan]>(0)))
GO
ALTER TABLE [dbo].[GoiTap]  WITH CHECK ADD CHECK  (([ThoiHan]>(0)))
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD CHECK  (([TongTien]>=(0)))
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD CHECK  (([TongTien]>=(0)))
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [CK_TRANGTHAIHD] CHECK  (([TrangThai]=N'Hủy' OR [TrangThai]=N'Đã thanh toán' OR [TrangThai]=N'Chưa thanh toán'))
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [CK_TRANGTHAIHD]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CK_GIOITINH] CHECK  (([GIOITINH]=N'Nữ' OR [GIOITINH]=N'Nam'))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CK_GIOITINH]
GO
ALTER TABLE [dbo].[LichLop]  WITH CHECK ADD  CONSTRAINT [CK_LichLop_Gio] CHECK  (([GioKetThuc]>[GioBatDau]))
GO
ALTER TABLE [dbo].[LichLop] CHECK CONSTRAINT [CK_LichLop_Gio]
GO
ALTER TABLE [dbo].[LichTapPT]  WITH CHECK ADD  CONSTRAINT [CK_LichPT_Gio] CHECK  (([GioKetThuc]>[GioBatDau]))
GO
ALTER TABLE [dbo].[LichTapPT] CHECK CONSTRAINT [CK_LichPT_Gio]
GO
ALTER TABLE [dbo].[LichTapPT]  WITH CHECK ADD  CONSTRAINT [CK_TRANGTHAILT] CHECK  (([TrangThai]=N'Đã tập' OR [TrangThai]=N'Chưa tập'))
GO
ALTER TABLE [dbo].[LichTapPT] CHECK CONSTRAINT [CK_TRANGTHAILT]
GO
ALTER TABLE [dbo].[LoaiKhachHang]  WITH CHECK ADD CHECK  (([MucGiam]>=(0) AND [MucGiam]<=(100)))
GO
ALTER TABLE [dbo].[LoaiKhachHang]  WITH CHECK ADD CHECK  (([MucGiam]>=(0) AND [MucGiam]<=(100)))
GO
ALTER TABLE [dbo].[LoaiKhachHang]  WITH CHECK ADD CHECK  (([MucGiam]>=(0) AND [MucGiam]<=(100)))
GO
ALTER TABLE [dbo].[LoaiKhachHang]  WITH CHECK ADD CHECK  (([MucGiam]>=(0) AND [MucGiam]<=(100)))
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD CHECK  (([HocPhi]>(0)))
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD CHECK  (([HocPhi]>(0)))
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD CHECK  (([HocPhi]>(0)))
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD CHECK  (([HocPhi]>(0)))
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_GIOITINHNV] CHECK  (([GIOITINH]=N'Nữ' OR [GIOITINH]=N'Nam'))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_GIOITINHNV]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_NhanVien_SDT] CHECK  (([SDT] like '0%' AND len([SDT])=(10) AND NOT [SDT] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_NhanVien_SDT]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([GiaKhuyenMai]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([GiaKhuyenMai]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([GiaKhuyenMai]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([GiaKhuyenMai]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([SoLuongTon]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([SoLuongTon]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([SoLuongTon]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([SoLuongTon]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([SoLuongTon]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([SoLuongTon]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[sp_DangKyLop_KiemTra]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create     PROCEDURE [dbo].[sp_DangKyLop_KiemTra]
    @MaKH INT,
    @MaLop INT,
    @MaDKLop INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM DangKyLop WHERE MaKH = @MaKH AND MaLop = @MaLop AND TrangThai = N'Còn hiệu lực')
    BEGIN
        RAISERROR (N'Bạn đã đăng ký lớp học này rồi!', 16, 1);
        RETURN;
    END
    
    DECLARE @SiSoHienTai INT;
    DECLARE @SiSoToiDa INT;
    SELECT @SiSoHienTai = COUNT(*)
    FROM DangKyLop WITH (UPDLOCK) 
    WHERE MaLop = @MaLop AND TrangThai = N'Còn hiệu lực';

    SELECT @SiSoToiDa = SiSoToiDa FROM LopHoc WHERE MaLop = @MaLop;
    WAITFOR DELAY '00:00:05'; 

    IF (@SiSoToiDa IS NOT NULL AND @SiSoHienTai >= @SiSoToiDa)
    BEGIN
        RAISERROR (N'Lớp học đã đủ sĩ số, bạn chậm chân rồi!', 16, 1);
        RETURN;
    END

    INSERT INTO DangKyLop (MaKH, MaLop, NgayDangKy, TrangThai)
    VALUES (@MaKH, @MaLop, GETDATE(), N'Còn hiệu lực');

    SET @MaDKLop = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GanChuyenMonChoNhanVien]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   PROCEDURE [dbo].[sp_GanChuyenMonChoNhanVien]
    @MaNV INT,
    @MaCM INT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- (BỔ SUNG) Kiểm tra logic: Chỉ gán chuyên môn cho PT hoặc HLV Lớp
    IF (dbo.f_KiemTraNhanVienCoChucVu(@MaNV, N'PT') = 0 AND dbo.f_KiemTraNhanVienCoChucVu(@MaNV, N'HLV Lớp') = 0)
    BEGIN
        RAISERROR (N'Nhân viên này không phải là PT hoặc HLV Lớp, không thể gán chuyên môn.', 16, 1);
        RETURN;
    END
    
    IF EXISTS (SELECT 1 FROM NhanVienChuyenMon WHERE MaNV = @MaNV AND MaCM = @MaCM)
    BEGIN
        RAISERROR (N'Nhân viên này đã có chuyên môn này rồi.', 16, 1);
        RETURN;
    END

    INSERT INTO NhanVienChuyenMon (MaNV, MaCM) VALUES (@MaNV, @MaCM);
    PRINT N'Gán chuyên môn cho nhân viên thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_HinhAnh_Sua]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------
-- sp_HinhAnh_Sua
--------------------------------------------------------
CREATE   PROCEDURE [dbo].[sp_HinhAnh_Sua]
    @MaHinh INT,
    @MaSP INT,
    @Url NVARCHAR(500),
    @IsMain BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE HINHANH
    SET MaSP = @MaSP,
        Url = @Url,
        IsMain = @IsMain
    WHERE MaHinh = @MaHinh;

    SELECT @MaHinh AS UpdatedID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HinhAnh_Them]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------
-- sp_HinhAnh_Them
--------------------------------------------------------
CREATE   PROCEDURE [dbo].[sp_HinhAnh_Them]
    @MaSP   INT,
    @Url    NVARCHAR(500),
    @IsMain BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO HINHANH (MaSP, Url, IsMain)
    VALUES (@MaSP, @Url, @IsMain);

    SELECT SCOPE_IDENTITY() AS MaHinhMoi;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HinhAnh_Xoa]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------
-- sp_HinhAnh_Xoa
--------------------------------------------------------
CREATE   PROC [dbo].[sp_HinhAnh_Xoa]
    @MaHinh INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM HINHANH
    WHERE MaHinh = @MaHinh;

    SELECT @MaHinh AS MaHinhDaXoa;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHangDangKy]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   PROCEDURE [dbo].[sp_KhachHangDangKy]
    @TenKH NVARCHAR(100),
    @GioiTinh NVARCHAR(60),
    @NgaySinh DATE = NULL,
    @SDT NVARCHAR(15) = NULL,
    @Email NVARCHAR(100) = NULL,

    @TenDangNhap VARCHAR(300),
    @MatKhau VARCHAR(1000)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION; 

    BEGIN TRY
        IF EXISTS (SELECT 1 FROM KhachHang WHERE TenDangNhap = @TenDangNhap)
        BEGIN
            RAISERROR (N'Tên đăng nhập này đã được sử dụng. Vui lòng chọn tên khác.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF @SDT IS NOT NULL AND EXISTS (SELECT 1 FROM KhachHang WHERE SDT = @SDT)
        BEGIN
            RAISERROR (N'Số điện thoại này đã được đăng ký cho một tài khoản khác.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF @Email IS NOT NULL AND EXISTS (SELECT 1 FROM KhachHang WHERE Email = @Email)
        BEGIN
            RAISERROR (N'Email này đã được đăng ký cho một tài khoản khác.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        INSERT INTO KhachHang (TenKH, NgaySinh, SDT, Email, GioiTinh, TenDangNhap, MatKhau)
        VALUES (@TenKH, @NgaySinh, @SDT, @Email, @GioiTinh, @TenDangNhap, @MatKhau);

        COMMIT TRANSACTION; 
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION; 
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHangLogin]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create     PROCEDURE [dbo].[sp_KhachHangLogin]
    @TenDangNhap VARCHAR(300),
    @MatKhau VARCHAR(1000)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        MaKH,
        TenKH,
        SDT,
        Email        
    FROM KhachHang
    WHERE TenDangNhap = @TenDangNhap AND MatKhau = @MatKhau;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaChuyenMon]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create       PROCEDURE [dbo].[sp_SuaChuyenMon]
    @MaCM INT,
    @TenChuyenMon NVARCHAR(50),
    @MoTa NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra tồn tại
    IF NOT EXISTS (SELECT 1 FROM ChuyenMon WHERE MaCM = @MaCM)
    BEGIN
        RAISERROR (N'Chuyên môn không tồn tại.', 16, 1);
        RETURN;
    END

    -- Kiểm tra trùng tên (nhưng bỏ qua chính bản ghi đang sửa)
    IF EXISTS (SELECT 1 FROM ChuyenMon WHERE TenChuyenMon = @TenChuyenMon AND MaCM <> @MaCM)
    BEGIN
        RAISERROR (N'Tên chuyên môn này đã được sử dụng bởi mục khác.', 16, 1);
        RETURN;
    END

    UPDATE ChuyenMon 
    SET TenChuyenMon = @TenChuyenMon, 
        MoTa = @MoTa
    WHERE MaCM = @MaCM;

    PRINT N'Cập nhật chuyên môn thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaGoiTap]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SuaGoiTap]
    @MaGoiTap INT,
    @TenGoi NVARCHAR(50),
    @ThoiHan INT,
    @Gia DECIMAL(12,2),
    @MoTa NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM GoiTap WHERE MaGoiTap = @MaGoiTap)
    BEGIN
        RAISERROR(N'Mã gói tập không tồn tại.', 16, 1);
        RETURN;
    END

    UPDATE GoiTap
    SET 
        TenGoi = @TenGoi,
        ThoiHan = @ThoiHan,
        Gia = @Gia,
        MoTa = @MoTa
    WHERE MaGoiTap = @MaGoiTap;
    
    -- THAY THẾ CHO PRINT:
    -- Trả về một bảng có 1 hàng, 1 cột chứa thông báo
    SELECT N'Cập nhật gói tập thành công.' AS ThongBao;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaLoaiSanPham]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------
-- sp_SuaLoaiSanPham
--------------------------------------------------------
CREATE   PROCEDURE [dbo].[sp_SuaLoaiSanPham]
    @MaLoaiSP INT,
    @TenLoaiSP NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @KetQua INT = 0;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Không tồn tại
        IF NOT EXISTS (SELECT 1 FROM LoaiSanPham WHERE MaLoaiSP = @MaLoaiSP)
        BEGIN
            SET @KetQua = -1;
        END
        -- Tên mới trùng tên cũ
        ELSE IF EXISTS (
            SELECT 1 FROM LoaiSanPham 
            WHERE MaLoaiSP = @MaLoaiSP AND TenLoaiSP = @TenLoaiSP
        )
        BEGIN
            SET @KetQua = 0;
        END
        ELSE
        BEGIN
            UPDATE LoaiSanPham
            SET TenLoaiSP = @TenLoaiSP
            WHERE MaLoaiSP = @MaLoaiSP;

            SET @KetQua = @@ROWCOUNT;
        END

        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @KetQua = -99;
    END CATCH;

    SELECT @KetQua AS KetQua;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaLopHoc]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create     PROCEDURE [dbo].[sp_SuaLopHoc]
    @MaLop INT,
    @TenLop NVARCHAR(50),
    @MaCM INT,
    @HocPhi DECIMAL(12,2),
    @NgayBatDau DATE,
    @NgayKetThuc DATE,
    @SoBuoi INT,
    @SiSoToiDa INT,
    @MaNV INT = NULL,
    @GioBatDau TIME(7) = NULL,
    @GioKetThuc TIME(7) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Kiểm tra tồn tại
    IF NOT EXISTS (SELECT 1 FROM LopHoc WHERE MaLop = @MaLop)
    BEGIN
        RAISERROR (N'Lớp học không tồn tại.', 16, 1); RETURN;
    END

    -- 2. Kiểm tra trùng tên
    IF EXISTS (SELECT 1 FROM LopHoc WHERE TenLop = @TenLop AND MaLop <> @MaLop)
    BEGIN
        RAISERROR (N'Tên lớp học "%s" đã được sử dụng bởi một lớp khác.', 16, 1, @TenLop); RETURN;
    END
    
    -- 3. Cập nhật thông tin Lớp Học
    UPDATE LopHoc
    SET TenLop = @TenLop, MaCM = @MaCM, HocPhi = @HocPhi,
        NgayBatDau = @NgayBatDau, NgayKetThuc = @NgayKetThuc,
        SoBuoi = @SoBuoi, SiSoToiDa = @SiSoToiDa, MaNV = @MaNV
    WHERE MaLop = @MaLop;

    -- 4. CẬP NHẬT LỊCH LỚP (QUAN TRỌNG)
    -- Nếu có thay đổi Giờ hoặc Giáo viên, ta cập nhật lại LichLop
    -- (Chỉ cập nhật những lịch chưa diễn ra để giữ lịch sử)
    
    DECLARE @GioBD_Update TIME(7);
    DECLARE @GioKT_Update TIME(7);

    -- Nếu người dùng không nhập giờ mới (NULL hoặc 00:00), giữ nguyên giờ cũ trong LichLop
    -- (Logic này sẽ được xử lý kỹ hơn ở C# để truyền NULL xuống)
    IF @GioBatDau IS NOT NULL AND @GioKetThuc IS NOT NULL
    BEGIN
        IF @GioKetThuc <= @GioBatDau
        BEGIN
            RAISERROR (N'Giờ kết thúc phải lớn hơn giờ bắt đầu.', 16, 1); RETURN;
        END
        SET @GioBD_Update = @GioBatDau;
        SET @GioKT_Update = @GioKetThuc;
    END

    -- Cập nhật Lịch: Đổi Giáo viên và Đổi Giờ (nếu có)
    UPDATE LichLop
    SET 
        MaNV = ISNULL(@MaNV, MaNV), -- Nếu MaNV mới khác NULL thì cập nhật
        GioBatDau = ISNULL(@GioBD_Update, GioBatDau), -- Nếu có giờ mới thì cập nhật
        GioKetThuc = ISNULL(@GioKT_Update, GioKetThuc)
    WHERE MaLop = @MaLop 
      AND NgayHoc >= CAST(GETDATE() AS DATE); -- Chỉ cập nhật lịch tương lai

    PRINT N'Cập nhật lớp học và đồng bộ lịch thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaSanPham]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------
-- sp_SuaSanPham
--------------------------------------------------------
CREATE   PROCEDURE [dbo].[sp_SuaSanPham]
    @MaSP INT,
    @TenSP NVARCHAR(100),
    @MaLoaiSP INT,
    @DonGia DECIMAL(12, 2),
    @SoLuongTon INT,
    @GiaKhuyenMai DECIMAL(12, 2) = NULL,
    @Hang NVARCHAR(100) = NULL,
    @XuatXu NVARCHAR(100) = NULL,
    @BaoHanh NVARCHAR(50) = NULL,
    @MoTaChung NVARCHAR(1000) = NULL,
    @MoTaChiTiet NVARCHAR(MAX) = NULL,
    @TrangThai INT = NULL -- Tham số int, cho phép null
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM SanPham WHERE MaSP = @MaSP)
    BEGIN
        RAISERROR(N'Sản phẩm không tồn tại.', 16, 1);
        RETURN;
    END

    UPDATE SanPham
    SET 
        TenSP = @TenSP,
        MaLoaiSP = @MaLoaiSP,
        DonGia = @DonGia,
        SoLuongTon = @SoLuongTon,
        GiaKhuyenMai = @GiaKhuyenMai,
        Hang = @Hang,
        XuatXu = @XuatXu,
        BaoHanh = @BaoHanh,
        MoTaChung = @MoTaChung,
        MoTaChiTiet = @MoTaChiTiet,
        TrangThai = ISNULL(@TrangThai, TrangThai) 
    WHERE MaSP = @MaSP;

    SELECT @@ROWCOUNT AS SoDongCapNhat;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemChucVu]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create     PROCEDURE [dbo].[sp_ThemChucVu]
    @TenChucVu NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM ChucVu WHERE TenChucVu = @TenChucVu)
    BEGIN
        RAISERROR (N'Tên chức vụ đã tồn tại.', 16, 1);
        RETURN;
    END
    INSERT INTO ChucVu (TenChucVu) VALUES (@TenChucVu);
    PRINT N'Thêm chức vụ thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemChuyenMon]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   PROCEDURE [dbo].[sp_ThemChuyenMon]
    @TenChuyenMon NVARCHAR(50),
    @MoTa NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra trùng tên
    IF EXISTS (SELECT 1 FROM ChuyenMon WHERE TenChuyenMon = @TenChuyenMon)
    BEGIN
        RAISERROR (N'Tên chuyên môn này đã tồn tại. Vui lòng chọn tên khác.', 16, 1);
        RETURN;
    END

    INSERT INTO ChuyenMon (TenChuyenMon, MoTa) 
    VALUES (@TenChuyenMon, @MoTa);
    
    PRINT N'Thêm chuyên môn thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemGoiTap]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ThemGoiTap]
    @TenGoi NVARCHAR(50),
    @ThoiHan INT,
    @Gia DECIMAL(12,2),
    @MoTa NVARCHAR(MAX) = NULL  -- <-- BỔ SUNG THAM SỐ MỚI
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO GoiTap (
        TenGoi, 
        ThoiHan, 
        Gia, 
        MoTa    -- <-- BỔ SUNG CỘT MỚI
    ) 
    VALUES (
        @TenGoi, 
        @ThoiHan, 
        @Gia, 
        @MoTa   -- <-- BỔ SUNG GIÁ TRỊ MỚI
    );
    PRINT N'Thêm gói tập thành công.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemLichLop]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     PROCEDURE [dbo].[sp_ThemLichLop]
    @MaLop INT,
    @MaNV INT,
    @NgayHoc DATE,
    @GioBatDau TIME,
    @GioKetThuc TIME
AS
BEGIN
    SET NOCOUNT ON;

    IF (dbo.f_KiemTraNhanVienCoChucVu(@MaNV, N'HLV Lớp') = 0 AND dbo.f_KiemTraNhanVienCoChucVu(@MaNV, N'PT') = 0)
    BEGIN
        RAISERROR (N'Nhân viên này không phải là HLV Lớp hoặc PT, không thể thêm vào lịch lớp.', 16, 1);
        RETURN;
    END

    INSERT INTO LichLop (MaLop, NgayHoc, GioBatDau, GioKetThuc)
    VALUES (@MaLop, @NgayHoc, @GioBatDau, @GioKetThuc);
    
    PRINT N'Thêm lịch lớp thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemLichTapPT]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create   PROCEDURE [dbo].[sp_ThemLichTapPT]
    @MaDKPT INT,
    @NgayTap DATE,
    @GioBatDau TIME,
    @GioKetThuc TIME,
    @TrangThai NVARCHAR(20)
AS

SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION; 
    BEGIN TRY

        INSERT INTO LichTapPT (MaDKPT, NgayTap, GioBatDau, GioKetThuc, TrangThai)
        VALUES (@MaDKPT, @NgayTap, @GioBatDau, @GioKetThuc, @TrangThai);

        WAITFOR DELAY '00:00:7'; 

        COMMIT TRANSACTION; 
        PRINT N'Thêm lịch tập PT thành công.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemLoaiSanPham]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create     PROCEDURE [dbo].[sp_ThemLoaiSanPham]
    @TenLoaiSP NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM LoaiSanPham WHERE TenLoaiSP = @TenLoaiSP)
    BEGIN
        RAISERROR(N'Tên loại sản phẩm đã tồn tại!', 16, 1);
        RETURN;
    END

    INSERT INTO LoaiSanPham (TenLoaiSP)
    VALUES (@TenLoaiSP);

    PRINT N'Thêm loại sản phẩm thành công.';
    SELECT SCOPE_IDENTITY() AS MaLoaiMoi; 
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemLopHocVaLich]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[sp_ThemLopHocVaLich]
    @TenLop NVARCHAR(50),
    @MaCM INT,
    @HocPhi DECIMAL(12,2),
    @NgayBatDau DATE,
    @NgayKetThuc DATE,    
    @SiSoToiDa INT,
    @MaNV INT,
    @GioBatDau TIME(7),
    @GioKetThuc TIME(7)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        SET NOCOUNT ON;
        DECLARE @MaLop INT;

        INSERT INTO LopHoc (TenLop, MaNV, MaCM, HocPhi, NgayBatDau, NgayKetThuc, SiSoToiDa)
        VALUES (@TenLop, @MaNV, @MaCM, @HocPhi, @NgayBatDau, @NgayKetThuc, @SiSoToiDa);
    
        SET @MaLop = SCOPE_IDENTITY();

        DECLARE @Ngay DATE = @NgayBatDau;

        WHILE @Ngay <= @NgayKetThuc
        BEGIN
            INSERT INTO LichLop(MaLop, MaNV, NgayHoc, GioBatDau, GioKetThuc)
            VALUES (@MaLop, @MaNV, @Ngay, @GioBatDau, @GioKetThuc);

            SET @Ngay = DATEADD(WEEK, 1, @Ngay);
        END

        COMMIT TRANSACTION;
        PRINT N'Thêm lớp học và sinh lịch tự động thành công.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemNhanVien]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create     PROCEDURE [dbo].[sp_ThemNhanVien]
    @MaChucVu INT,
    @TenDangNhap VARCHAR(300),
    @MatKhau VARCHAR(1000),
    @GioiTinh NVARCHAR(60),
    @TenNV NVARCHAR(100),
    @SDT NVARCHAR(15) = NULL,
    @NgaySinh DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM NhanVien WHERE TenDangNhap = @TenDangNhap)
    BEGIN
        RAISERROR (N'Tên đăng nhập đã tồn tại.', 16, 1);
        RETURN;
    END
    INSERT INTO NhanVien (MaChucVu, TenDangNhap, MatKhau, GioiTinh, TenNV, SDT, NgaySinh)
    VALUES (@MaChucVu, @TenDangNhap, @MatKhau, @GioiTinh, @TenNV, @SDT, @NgaySinh);
    PRINT N'Thêm nhân viên thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemSanPham]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_ThemSanPham]
    @TenSP NVARCHAR(100),
    @MaLoaiSP INT,
    @DonGia DECIMAL(12,2),
    @SoLuongTon INT,
    @GiaKhuyenMai DECIMAL(12,2) = NULL,
    @Hang NVARCHAR(100) = NULL,
    @XuatXu NVARCHAR(100) = NULL,
    @BaoHanh NVARCHAR(50) = NULL,
    @MoTaChung NVARCHAR(1000) = NULL,
    @MoTaChiTiet NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @GiaKhuyenMai IS NOT NULL AND @GiaKhuyenMai > @DonGia
    BEGIN
        RAISERROR(N'Giá khuyến mãi không được lớn hơn giá gốc.', 16, 1);
        RETURN;
    END

    INSERT INTO SanPham (
        TenSP, MaLoaiSP, DonGia, SoLuongTon, 
        GiaKhuyenMai, Hang, XuatXu, BaoHanh, MoTaChung, MoTaChiTiet,
        TrangThai -- Thêm cột trạng thái
    )
    VALUES (
        @TenSP, @MaLoaiSP, @DonGia, @SoLuongTon,
        @GiaKhuyenMai, @Hang, @XuatXu, @BaoHanh, @MoTaChung, @MoTaChiTiet,
        1 -- Mặc định là 1 (Còn)
    );
    
    SELECT SCOPE_IDENTITY() AS MaSPMoi; 
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemVaoGioHang]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create   PROCEDURE [dbo].[sp_ThemVaoGioHang]
    @MaKH INT,
    @MaSP INT,
    @SoLuong INT = 1
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaChiTietGH_TonTai INT = NULL;
    DECLARE @SoLuongTon INT;
    DECLARE @SoLuongDangCo INT = 0;

    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Lấy tồn kho
        SELECT @SoLuongTon = SoLuongTon
        FROM SanPham
        WHERE MaSP = @MaSP;

        IF (@SoLuongTon IS NULL)
        BEGIN
            RAISERROR (N'Sản phẩm không tồn tại!', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF (@SoLuongTon <= 0)
        BEGIN
            RAISERROR (N'Sản phẩm đã hết hàng!', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF (@SoLuong <= 0)
        BEGIN           
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Kiểm tra đã có trong giỏ chưa
        SELECT @MaChiTietGH_TonTai = MaChiTietGH,
               @SoLuongDangCo = SoLuong
        FROM ChiTietGioHang
        WHERE MaKH = @MaKH AND MaSP = @MaSP;

        DECLARE @TongSoLuong INT = @SoLuong + @SoLuongDangCo;

        IF @MaChiTietGH_TonTai IS NOT NULL
        BEGIN
            UPDATE ChiTietGioHang
            SET SoLuong = @TongSoLuong,
                NgayThem = GETDATE()
            WHERE MaChiTietGH = @MaChiTietGH_TonTai;

            COMMIT TRANSACTION;
            RETURN;
        END

        -- Nếu chưa có -> insert
        INSERT INTO ChiTietGioHang (MaKH, MaSP, SoLuong, NgayThem)
        VALUES (@MaKH, @MaSP, @SoLuong, GETDATE());

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrMsg, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTrangThaiLichLop]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateTrangThaiLichLop]
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[LichLop]
    SET [TrangThai] = CASE 
        WHEN [NgayHoc] < CAST(GETDATE() AS DATE) THEN N'Đã diễn ra'
        WHEN [NgayHoc] = CAST(GETDATE() AS DATE) AND [GioKetThuc] < CAST(GETDATE() AS TIME) THEN N'Đã diễn ra'
        ELSE N'Chưa diễn ra'
    END
    WHERE [TrangThai] IS NULL 
       OR [TrangThai] != (CASE 
             WHEN [NgayHoc] < CAST(GETDATE() AS DATE) THEN N'Đã diễn ra'
             WHEN [NgayHoc] = CAST(GETDATE() AS DATE) AND [GioKetThuc] < CAST(GETDATE() AS TIME) THEN N'Đã diễn ra'
             ELSE N'Chưa diễn ra'
          END);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaChucVu]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   PROCEDURE [dbo].[sp_XoaChucVu]
    @MaChucVu INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. KIỂM TRA: Không cho xóa các chức vụ quan trọng của hệ thống
    -- (Ví dụ: Quản lý, PT, HLV Lớp... vì logic code C# đang dựa vào tên của chúng)
    DECLARE @TenChucVu NVARCHAR(50);
    SELECT @TenChucVu = TenChucVu FROM ChucVu WHERE MaChucVu = @MaChucVu;

    IF @TenChucVu IN (N'Quản lý', N'PT', N'HLV Lớp')
    BEGIN
        RAISERROR (N'Đây là chức vụ hệ thống quan trọng (đang được dùng để phân quyền Logic). Bạn không được phép xóa.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION;
    BEGIN TRY
        -- 2. GỠ CHỨC VỤ KHỎI NHÂN VIÊN (Thay vì xóa nhân viên)
        -- Cập nhật tất cả nhân viên đang giữ chức vụ này thành NULL (Không có chức vụ)
        UPDATE NhanVien
        SET MaChucVu = NULL
        WHERE MaChucVu = @MaChucVu;

        -- 3. XÓA CHỨC VỤ
        DELETE FROM ChucVu WHERE MaChucVu = @MaChucVu;

        COMMIT TRANSACTION;
        PRINT N'Đã xóa chức vụ thành công. Các nhân viên giữ chức vụ này đã được cập nhật thành (Chưa có chức vụ).';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaChuyenMon]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   PROCEDURE [dbo].[sp_XoaChuyenMon]
    @MaCM INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Kiểm tra ràng buộc: Nếu đã có Lớp Học thuộc chuyên môn này -> CẤM XÓA
    -- (Vì Lớp học dính đến tiền nong, lịch sử...)
    IF EXISTS (SELECT 1 FROM LopHoc WHERE MaCM = @MaCM)
    BEGIN
        RAISERROR (N'Chuyên môn này đang được sử dụng trong các Lớp Học. Không thể xóa. Hãy sửa tên hoặc ngừng sử dụng thay vì xóa.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION;
    BEGIN TRY
        -- 2. Dọn dẹp bảng NhanVienChuyenMon (Gỡ môn này khỏi tất cả nhân viên)
        DELETE FROM NhanVienChuyenMon WHERE MaCM = @MaCM;

        -- 3. Xóa Chuyên Môn
        DELETE FROM ChuyenMon WHERE MaCM = @MaCM;

        COMMIT TRANSACTION;
        PRINT N'Đã xóa chuyên môn thành công.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaNhanVien]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   PROCEDURE [dbo].[sp_XoaNhanVien]
    @MaNV INT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- 1. KIỂM TRA AN TOÀN (Ràng buộc Kế toán - Giữ nguyên)
    IF EXISTS (
        SELECT 1 
        FROM ChiTietHoaDon CT 
        JOIN DangKyPT DK ON CT.MaDKPT = DK.MaDKPT 
        WHERE DK.MaNV = @MaNV
    )
    BEGIN
        RAISERROR (N'Nhân viên này đã có giao dịch tài chính (Bán gói PT trong Hóa đơn). Không thể xóa vì lý do kế toán. Hãy đổi mật khẩu hoặc hủy kích hoạt tài khoản.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION;
    BEGIN TRY
        -- 2. Xóa Chuyên Môn (Bảng NhanVienChuyenMon)
        DELETE FROM NhanVienChuyenMon WHERE MaNV = @MaNV;

        -- 3. Xóa Lịch Lớp (Bảng LichLop) - Xóa các buổi dạy lẻ tẻ
        DELETE FROM LichLop WHERE MaNV = @MaNV;

        -- 4. Xử lý Gói Đăng Ký PT
        DELETE FROM LichTapPT 
        WHERE MaDKPT IN (SELECT MaDKPT FROM DangKyPT WHERE MaNV = @MaNV);

        DELETE FROM DangKyPT WHERE MaNV = @MaNV;

        -- ============================================================
        -- == 5. MỚI THÊM: GỠ NHÂN VIÊN KHỎI LỚP HỌC (QUAN TRỌNG) ==
        -- ============================================================
        -- Cập nhật các lớp mà nhân viên này đang làm chủ nhiệm thành NULL
        UPDATE LopHoc 
        SET MaNV = NULL 
        WHERE MaNV = @MaNV;

        -- 6. Cuối cùng: Xóa Nhân Viên
        DELETE FROM NhanVien WHERE MaNV = @MaNV;

        COMMIT TRANSACTION;
        PRINT N'Đã xóa nhân viên và cập nhật dữ liệu liên quan thành công.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaNhanVienChuyenMon]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create     PROCEDURE [dbo].[sp_XoaNhanVienChuyenMon]
    @MaNV INT,
    @MaCM INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. KIỂM TRA LỊCH LỚP (Đang dạy hoặc sắp dạy)
    -- Nếu nhân viên này có lịch dạy (LichLop) thuộc lớp có chuyên môn này
    -- VÀ lịch đó chưa kết thúc (Ngày học >= Hôm nay) -> CẤM GỠ
    IF EXISTS (
        SELECT 1 
        FROM LichLop LL
        JOIN LopHoc LH ON LL.MaLop = LH.MaLop
        WHERE LL.MaNV = @MaNV 
          AND LH.MaCM = @MaCM
          AND LL.NgayHoc >= CAST(GETDATE() AS DATE) -- Chỉ chặn lịch tương lai/hôm nay
    )
    BEGIN
        DECLARE @TenMon NVARCHAR(50);
        SELECT @TenMon = TenChuyenMon FROM ChuyenMon WHERE MaCM = @MaCM;
        
        RAISERROR (N'Nhân viên này đang có lịch dạy lớp thuộc chuyên môn "%s" trong tương lai. Không thể gỡ bỏ chuyên môn này.', 16, 1, @TenMon);
        RETURN;
    END

    -- 2. KIỂM TRA CHỦ NHIỆM LỚP (Mới thêm)
    -- Nếu nhân viên này đang là GV Chủ Nhiệm (MaNV trong bảng LopHoc) 
    -- của một lớp thuộc chuyên môn này và lớp đó chưa kết thúc -> CẤM GỠ
    IF EXISTS (
        SELECT 1
        FROM LopHoc
        WHERE MaNV = @MaNV
          AND MaCM = @MaCM
          AND NgayKetThuc >= CAST(GETDATE() AS DATE)
    )
    BEGIN
        DECLARE @TenMon2 NVARCHAR(50);
        SELECT @TenMon2 = TenChuyenMon FROM ChuyenMon WHERE MaCM = @MaCM;

        RAISERROR (N'Nhân viên này đang là Giáo viên chủ nhiệm của lớp thuộc chuyên môn "%s". Vui lòng đổi giáo viên chủ nhiệm trước khi gỡ chuyên môn.', 16, 1, @TenMon2);
        RETURN;
    END

    -- 3. Nếu thỏa mãn hết -> Xóa
    DELETE FROM NhanVienChuyenMon 
    WHERE MaNV = @MaNV AND MaCM = @MaCM;

    PRINT N'Đã gỡ bỏ chuyên môn khỏi nhân viên thành công.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaSanPham]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_XoaSanPham]
    @MaSP INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM SanPham WHERE MaSP = @MaSP)
    BEGIN
        RETURN 0;
    END
    UPDATE SanPham
    SET TrangThai = 2 
    WHERE MaSP = @MaSP;

    RETURN @@ROWCOUNT;
END;
GO
/****** Object:  StoredProcedure [dbo].[XoaLichVaLop]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create     procedure [dbo].[XoaLichVaLop]
    @MaLop int
As
Begin
    Begin transaction;
        Set nocount on;        
        delete from LichLop where MaLop = @MaLop
        delete from LopHoc where MaLop = @MaLop
    Commit transaction;
End;
GO
/****** Object:  Trigger [dbo].[TR_DangKyLop_ThemSiSo]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [dbo].[TR_DangKyLop_ThemSiSo]
ON [dbo].[DangKyLop]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra các bản ghi được chèn có trạng thái là 'Còn hiệu lực' hay không
    IF EXISTS (SELECT 1 FROM inserted WHERE TrangThai = N'Còn hiệu lực')
    BEGIN
        -- Cập nhật SiSoHienTai trong bảng LopHoc
        UPDATE LH
        SET LH.SiSoHienTai = ISNULL(LH.SiSoHienTai, 0) + 1
        FROM dbo.LopHoc LH
        INNER JOIN inserted i ON LH.MaLop = i.MaLop
        WHERE i.TrangThai = N'Còn hiệu lực';
    END
END;
GO
ALTER TABLE [dbo].[DangKyLop] ENABLE TRIGGER [TR_DangKyLop_ThemSiSo]
GO
/****** Object:  Trigger [dbo].[TR_LopHoc_UpdateLichLopNV]    Script Date: 10/12/2025 1:25:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [dbo].[TR_LopHoc_UpdateLichLopNV]
ON [dbo].[LopHoc]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(MaNV)
    BEGIN
        UPDATE LL
        SET LL.MaNV = I.MaNV
        FROM LichLop LL
        INNER JOIN inserted I ON LL.MaLop = I.MaLop 
        INNER JOIN deleted D ON LL.MaLop = D.MaLop 
        WHERE I.MaNV <> D.MaNV 
          AND LL.NgayHoc >= CAST(GETDATE() AS DATE) 
          AND LL.TrangThai NOT IN (N'Đã diễn ra', N'Đã hủy');
    END
END;
GO

CREATE OR ALTER TRIGGER TR_LopHoc_UpdateLichLopNV
ON LopHoc
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(MaNV)
    BEGIN
        UPDATE LL
        SET LL.MaNV = i.MaNV
        FROM LichLop LL
        INNER JOIN inserted i ON LL.MaLop = i.MaLop 
        INNER JOIN deleted d ON LL.MaLop = d.MaLop 
        WHERE 
            (i.MaNV <> d.MaNV OR (i.MaNV IS NULL AND d.MaNV IS NOT NULL) OR (i.MaNV IS NOT NULL AND d.MaNV IS NULL))
            AND LL.NgayHoc >= CAST(GETDATE() AS DATE)
            AND LL.TrangThai NOT IN (N'Đã diễn ra', N'Đã hủy');
    END
END;
GO


ALTER TABLE [dbo].[LopHoc] ENABLE TRIGGER [TR_LopHoc_UpdateLichLopNV]
GO
