use quanly_duan1;
-- hiển thị tb lương của bảng nv
select avg(luong) as 'Lương trung bình'
from nhanvien;

-- hiển thị Lương > hơn lương TB bảng nv
select luong as 'Lương > hơn lương TB'
from nhanvien
where luong > (select avg(luong) as 'Lương trung bình'
from nhanvien);

-- 
select idphong from phongban
where tenphong like '%Kế Toán%';
                
select * from nhanvien
where phgban in ( select idphong from phongban
where tenphong like '%Kế Toán%');
		
select idnv, concat(honv,' ', tennv) as 'Họ và tên', luong, gioitinh, ngaysinh, idphong 
from phongban
inner join nhanvien on phgban = idphong
where tenphong like '%Kế Toán%';

select luong
from nhanvien
where phgban like 'PB02';

select * from nhanvien
where luong>any (select luong
from nhanvien
where phgban like 'PB02');

SELECT n1.*
FROM nhanvien n1
JOIN nhanvien n2 ON n1.luong > n2.luong
WHERE n2.phgban LIKE 'PB02';