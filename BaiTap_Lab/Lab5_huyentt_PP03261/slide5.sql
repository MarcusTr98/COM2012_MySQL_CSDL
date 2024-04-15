use quanly_duan1;
select hoNV as ' Họ của nhân viên' from nhanvien;
-- hiển thị 1 nhân viên 
select hoNV as ' Họ của nhân viên' from nhanvien where idNV= 'PP0126' ;
select hoNV + ' ' + tenNV as 'Họ và Tên' from nhanvien; -- ( chỉ đúng với SQL server )
select concat(hoNV, ' ', tenNV) as 'Họ và Tên' from nhanvien;

insert into nhanvien values ('PP0127','Nguyễn Văn','Hùng','2000-08-08','0','5000000','PB03');
select distinct hoNV from nhanvien;

-- hiển thị số hàng hoặc số % hàng đầu tiên trong bảng
select * from nhanvien limit 3;
-- hiển thị các dự án có ngày bắt đầu và ngày kết thúc sau 31-12-20223
select * from duan where ngayBD > '2023-12-31' and ngayKT > '2023-12-31' ;
-- like
select * from nhanvien where tenNV like 'An_';
select * from nhanvien where hoNV like 'N%';

select hoNV, tenNV from nhanvien where luong > 5000000;
select hoNV, tenNV from nhanvien where luong between 5000000 and 8000000;
select * from duan where ngayBD > '2023-05-01';
select * from phongban where tenPhong like 'Kế Toán';
select hoNV, tenNV, luong from nhanvien where luong < 9000000 and phgban ='PB03';

-- min max
select max(luong) from nhanvien;
select min(luong) from nhanvien;

-- hien thi tất cả thong tin nv có mức lương cao nhất ở bảng nv
select * from nhanvien where luong = (select max(luong) from nhanvien);
select * from nhanvien order by luong desc limit 1;

-- Hiển thị mức lương trung bình của các nhân viên thuộc mã phòng ‘PB001’
select avg(luong) from nhanvien where phgBan = 'PB01';

-- Tính lương trung bình của từng Phòng Ban
-- Đếm số lượng nhân viên của từng Phòng
-- Tính tổng lương công ty phải trả cho mỗi phòng ban, chỉ hiển thị nhóm nào có tổng >10000$
-- Tính tổng lương công ty phải trả cho mỗi phòng ban, chỉ nhóm hàng nào có cột lương >700$, chỉ hiển thị nhóm nào có tổng >10000$

