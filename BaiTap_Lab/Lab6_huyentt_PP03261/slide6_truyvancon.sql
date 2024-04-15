use quanly_banhang;
-- thông tin của hóa đơn và khách hàng có mua sản phẩm
select k.makh, concat(hovadem,' ',ten) as 'Họ và tên KH', mahoadon, ngaymua, trangthai
from khachhang k
right outer join hoadon h on k.makh = h.ma_kh;
