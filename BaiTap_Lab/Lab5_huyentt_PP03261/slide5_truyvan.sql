create database quanly_duan1;
use quanly_duan1;

create table nhanvien(
idNV varchar(10) not null primary key,
hoNV varchar(50),
tenNV varchar(20),
ngaySinh date,
gioiTinh boolean,
luong float,
phgBan varchar(20)
);
create table phongban(
idPhong varchar(10) not null primary key,
tenPhong varchar(50),
maTruongP varchar(10),
diaChi varchar(100)
);
create table duan(
idDA varchar(10) not null primary key,
tenDA varchar(50),
ngayBD date,
ngayKT date
);
create table quanly_duan(
id_QLDA varchar(10) not null primary key,
id_DA varchar(10) not null,
id_NV varchar(10) not null,
ngayTG date,
ngayKT date,
soGio int,
vaiTro varchar(20)
);
alter table nhanvien add constraint ten_KH
foreign key (phgBan) references phongban(idPhong);
alter table quanly_duan add constraint ten_KH1
foreign key (id_NV) references nhanvien(idNV);
alter table quanly_duan add constraint ten_KH2
foreign key (id_DA) references duan(idDA);

-- Thao tác cơ sở dữ liệu
insert into phongban
values ("PB01","Kỹ Thuật","TP01","271 Lê Thánh Tông- Hải Phòng"),
("PB02","Kế Toán","TP02","272 Lê Thánh Tông- Hải Phòng"),
("PB03","Kinh Doanh","TP03","273 Lê Thánh Tông- Hải Phòng")
;
insert into nhanvien
values ("PP0123","Nguyễn Văn", "An","2000-01-23","1","10000000","PB01"),
("PP0124","Trần Văn", "Minh","1998-09-23","1","9000000","PB02"),
("PP0125","Ngô Quynh", "Anh","1999-11-10","0","20000000","PB03"),
("PP0126","Lương Thị", "Lâm","2002-12-08","0","15000000","PB01")
;
insert into duan
values ("DA01", "Dự án nạo vét sông Lạch Tray", "2023-12-02", "2023-12-20"),
("DA02", "Cải tạo NHL Hải Phòng", "2023-02-10", "2023-10-03"),
("DA03", "Dự án xây trường FPT Hải Phòng", "2024-03-01", "2024-12-30")
;
insert into quanly_duan
values ("QL01","DA01","PP0123","2023-12-02", "2023-12-15","100","Giám Đốc"),
("QL02","DA02","PP0124","2023-02-11", "2023-10-01","20", "Nhân Viên Điều Phối"),
("QL03","DA03","PP0125","2024-03-01", "2024-12-9","300", "Kế Toán")
;
-- truy vấn cơ sở dữ liệu
select * from nhanvien where idNV = "PP0123";
select tenNV from nhanvien where idNV = "PP0124";
select id_DA, id_NV from quanly_duan where id_DA = "DA01";

select * from phongban;
select tenDA, ngayBD, ngayKT from duan;
select * from duan where ngayBD > 2023-12-31 or ngayKT > 2023-12-31;
select * from nhanvien where luong <'25000000' and year(ngaySinh) < 2000;
select * from nhanvien where luong <'25000000' and year(ngaySinh) >= 2000;
