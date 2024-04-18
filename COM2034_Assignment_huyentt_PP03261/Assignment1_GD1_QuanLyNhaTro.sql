create database QuanLyNhaTro
go
use QuanLyNhaTro

create table LoaiNha (
maLoaiNha varchar(5) primary key,
tenLoaiNha nvarchar(30) not null
)

insert into LoaiNha
values ('LN01',N'Căn hộ trung cư'),
('LN02',N'Nhà riêng'),
('LN03',N'Phòng trọ khép kín');

create table NguoiDung (
maND varchar(5) primary key,
tenND nvarchar(30) not null,
gioiTinh bit,
ngaySinh date,
SDT char(10) not null,
duong_ND nvarchar(30),
phuong_ND nvarchar(30),
quan_ND nvarchar(20) not null,
email varchar(50) not null
)

insert into NguoiDung
values ('ND01',N'Nguyễn Đăng Quang','1','1991-02-28','0907666999',N'25 Lê Thánh Tông', N'Máy Chai', N'Ngô Quyền', 'quangnd01@gmail.com'),
('ND02',N'Nguyễn Hoài An','0','1980-12-27','0997656909',N'235/98 Dư Hàng',N'Dư Hàng Kênh', N'Ngô Quyền', 'anhn09@gmail.com'),
('ND03',N'Trương Nam Sơn','1','1990-01-18','0876569119',N'298 Trần Quang Khải',N'Hoàng Văn Thụ', N'Hồng Bàng', 'sontn08@gmail.com'),
('ND04',N'Trần Trung Hiếu','1','1979-07-08','0886569876',N'36/6 Lý Tự Trọng','Quang Trung', N'Hồng Bàng', 'hieupc98@gmail.com'),
('ND05',N'Lý Hoàng Hà','0','1998-08-20','0876561888','301 Minh Khai','Minh Khai', N'Hồng Bàng', 'hahaha178@gmail.com'),
('ND06',N'Trần Bạch Long','1','1984-05-20','0876511800','3/120 Vĩnh Niệm',N'Vĩnh Niệm', N'Lê Chân', 'l0ngkute88@gmail.com'),
('ND07',N'Nguyễn Ngọc Ánh','0','1992-05-21','0976500879','301 Hai Bà Trưng',N'Mê Linh', N'Lê Chân', 'anhnn98@gmail.com'),
('ND08',N'Phạm Nam Thanh','0','1994-08-09','0876500076','107/6/9 Lê Lai',N'Máy Chai', N'Ngô Quyền', 'thanhnp99@gmail.com'),
('ND09',N'Trịnh Quốc Thành','1','1991-12-10','0354111568',N'25 Trần Nhân Tông',N'Quán Trữ', N'Kiến An', 'thanhtrinh@gmail.com'),
('ND10',N'Khoa Hải Bình','0','1995-11-01','0356561855',N'11/39 Hào Khê',N'Cát Bi', N'Hải An', 'binhhk@gmail.com');


create table NhaTro(
maNhaTro varchar(5) primary key,
maLoaiNha varchar(5),
foreign key (maLoaiNha) references LoaiNha(maLoaiNha),
maND varchar(5),
foreign key (maND) references NguoiDung(maND),
dienTich float check (dienTich > 20),
giaPhong float check (giaPhong > 0),
duong_NT nvarchar(30),
phuong_NT nvarchar(30),
quan_NT nvarchar(20) not null,
moTa nvarchar(100),
ngayDangTin date not null
);

insert into NhaTro
values ('NT01','LN01','ND02',45,6000000,N'Khu Đô Thị Waterfront City',N'Vĩnh Niệm', N'Lê Chân',N'Căn hộ cao cấp, full đồ','2024-03-25'),
('NT02','LN01','ND02',45,5000000,N'Khu Đô Thị Waterfront City',N'Vĩnh Niệm', N'Lê Chân',N'Căn hộ cao cấp, không đồ','2024-03-26'),
('NT03','LN02','ND04',60,4000000,N'103 Lê Lai', N'Máy Chai',N'Ngô Quyền',N'Nhà riêng, không chung chủ','2024-03-26'),
('NT04','LN02','ND04',35,3500000,N'10 Hai Bà Trưng', N'Mê Linh', N'Lê Chân',N'Nhà riêng, không chung chủ, full đồ','2024-03-27'),
('NT05','LN03','ND06',30,2500000,N'30/15 Lê Thánh Tông', N'Máy Chai', N'Ngô Quyền',N'Phòng trọ sạch sẽ, an ninh','2024-03-28'),
('NT06','LN03','ND06',30,2500000,N'1/10 Lê Đại Hành', N'Hoàng Văn Thụ', N'Hồng Bàng',N'Phòng trọ khép kín, an ninh','2024-03-28'),
('NT07','LN02','ND08',70,18000000,'38 Quang Trung', 'Quang Trung', N'Hồng Bàng',N'Nhà mặt đường, 4 tầng, có cầu thang máy','2024-03-29'),
('NT08','LN02','ND03',40,500000,N'23 Lý Hồng Nhật', N'Cát Bi', N'Hải An',N'Nhà mặt đường, 2 tầng, có thể kinh doanh','2024-03-29'),
('NT09','LN01','ND03',75,2800000,N'Chung cư The Minato Residence', N'Vĩnh Niệm', N'Lê Chân',N'Chung cư cao cấp, 3 phòng ngủ, full đồ','2024-03-29'),
('NT10','LN01','ND03',55,20000000,N'Chung cư The Minato Residence', N'Vĩnh Niệm', N'Lê Chân',N'Chung cư cao cấp, 2 phòng ngủ, full đồ','2024-03-30')
;

create table DanhGia(
stt int primary key identity,
maND varchar(5),
foreign key (maND) references NguoiDung(maND),
maNhaTro varchar(5),
foreign key (maNhaTro) references NhaTro(maNhaTro),
like_dislike bit,
noiDung nvarchar(100)
);
ALTER TABLE DanhGia ADD CONSTRAINT PK_DanhGia_stt PRIMARY KEY (stt);

GO
insert into DanhGia
values(1,'ND07','NT01',1,N'Căn hộ rất đẹp, hài lòng!'),
(2,'ND01','NT03',0,N'Nhà ẩm mốc, không hài lòng!'),
(3,'ND05','NT02',1,N'Căn hộ rất đẹp, hài lòng!'),
(4,'ND07','NT05',1,N'Phòng trọ khá an ninh, hài lòng!'),
(5,'ND05','NT07',1,N'Nhà riêng đúng quảng cáo, hài lòng!'),
(6,'ND10','NT06',0,N'Phòng trọ không an ninh, không hài lòng!'),
(7,'ND09','NT08',1,N'Nhà mặt đường, đông dân, hài lòng!'),
(8,'ND09','NT09',1,N'Căn hộ sạch sẽ, hài lòng!'),
(9,'ND03','NT10',1,N'Căn hộ đầy đủ đồ, hài lòng!');

insert into DanhGia
values(10,'ND04','NT03',0,N'Giá hơi cao, không hài lòng!'),
(11,'ND08','NT02',1,N'Căn hộ đầy đủ đồ, hài lòng!'),
(12,'ND01','NT05',0,N'Giá hơi cao, không hài lòng!'),
(13,'ND09','NT01',1,N'Căn hộ đầy đủ đồ, hài lòng!'),
(14,'ND02','NT09',0,N'Giá cao, không hài lòng!'),
(15,'ND03','NT10',0,N'Nhà cũ, không hài lòng!'),
(16,'ND05','NT02',1,N'Căn hộ đầy đủ đồ, hài lòng!');
