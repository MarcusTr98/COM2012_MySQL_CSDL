
CREATE DATABASE LAB4_QuanLyBDS;

CREATE TABLE VANPHONG(
	idVanPhong int primary key not null,
    DiaChi varchar(50) not null,
    TenVP varchar(15)
);
CREATE TABLE NHANVIEN(
	idNhanVien varchar(8) primary key not null,
    TenNV varchar(15) not null,
    NgaySinh date,
    ChucVu varchar(10),
    SoLuongNT int,
    Luong double,
    fk_idVanPhong int references vanphong(idVanPhong)
);
CREATE TABLE CHITIET_VP(
    fk_idVanPhong int references vanphong(idVanPhong),
	idTruonggPhong varchar(8) references nhanvien(idNhanVien)
);
CREATE TABLE NGUOITHAN(
	CCCD int primary key not null,
    TenNguoiThan varchar(20) not null,
    NgaySinh date,
    MoiQH varchar(5),
    fk_idNhanVien varchar(8) references nhanvien(idNhanVien)
);
CREATE TABLE SANPHAMBDS(
	idBDS int primary key not null,
    DiaChi varchar(20) not null, 
    Huong varchar(5),
    DienTich double not null,
    GiaBan double not null,
    fk_idVanPhong int references VANPHONG(idVanPhong)
);
CREATE TABLE CHUSOHUU(
	CCCD_CSH int primary key,
    Ten_CSH varchar(20) not null,
    SoDT varchar(10) not null,
    DiaChi varchar(20) not null
);
CREATE TABLE CHITIET_BDS(
	fk_CCCD_CSH int references CHUSOHUU(CCCD_CSH),
	fk_idBDS int references SANPHAMBDS(idBDS)
);

-- Thêm các thuộc tính, ràng buộc
alter table nhanvien add constraint fk_Phg foreign key(fk_idVanPhong) references vanphong(idVanPhong);

alter table chitiet_vp add constraint fk_VP foreign key(fk_idVanPhong) references vanphong(idVanPhong);
alter table chitiet_vp add constraint fk_TruongPhg foreign key(idTruonggPhong) references nhanvien(idNhanVien);

alter table nguoithan add constraint fk_NV foreign key(fk_idNhanVien) references nhanvien(idNhanVien);

alter table sanphambds add constraint fk_VPhg foreign key(fk_idVanPhong) references vanphong(idVanPhong);

alter table chitiet_bds add constraint fk_CSH foreign key(fk_CCCD_CSH) references chusohuu(CCCD_CSH);
alter table chitiet_bds add constraint fk_BDS foreign key(fk_idBDS) references sanphambds(idBDS);

alter table nhanvien add column CMND int not null;
alter table nhanvien add constraint u_cmnd unique (CMND);
alter table sanphambds add constraint min_gia check(GiaBan>0);
alter table nhanvien add constraint min_luong check(Luong>0);
alter table nhanvien add column Me_NV varchar(20);
alter table nhanvien drop column Me_NV;




