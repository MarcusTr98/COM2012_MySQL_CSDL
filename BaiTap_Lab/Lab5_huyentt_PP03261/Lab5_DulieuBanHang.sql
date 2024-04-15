create database quanly_banhang;
use quanly_banhang;
create table khachhang(
idKH varchar(6) primary key not null,
hoVaTenLot varchar(50) not null,
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
idSanPham int primary key not null,
moTa varchar(250) not null,
soLuong int not null,
donGia double not null,
tenSP varchar(100) not null
);
insert into sanpham
values ('1','Điện thoại thông minh','86','30600000','iPhone 13 Pro'),
('2','Laptop thời thượng','16','20600000','Laptop Dell XPS 13'),
('3','Điện thoại thông minh','76','18290000','Samsung Galaxy S21 Ultra'),
('4','Laptop thời thượng','19','26600000','Laptop MacBook Air M2'),
('5','Điện thoại thông minh','27','8000000','Google Pixel 6 Pro'),
('6','Laptop thời thượng','68','25120000','Laptop HP Spectre x360'),
('7','Đồng hồ thông minh','34','13780000','Đồng hồ thông minh'),
('8','Laptop thời thượng','148','12410000','Laptop Asus ROG Zephyrus G14'),
('9','Điện thoại thông minh','85','6260000','Xiaomi Mi 11'),
('10','Laptop văn phòng','90','19000000','Laptop Lenovo ThinkPad X1 Carbon'),
('11','Điện thoại thông minh','94','7240000','Oppo Find X3 Pro'),
('12','Laptop thời thượng','23','14830000','Laptop Acer Swift 5'),
('13','Điện thoại thông minh','30','6920000','Sony Xperia 1 III'),
('14','Laptop văn phòng','13','19700000','Laptop Microsoft Surface Laptop 4'),
('15','Điện thoại thông minh','100','10330000','Huawei P40 Pro+'),
('16','Điện thoại thông minh','129','11250000','Samsung Galaxy J7 Pro'),
('17','Điện thoại thông minh','196','13200000','iPhone X 128GB'),
('18','Laptop thời thượng','39','27000000','Laptop Dell Inspiron 3467'),
('19','Sạc dự phòng tích hợp nhanh','61','500000','Pin sạc dự phòng'),
('20','Điện thoại chức năng cơ bản','18','950000','Nokia 3100');

create table hoadon(
fk_idKH varchar(6),
foreign key (fk_idKH) references khachhang(idKH),
idHoaDon int primary key not null,
ngayMua date not null,
trangThai varchar(100)
);
insert into hoadon
values ('KH001','120001','2016-03-23','Đã thanh toán'),
('KH002','120002','2016-03-24','Đã thanh toán'),
('KH003','120003','2016-03-25','Chưa thanh toán'),
('KH004','120004','2016-12-15','Chưa thanh toán'),
('KH005','120005','2016-12-27','Đã thanh toán'),
('KH006','120006','2017-03-28','Đã thanh toán'),
('KH007','120007','2017-03-29','Chưa thanh toán'),
('KH008','120008','2020-03-30','Chưa thanh toán'),
('KH009','120009','2020-03-31','Đã thanh toán'),
('KH010','120010','2021-04-01','Đã thanh toán'),
('KH011','120011','2021-04-02','Chưa thanh toán'),
('KH012','120012','2021-04-03','Chưa thanh toán'),
('KH013','120013','2022-04-04','Đã thanh toán'),
('KH014','120014','2022-04-05','Đã thanh toán'),
('KH015','120015','2022-04-06','Đã thanh toán'),
('KH016','120016','2023-04-07','Chưa thanh toán'),
('KH017','120017','2023-04-08','Chưa thanh toán'),
('KH018','120018','2023-04-09','Chưa thanh toán'),
('KH019','120019','2023-04-10','Đã thanh toán'),
('KH020','120020','2024-01-11','Đã thanh toán');

create table chitiet_hoadon(
idHD_chiTiet int not null primary key,
fk_idHoaDon int,
foreign key(fk_idHoaDon) references hoadon(idHoaDon),
fk_idSP int,
foreign key(fk_idSP) references sanpham(idSanPham),
soLuong int
);
insert into chitiet_hoadon
values ('1','120954','3','15'),
('2','120955','1','9'),
('3','120956','2','3'),
('4','120957','4','6'),
('5','120958','3','5'),
('6','120959','5','7'),
('7','120960','7','5'),
('8','120961','9','3'),
('9','120962','10','6'),
('10','120963','12','3'),
('11','120964','14','7'),
('12','120965','12','8'),
('13','120966','11','5'),
('14','120967','12','8'),
('15','120968','13','4'),
('16','120969','15','7'),
('17','120970','2','6'),
('18','120971','14','4'),
('19','120972','6','2'),
('20','120973','16','8');