use quanly_banhang_l7;
insert into khachhang
values ("KH001", "Nguyễn Thị", "Nga", "15 Quang Trung TP Đà Nẵng", "ngant@gmail.com", "0912345670"),
("KH002", "Trần Công", "Thành", "2234 Lê Lợi Quảng Nam", "thanhtc@gmail.com", "16109423443"),
("KH003", "Lê Hoàng", "Nam", "23 Trần Phú TP Huế", "namlt@yahoo.com", "0989354556"),
("KH004", "Vũ Ngọc", "Hiên", "37 Nguyễn Thị Thập TP Đà Nẵng", "hienvn@gmail.com", "0894545435");

insert into sanpham
values ('1','Samsung Galaxy J7 Pro là một chiếc 
smartphone phù hợp với những người yêu thích một sản phẩm pin tốt, thích hệ điều hành mới cùng những tính năng đi kèm độc quyền',
'800','6600000','Samsung Galaxy J7 Pro'),
('2','Phone 6 là một trong những smartphone được yêu thích nhất. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot"',
'500','8990000','iPhone 6 32GB'),
('3','Dell Inspiron 3467 i3 7100U/4GB/1TB/Win10/(M20NR21)','507','11290000','Laptop Dell Inspiron 3467'),
('4','Pin sạc dự phòng Polymer 5.000mAh eSaver JP85','600','200000','Pin sạc dự phòng'),
('5','Nokia 3100 phù hợp với SINH VIÊN','100','700000','Nokia 3100');

insert into hoadon
values ('KH001','120954','2016-03-23','Đã thanh toán'),
('KH002','120955','2016-02-04','Đã thanh toán'),
('KH003','120956','2016-12-07','Chưa thanh toán'),
('KH004','120957','2016-04-12','Chưa thanh toán');

insert into chitiet_hoadon
values ('1','120954','3','40'),
('2','120954','1','20'),
('3','120955','2','100'),
('4','120956','4','6'),
('5','120956','2','60'),
('6','120956','1','10'),
('7','120957','2','50');