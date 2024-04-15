use quanly_banhang;
-- Phần I
-- a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
-- sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua 
select maHoaDon, ma_KH, trangThai, ma_SP, soLuongMua, ngayMua
from hoadon
inner join chitiet_hoadon on maHoaDon = ma_HoaDon;

-- b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
-- sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với
-- điều kiện maKhachHang = ‘KH001’ 
select maHoaDon, ma_KH, trangThai, ma_SP, soLuongMua, ngayMua
from hoadon
inner join chitiet_hoadon on maHoaDon = ma_HoaDon
where ma_KH ='KH001';

-- c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột
-- sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành tiền. 
-- Với thành tiền = donGia* soLuong  
select maHoaDon, ngayMua, tenSP, donGia, soLuongmua,
 (dongia*soluongmua) as "Thành tiền"
 from hoadon
 inner join chitiet_hoadon on maHoaDon =ma_HoaDon
 inner join sanpham on ma_sp= masp;
 
-- d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các
-- cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và
-- tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh toán.
select ten, email, sdt,
mahoadon, trangthai, (dongia*soluongmua) as 'Tổng tiền đã mua'
from khachhang
inner join hoadon on maKH = ma_KH
inner join chitiet_hoadon on ma_hoadon = mahoadon
inner join sanpham on ma_sp = masp
where trangthai = 'Chưa thanh toán';

-- e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. 
-- Chỉ hiển thị những hóa đơn có tổng số tiền >=500.000 
-- và sắp xếp theo thứ tự giảm dần của cột tổng tiền.
select mahoadon, ngaymua, (dongia*soluongmua) as 'Tổng tiền'
from hoadon
inner join chitiet_hoadon on mahoadon= ma_hoadon
inner join sanpham on maSP = ma_SP
where (dongia*soluongmua) >= 500000
order by 'Tổng tiền' desc;

-- Phần II
-- a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
select makh as 'Mã khách hàng', concat(hovadem,' ',ten) as 'Họ và tên'
from khachhang
inner join hoadon on ma_kh = makh
where ngaymua is null or ngaymua < '2016-01-01';

-- b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016
select ma_sp as 'Mã sản phẩm' , tensp as 'Tên sản phẩm', max(soluongmua) as 'Lượt mua nhiều nhất'
from sanpham
inner join chitiet_hoadon on masp = ma_sp
inner join hoadon on mahoadon = ma_hoadon
where year(ngaymua) = 2016 and month(ngaymua) = 12
group by ma_sp, tensp
order by max(soluongmua) desc
limit 1;

-- c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
select ma_kh as 'Mã khách hàng', concat(hovadem,' ',ten) as 'Họ và tên',
sum(dongia*soluongmua) as 'Tổng tiền'
from khachhang
inner join hoadon on ma_kh = makh
inner join chitiet_hoadon on mahoadon = ma_hoadon
inner join sanpham on masp = ma_sp
where year(ngaymua) = 2016
group by ma_kh, 'Họ và tên'
limit 5;

-- d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên 
-- “Samsung Galaxy S21 Ultra” trong tháng 12/2016
select makh as 'Mã khách hàng', concat(hovadem,' ',ten) as 'Họ và tên'
from khachhang
inner join hoadon on makh = ma_kh
inner join chitiet_hoadon on mahoadon = ma_hoadon
inner join sanpham on masp = ma_sp
where tensp = 'Samsung Galaxy S21 Ultra' and year(ngaymua) =2016 and month(ngaymua)=12 and diachi like '%Đà Nẵng%';

-- e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản phẩm.
select masp, tensp, count(*) as soluongmua
from sanpham
inner join chitiet_hoadon on maSP = ma_sp
group by masp, tensp
having count(*) < ( select avg(soluongmua)
from ( select maSP, count(*) as soluongmua
from chitiet_hoadon group by maSP ) as temp );
