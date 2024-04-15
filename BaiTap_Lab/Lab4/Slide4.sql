create database QuanLy_NV;
create table NhanVien(
ID_NhanVien varchar(5) not null,
Ho_NV varchar(10),
Ten_NV varchar(20),
NamSinh date,
GioiTinh boolean,
DiaChi varchar(100),
Luong int,
PHG varchar(20)
);
create table PhongBan(
ID_PHG varchar(6) not null,
TenPHG varchar(10),
Ma_TruongPhg varchar(5)
);
create table QuanLy_DuAn(
ID_DuAn varchar(6) not null,
ID_NhanVien varchar(5),
NgayThamGia date,
NgayKetThuc date,
SoGio int,
VaiTro varchar(10)
);
create table DuAn(
ID_DuAn varchar(6) not null,
Ten_DuAn varchar(15),
NgayBatDau date,
NgayKetThuc date
);
 -- Thêm, sửa, xóa.
 alter table nhanvien add column Me_NV varchar(20);
 alter table nhanvien drop Me_NV;
 
alter table nhanvien add constraint chk_luong_min check(Luong >=100);
alter table nhanvien add constraint pri_NhanVien primary key(ID_NhanVien);
alter table duan add constraint pri_DuAn primary key(ID_DuAn);
alter table phongban add constraint pri_Phg primary key(ID_PHG);
alter table quanly_duan add constraint pri_DuAn primary key(ID_DuAn);

alter table nhanvien add constraint fk_Phg foreign key(PHG) references phongban(ID_PHG);
alter table phongban add constraint fk_maTruongPhg foreign key(Ma_TruongPhg) references nhanvien(ID_NhanVien);
alter table quanly_duan add constraint fk_idNV foreign key(ID_NhanVien) references nhanvien(ID_NhanVien);
alter table duan add constraint fk_idDuAn foreign key(ID_DuAn) references quanly_duan(ID_DuAn);

alter table phongban add column MoTa varchar(50);
alter table quanly_duan add constraint chk_tgian check(SoGio >0);



