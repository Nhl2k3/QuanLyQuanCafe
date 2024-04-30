Create Database QuanLyQuanCafe
Go

Use QuanLyQuanCafe
Go

-- 1.Ban Nuoc Uong
-- 2.Tai Khoan
-- 3.Loai Nuoc Uong
-- 4.Hoa Don
-- 5.Chi Tiet Hoa Don

-- 1. Table Nuoc uong
Create Table BanNuocUong
(
	ID INT IDENTITY PRIMARY KEY,
	Ten NVARCHAR(30) NOT NULL DEFAULT N'Bàn chưa đặt tên',
	TinhTrang NVARCHAR(100) NOT NULL DEFAULT N'Bàn trống' -- Ban Trong hoac co nguoi
)
Go

Create Table TaiKhoan
(
	TenHienThi NVARCHAR(100) PRIMARY KEY,
	TenDangNhap NVARCHAR(100) NOT NULL DEFAULT N'ABC',	
	MatKhau NVARCHAR(1500) NOT NULL DEFAULT 0,
	LoaiTaiKhoan INT NOT NULL DEFAULT 0 --1: Admin || 2 : Nhan vien
)
Go

Create Table LoaiNuocUong
(
	ID INT IDENTITY PRIMARY KEY,
	Ten NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
)
Go

CREATE TABLE NuocUong
(
	ID INT IDENTITY PRIMARY KEY,
	Ten NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	IDLoaiNuocUong INT NOT NULL,
	Gia FLOAT NOT NULL DEFAULT 0

	FOREIGN KEY (IDLoaiNuocUong) REFERENCES dbo.LoaiNuocUong(ID)
)
GO

CREATE TABLE HoaDon
(
	ID INT IDENTITY PRIMARY KEY,
	NgayVao DATE NOT NULL DEFAULT GETDATE(),
	NgayRa DATE,
	IDBanNuocUong INT NOT NULL,
	TinhTrang INT NOT NULL DEFAULT 0, -- Thanh Toan hoac Chua Thanh Toan

	FOREIGN KEY (IDBanNuocUong) REFERENCES dbo.BanNuocUong(ID)
)
GO

CREATE TABLE ChiTietHoaDon
(
	ID INT IDENTITY PRIMARY KEY,
	IDHoaDon INT NOT NULL,
	IDNuocUong INT NOT NULL,
	Tong INT NOT NULL,
	SoLuong INT NOT NULL DEFAULT 0,
	
	FOREIGN KEY (IDHoaDon) REFERENCES dbo.HoaDon(ID),
	FOREIGN KEY (IDNuocUong) REFERENCES dbo.NuocUong(ID)
)
GO
