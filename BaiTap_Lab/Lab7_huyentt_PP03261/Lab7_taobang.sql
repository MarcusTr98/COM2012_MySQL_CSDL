
create database quanly_banhang_l7;
use quanly_banhang_l7;

create table khachhang(
maKH varchar(6) primary key not null,
hoVaDem varchar(50) not null,
ten varchar(50) not null,
diaChi varchar(100),
eMail varchar(50),
SDT varchar(11) not null
);

create table sanpham(
maSP int primary key not null,
moTa varchar(250) not null,
soLuongTrongKho int not null,
donGia float not null,
tenSP varchar(50) not null
);

create table hoadon(
ma_KH varchar(6),
foreign key (ma_KH) references khachhang(maKH),
maHoaDon int primary key not null,
ngayMua date not null,
trangThai varchar(100)
);

create table chitiet_hoadon(
maHD_chiTiet int not null primary key,
ma_HoaDon int,
foreign key(ma_HoaDon) references hoadon(maHoaDon),
ma_SP int,
foreign key(ma_SP) references sanpham(maSP),
soLuongMua int
);