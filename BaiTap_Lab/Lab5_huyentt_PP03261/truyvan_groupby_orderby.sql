use quanly_duan1;

select count(*) as 'Số lượng', phgBan as 'Mã phòng ban' from nhanvien group by phgban;
select phgBan as 'Mã phòng ban', count(*) as 'Số lượng'  from nhanvien group by phgban;

select luong as 'Lương NV', phgBan as 'Mã phòng ban' from nhanvien;
-- group by phgBan having max(luong)>10000000;
 
insert into nhanvien values ( 'PP0128',  'Trần Văn', 'Linh', '1999-01-01', 1, 14500000, null),
( 'PP0129',  'Lê Phương', 'Khanh', '1993-03-08', 1, 26500000, null),
( 'PP0130',  'Trần Quốc', 'Bảo', '2000-12-01', 1, 8600000, null);

insert into phongban values ('PB04','Đào tạo','TP04','123 Lê Thánh Tông - Hải Phòng'),
('PB05','Tuyển sinh','TP05','99 Lê Hồng Phong - Hải Phòng');

update nhanvien set phgban = 'PB04', phgban = 'PB04'
where idNV = 'PP0130' or idNV= 'PP0129';
update nhanvien set phgBan = 'PB05' where idNV= 'PP0128';

select max(luong) as 'Mức lương', phgBan as 'Phòng ban'
from nhanvien group by phgban;

-- tính trung bình lương
select round(avg(luong), 1) as 'Lương TB' from nhanvien;

-- tính lương TB từng phòng ban
select phgban as 'Phòng ban', avg(luong) as 'Lương TB'
from nhanvien group by phgban;
-- đếm số lượng nv từng phòng
select phgban as 'Phòng ban', count(*) as 'Số lượng NV' 
from nhanvien group by phgban;

select phgban as 'Phòng ban', sum(luong) as 'Tổng lương phải trả'
from nhanvien group by phgban having sum(luong)> 19000000;

select phgban as 'Phòng ban', sum(luong) as 'Tổng lương phải trả'
from nhanvien where luong >10000000 group by phgban having sum(luong)> 20000000;

select * from nhanvien order by idNV desc;
select * from nhanvien order by tenNV desc;

select tenDA, ngayBD, ngayKT from duan order by ngayKT desc;

-- Viết câu truy vấn hiển thị mã phòng ban (PHG) và lương trung bình tương ứng từng phòng,
-- chỉ lấy các hàng có mức lương trên 15000000,
-- chỉ hiển thị các phòng có lương trung bình > 20000000
-- và sắp xếp theo thứ tự giảm dần theo cột PHG. -> thứ tự của lương TB

select phgban as 'Mã phòng ban', avg(luong) as 'Lương TB'
from nhanvien where luong > 15000000 group by phgban having sum(luong) > 20000000
order by avg(luong) desc;

