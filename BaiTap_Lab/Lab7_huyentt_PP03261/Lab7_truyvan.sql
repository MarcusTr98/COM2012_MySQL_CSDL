use quanly_banhang_l7;
-- Phần 1
-- b.Tạo 1 bảng có tên KhachHang_daNang chứa thông tin tin đầy đủ về các khách
-- hàng đến từ Đà Nẵng (sử dụng SELECT INTO) -> trong mySQL ko có câu lệnh select into
create table khachhang_danang as
select *
from khachhang
where diachi like '%Đà Nẵng%';

create view khachhang_danang as
select *
from khachhang
where diachi like '%Đà Nẵng%';
-- Phần 2
-- a. Cập nhật lại thông tin số điện thoại của khách hàng có mã ‘KH002’ có giá trị mới 
-- là ‘1626778898’
update khachhang
set sdt = '1626778898'
where makh = 'KH002';

-- b. Tăng số lượng mặt hàng có mã ‘3’ lên thêm ‘200’ đơn vị
update sanpham
set soluongtrongkho = soluongtrongkho+200
where masp ='3';

-- c. Giảm giá cho tất cả sản phẩm giảm 5%
update sanpham
set dongia=dongia*0.95;

-- d. Tăng số lượng của mặt hàng bán chạy nhất trong tháng 12/2016 lên 100 đơn vị 
update sanpham
set soluongtrongkho = soluongtrongkho+100
where masp = 
(select ma_sp from chitiet_hoadon c
inner join hoadon d on c.ma_hoadon = d.mahoadon
where month(d.ngaymua)= 12 and year(d.ngaymua) =2016
group by c.ma_sp
order by count(c.soluongmua) desc
limit 1);

-- e. Giảm giá 10% cho 2 sản phẩm bán ít nhất trong năm 2016
update sanpham s
set dongia = dongia*0.9
where masp =
(select ma_sp from chitiet_hoadon c
inner join hoadon d on c.ma_hoadon = d.mahoadon
where year(ngaymua)=2016
group by c.ma_sp
order by count(c.soluongmua) asc
limit 2);

update sanpham
inner join (select ma_sp from chitiet_hoadon c
inner join hoadon d on c.ma_hoadon = d.mahoadon
where year(ngaymua)=2016
group by c.ma_sp
order by count(c.soluongmua) asc
limit 2) temp on sanpham.masp = temp.ma_sp
set dongia= dongia*0.9;

-- f. Cập nhật lại trạng thái “đã thanh toán” cho hoá đơn có mã 120956 
update hoadon
set trangthai = "đã thanh toán"
where mahoadon = 120956;

-- g.  Xoá mặt hàng có mã sản phẩm là ‘2’ ra khỏi hoá đơn ‘120956’ và trạng thái là 
-- chưa thanh toán.
delete from chitiet_hoadon
where ma_hoadon = 120956 and ma_sp = 2 and ma_hoadon in
(select mahoadon from hoadon where trangthai = 'đã thanh toán');

-- h. Xoá khách hàng chưa từng mua hàng kể từ ngày “1-1-2016” 
delete from khachhang
where makh not in ( select distinct hoadon.ma_KH
from hoadon where ngaymua >= '2016-01-01');