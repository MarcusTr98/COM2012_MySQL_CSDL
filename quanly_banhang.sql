create database quanly_banhang;
use quanly_banhang;
create table khachhang(
maKH varchar(6) primary key not null,
hoVaDem varchar(50) not null,
ten varchar(50) not null,
diaChi varchar(100),
eMail varchar(50),
SDT varchar(11) not null
);
insert into khachhang
values ("KH001", "Nguyễn Thị", "Nga", "15 Quang Trung TP Đà Nẵng", "ngant@gmail.com", "0912345670"),
("KH002", "Trần Công", "Thành", "2234 Lê Lợi Quảng Nam", "thanhtc@gmail.com", "16109423443"),
("KH003", "Lê Hoàng", "Nam", "23 Trần Phú TP Huế", "namlt@yahoo.com", "0989354556"),
("KH004", "Vũ Ngọc", "Hiên", "37 Nguyễn Thị Thập TP Đà Nẵng", "hienvn@gmail.com", "0894545435"),
('KH005','Nguyễn Mạnh','Đồng','Hoằng Quang- Hoằng Hoá- Thanh Hoá','username789@gmail.com','0567891234
'),('KH006','Lò Hùng','Mạnh','Bản Púng Tôm- Thanh Minh- Điện Biên','randomemailuser@gmail.com','0678912345
'),('KH007','Hoàng Xuân','Luyện','Trường Yên- Chương Mỹ - Hà Tây','testuser@gmail.com','0789123456
'),('KH008','Đỗ Thanh','Tùng','Lộc Ninh- Nam Hưng- Tiền Hải- Thái Bình','example987@gmail.com','0891234567
'),('KH009','Hà Văn','Bình','Đồ Xá- Yên Thường- Gia Lâm- HN','fakeuser@gmail.com','0902345678
'),('KH010','Nguyễn Đức','Tâm','Đồng Lợi- Triệu Sơn- Thanh Hoá','randomuser321@gmail.com','0907649211
'),('KH011','Lê Ngọc','Quân','xóm Mới- Nà Cang- Thanh Uyên- Lai Châu','emailtest@gmail.com','0123456789
'),('KH012','Đỗ Ngọc','Khiêm','Đồng Bồng- Hà Tiến- Hà Trung- Thanh Hoá','user7890@gmail.com','0234567891
'),('KH013','Đinh Hoàng','Tùng','xóm 2- Đông Cường- Đông Hưng- Thái Bình','myemail123@gmail.com','0345678912
'),('KH014','Bùi Đức','Ái','tổ 8- thị trấn Bằng Lũng- Chợ Đồn- Bắc Cạn','testemail456@gmail.com','0456789123
'),('KH015','Đỗ Tuấn','Anh','Thôn Nà Lịn- Tân Lập- Chợ Đồn- Bắc Kạn','randomperson@gmail.com','0567891234
'),('KH016','Hà Minh','Hải','xóm 3- Thượng Kiệm- Kim Sơn - Ninh Bình','userexample@gmail.com','0678912345
'),('KH017','Hà Đình','Xứng','Ngư Lộc- Hậu Lộc- Thanh Hoá','emailuser789@gmail.com','0789123456
'),('KH018','Nguyễn Văn','Bình','Phong Mỹ 2- Yên Lâm- Yên Định - Thanh Hoá','sampleemail@gmail.com','0891234567
'),('KH019','Nguyễn Thế','Hải','xóm 2- Dư Xã- Hoà Nam- ứng Hoà- Hà Tây','newuser123@gmail.com','0902345678
'),('KH020','Nguyễn Hữu','Hùng','Lộc Hạ- Nam Định','mytestemail@gmail.com','089561236');

create table sanpham(
maSP int primary key not null,
moTa varchar(250) not null,
soLuongTrongKho int not null,
donGia float not null,
tenSP varchar(50) not null
);
insert into sanpham
values ('1','Điện thoại Apple','86','2060000','iPhone 13 Pro'),
('2','Laptop thời thượng','16','2060000','Laptop Dell XPS 13'),
('3','Điện thoại thông minh','76','1829000','Samsung Galaxy S21 Ultra'),
('4','Laptop thời thượng','19','2660000','Laptop MacBook Air M2'),
('5','Điện thoại thông minh','27','800000','Google Pixel 6 Pro'),
('6','Laptop thời thượng','68','2512000','Laptop HP Spectre x360'),
('7','Đồng hồ thông minh','34','1378000','Đồng hồ thông minh'),
('8','Laptop thời thượng','148','1241000','Laptop Asus ROG Zephyrus G14'),
('9','Điện thoại thông minh','85','626000','Xiaomi Mi 11'),
('10','Laptop văn phòng','90','1900000','Laptop Lenovo ThinkPad X1 Carbon'),
('11','Điện thoại thông minh','94','724000','Oppo Find X3 Pro'),
('12','Laptop thời thượng','23','1483000','Laptop Acer Swift 5'),
('13','Điện thoại thông minh','30','692000','Sony Xperia 1 III'),
('14','Laptop văn phòng','13','1970000','Laptop Microsoft Surface Laptop 4'),
('15','Điện thoại thông minh','100','103300','Huawei P40 Pro+'),
('16','Điện thoại thông minh','129','1125000','Samsung Galaxy J7 Pro'),
('17','Điện thoại thông minh','196','1320000','iPhone X 128GB'),
('18','Điện thoại Apple','39','970000','Iphone 7 32GB'),
('19','Sạc dự phòng tích hợp nhanh','61','50000','Pin sạc dự phòng'),
('20','Điện thoại chức năng cơ bản','18','95000','Nokia 3100');

create table hoadon(
ma_KH varchar(6),
foreign key (ma_KH) references khachhang(maKH),
maHoaDon int primary key not null,
ngayMua date not null,
trangThai varchar(100)
);
insert into hoadon
values ('KH001','12001','2016-12-24','Đã thanh toán'),
('KH002','12002','2016-12-24','Đã thanh toán'),
('KH003','12003','2016-12-25','Chưa thanh toán'),
('KH004','12004','2016-12-15','Chưa thanh toán'),
('KH005','12005','2016-12-27','Đã thanh toán'),
('KH006','12006','2017-03-28','Đã thanh toán'),
('KH007','12007','2017-03-29','Chưa thanh toán'),
('KH008','12008','2020-03-30','Chưa thanh toán'),
('KH009','12009','2020-03-31','Đã thanh toán'),
('KH010','12010','2021-04-01','Đã thanh toán'),
('KH011','12011','2021-04-02','Chưa thanh toán'),
('KH012','12012','2021-04-03','Chưa thanh toán'),
('KH013','12013','2022-04-04','Đã thanh toán'),
('KH014','12014','2022-04-05','Đã thanh toán'),
('KH015','12015','2022-04-06','Đã thanh toán'),
('KH016','12016','2023-04-07','Chưa thanh toán'),
('KH017','12017','2023-04-08','Chưa thanh toán'),
('KH018','12018','2023-04-09','Chưa thanh toán'),
('KH019','12019','2023-04-10','Đã thanh toán'),
('KH020','12020','2024-01-11','Đã thanh toán');

create table chitiet_hoadon(
maHD_chiTiet int not null primary key,
ma_HoaDon int,
foreign key(ma_HoaDon) references hoadon(maHoaDon),
ma_SP int,
foreign key(ma_SP) references sanpham(maSP),
soLuongMua int
);
insert into chitiet_hoadon
values ('1','12001','3','4'),
('2','12002','20','4'),
('3','12003','2','3'),
('4','12004','5','6'),
('5','12005','5','5'),
('6','12006','5','7'),
('7','12007','6','9'),
('8','12008','18','3'),
('9','12009','18','10'),
('10','12010','17','3'),
('11','12011','17','7'),
('12','12012','18','10'),
('13','12013','18','5'),
('14','12014','18','8'),
('15','12015','3','15'),
('16','12016','10','7'),
('17','12017','12','6'),
('18','12018','14','4'),
('19','12019','18','2'),
('20','12020','18','8');