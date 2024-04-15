use quanly_nv;
insert into phongban
values ('KD01','KinhDoanh', null, null);

insert into nhanvien
values ('PP123','Tran','Ngoc','1998-02-22',null,'Hai Phong','10000000','KD01');
insert into phongban values ('MK02','Marketing', null, 'Phong mar01'),
('TN03','Training', null, null);
insert into phongban values ('SP01','Shipping', null, 'Van chuyen'),
('WH03','Warehouse', null, 'Kho');

insert into nhanvien
values ('PP579','Tran','Ngoc','1998-02-22','0','Hai Phong','10000000','TN03'),
('PP202','Nguyen','Minh','1999-09-19','1','Ha Noi','9000000','WH03'),
('PP111','Vu','Quanng','2005-11-05','1','Ninh Binh','8500000','MK02'),
('PP198','Vuong','Quoc','2004-03-08','0','Hai Phong','8800000','SP01');

insert into quanly_duan
values ('DA01', 'PP123', '2024-01-01', '2024-02-01','29','Phu'),
('DA02', 'PP579', '2024-01-04', '2024-02-05','55','Chinh'),
('DA03', 'PP198', '2024-01-08', '2024-03-08','50',null),
('DA04', 'PP111', '2024-02-22', '2024-03-22','60','Chinh'),
('DA05', 'PP202', '2024-02-09', '2024-03-10','43',null);

insert into duan
values ('DA01', 'Morning', '2024-01-01', '2024-02-01'),
('DA02', 'AfterNoon', '2024-01-04', '2024-02-05'),
('DA03', 'Night', '2024-01-08', '2024-03-08'),
('DA04', 'Sun', '2024-02-22', '2024-03-22'),
('DA05', 'Moon', '2024-02-09', '2024-03-10');

update nhanvien set Ten_NV = 'Minh' where ID_NhanVien = 'PP579';
update nhanvien set Ten_NV = 'Binh', DiaChi = 'Quang Ninh' where ID_NhanVien = 'PP111';
-- dính khóa ngoại -> xóa khóa ngoại trc
delete from phongban where ID_PHG like 'WH03';
delete from nhanvien where ID_NhanVien like 'PP202';
