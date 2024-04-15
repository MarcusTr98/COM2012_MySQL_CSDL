use quanly_duan1;

-- hiển thị tất cả dữ liệu của 2 bảng nhanvien và vanphong
select nhanvien.idNV, hoNV, tenNV, phgBan,
phongban.tenPhong, diaChi
from nhanvien, phongban
where nhanvien.phgban = phongban.idphong;

select a.idNV, hoNV, tenNV, phgBan,
b.tenPhong, diaChi
from nhanvien a, phongban b
where a.phgban = b.idphong;

-- hiển thị dữ liệu trong 3 bảng: nhanvien, DUAN và QUANLY_DUAN
select a.idNV, concat(hoNV,' ',tenNV) as "họ và tên NV" , phgBan as "Tên phòng ban",
b.idDA, tenda, ngaybd, b.ngaykt,
c.id_qlda, sogio, vaitro
from nhanvien a, duan b, quanly_duan c
where a.idnv = c.id_nv and c.id_DA = b.idda;

-- hiển thị tất cả dữ liệu của 2 bảng nhanvien và vanphong = inner join
select idNV, concat(hoNV,' ',tenNV) as "họ và tên NV", tenphong, diachi
from phongban a
inner join nhanvien b on a.idphong = b.phgban;

-- hiển thị tt nv có lương > 10trieu thuoc phòng kthuat
select a.idnv, concat(hoNV,' ',tenNV) as "họ và tên NV", luong,
b.tenphong
from nhanvien a
inner join phongban b on a.phgban = b.idphong
where luong > 10000000 and tenphong = "Kỹ Thuật"; 

-- hiển thị dữ liệu trong 3 bảng: nhanvien, DUAN và QUANLY_DUAN = inner join
select * from nhanvien a
inner join quanly_duan c on a.idnv = c.id_nv
inner join duan b on b.idda = c.id_da;

-- hien thị tt nv làm dự án DA03 có lương >20trieu

insert into quanly_duan 
values ("QL04","DA03","PP0130","2024-03-02","2024-12-09","100","Điều phối"),
("QL05","DA03","PP0129","2024-03-02","2024-12-07","55","Vận chuyển");

select a.idnv, concat(honv, " " , tennv) as "Họ và tên NV", luong,
b.id_da, ngaytg, ngaykt, vaitro, sogio,
c.tenda
from nhanvien a
inner join quanly_duan b on a.idnv = b.id_nv
inner join duan c on b.id_da = c.idda
where luong > 20000000 and id_da ="DA03"; 




