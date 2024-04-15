
use quanly_banhang;
-- Phần 1
-- câu a: Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột
select * from khachhang;

-- câu b: Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã khách hàng, họ và tên, email, số điện thoại
select idKH as 'Mã khách hàng', concat(hoVaTenLot," ",ten) as 'Họ và tên',eMail,SDT as 'SĐT' from khachhang limit 10;

-- câu c: Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm, tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
select idSanPham as 'Mã sản phẩm', tenSP as' Tên sản phẩm', ( donGia * soLuong) as 'Tiền tồn kho' from sanpham;

-- câu d: Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột: maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cộthoVaTenLot và Ten 
select idKH as 'Mã khách hàng', concat(hoVaTenLot," ",ten) as 'Họ và tên', diaChi as 'Địa chỉ' from khachhang where ten like "H%";

-- câu e: Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’
select * from khachhang where diaChi like "%Đà Nẵng";

-- câu f: Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
select tenSP as 'Tên sản phẩm' from sanpham where 100<=soLuong<=500;

-- câu g: Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng trong năm 2016
select idHoaDon as 'Mã hóa đơn' from hoadon where trangThai="Chưa thanh toán" and year(ngayMua)=2016;

-- câu h: Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003, KH006
select * from hoadon where fk_idKH in ("KH001","KH003","KH006");

 
-- Phần 2
-- câu a: Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(idKH) as 'Số lượng KH' from khachhang;

-- câu b: Hiển thị đơn giá lớn nhất trong bảng SanPham
select max(donGia) as 'Đơn giá lớn nhất' from sanpham;

-- câu c:Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select min(soLuong) as 'Đơn giá thấp nhất' from sanpham;

-- câu d: Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select sum(soLuong) as 'Tổng số lượng sản phẩm' from sanpham;

-- câu e: Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
select count(idHoaDon) as 'Mã hóa đơn' from hoadon where year(ngayMua)=2016 and month(ngayMua)=12 and trangThai="Chưa thanh toán";

-- câu f: Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
select fk_idHoaDon as 'Mã hóa đơn' , fk_idSP as 'Mã sản phẩm' from chitiet_hoadon;

-- câu g: Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select fk_idHoaDon as 'Mã hóa đơn', fk_idSP as 'Mã sản phẩm' from chitiet_hoadon where soLuong >=5;

-- câu h: Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang, maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select fk_idKH as 'Mã khách hàng', idHoaDon as 'Mã hóa đơn', ngayMua as 'Ngày mua' from hoadon order by ngayMua desc;

