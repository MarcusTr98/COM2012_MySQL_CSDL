use QuanLyNhaTro
--Y3. CÁC YÊU CẦU VỀ CHỨC NĂNG
--1. Thêm thông tin vào các bảng
-- Tạo ba Stored Procedure (SP) với các tham số đầu vào phù hợp.
--Yêu cầu đối với các SP: Trong mỗi SP phải kiểm tra giá trị các tham số đầu vào. Với
--các cột không chấp nhận thuộc tính NULL, nếu các tham số đầu vào tương ứng với
--chúng không được truyền giá trị, thì không thực hiện câu lệnh chèn mà in một thông báo
--yêu cầu người dùng nhập liệu đầy đủ.
-- Với mỗi SP, viết hai lời gọi. Trong đó, một lời gọi thực hiện chèn thành công dữ liệu,
--và một lời gọi trả về thông báo lỗi cho người dùng.

--o SP thứ nhất thực hiện chèn dữ liệu vào bảng NGUOIDUNG
CREATE OR ALTER PROCEDURE sp_Chen_NGUOIDUNG @maND varchar(5),
								@tenND nvarchar(30),
								@gioiTinh bit,
								@ngaySinh date,
								@SDT char(10),
								@duong_ND nvarchar(30),
								@phuong_ND nvarchar(30),
								@quan_ND nvarchar(20),
								@email varchar(50)
AS
IF (@maND IS NOT NULL AND @tenND IS NOT NULL AND @gioiTinh IS NOT NULL AND @ngaySinh IS NOT NULL AND
	@SDT IS NOT NULL AND @duong_ND IS NOT NULL AND @phuong_ND IS NOT NULL AND @quan_ND IS NOT NULL AND
	@email IS NOT NULL)
	BEGIN
	IF EXISTS (SELECT * FROM NGUOIDUNG WHERE maND = @maND)
		BEGIN
			PRINT N'Thêm thất bại, trùng mã người dùng'
		END
	ELSE
		BEGIN
			INSERT INTO NGUOIDUNG VALUES (@maND,@tenND,@gioiTinh,@ngaySinh,@SDT,@duong_ND,@phuong_ND,@quan_ND,@email)
			PRINT N'Thêm dữ liệu thành công !'
		END
	END
ELSE PRINT N'Thêm thất bại, Bạn phải nhập liệu đầy đủ!'
GO

EXEC sp_Chen_NGUOIDUNG 'ND10',N'Khoa Hải Bình','0','1995-11-01','0356561855',N'11/39 Hào Khê',N'Cát Bi', N'Hải An', 'binhhk@gmail.com'
EXEC sp_Chen_NGUOIDUNG 'ND12',N'Khoa Hải Nam',NULL,'1999-12-01',NULL,N'Lô tái định cư',N'Cát Bi', N'Hải An', 'kakahhk@gmail.com'
EXEC sp_Chen_NGUOIDUNG 'ND11',N'Khoa Hải Nam','1','1999-12-01','0351161755',N'Lô tái định cư',N'Cát Bi', N'Hải An', 'kakahhk@gmail.com'
GO

--o SP thứ hai thực hiện chèn dữ liệu vào bảng NHATRO
CREATE OR ALTER PROCEDURE sp_Chen_NHATRO @maNhaTro varchar(5),
										@maLoaiNha varchar(5),
										@maND varchar(5),
										@dienTich float,
										@giaPhong float,
										@duong_NT nvarchar(30),
										@phuong_NT nvarchar(30),
										@quan_NT nvarchar(20),
										@moTa nvarchar(100),
										@ngayDangTin date
AS
IF (@maNhaTro IS NOT NULL AND @maLoaiNha IS NOT NULL AND @maND IS NOT NULL AND @dienTich IS NOT NULL AND
	@giaPhong IS NOT NULL AND  @duong_NT IS NOT NULL AND @phuong_NT IS NOT NULL AND @quan_NT IS NOT NULL AND
	@moTa IS NOT NULL AND @ngayDangTin  IS NOT NULL)
	BEGIN
	IF EXISTS (SELECT * FROM NhaTro WHERE maNhaTro = @maNhaTro)
		BEGIN
			PRINT N'Thêm thất bại, trùng mã NHÀ TRỌ!'
		END
	ELSE
		BEGIN
			INSERT INTO NhaTro VALUES (@maNhaTro,@maLoaiNha,@maND,@dienTich,@giaPhong,@duong_NT,
			@phuong_NT,@quan_NT,@moTa,@ngayDangTin)
			PRINT N'Thêm dữ liệu thành công !'
		END
	END
ELSE PRINT N'Thêm thất bại, Bạn phải nhập liệu đầy đủ!'
GO

EXEC sp_Chen_NHATRO'NT10','LN01','ND03',55,20000000,N'Chung cư The Minato Residence', N'Vĩnh Niệm', N'Lê Chân',N'Chung cư cao cấp, 2 phòng ngủ, full đồ','2024-03-30'
EXEC sp_Chen_NHATRO'NT11','LN01','ND04',50,NULL,N'Chung cư The Minato Residence', N'Vĩnh Niệm', NULL,N'Chung cư cao cấp, 2 phòng ngủ, full đồ','2024-04-02'
EXEC sp_Chen_NHATRO'NT11','LN01','ND04',50,21000000,N'Chung cư The Minato Residence', N'Vĩnh Niệm', N'Lê Chân',N'Chung cư cao cấp, 2 phòng ngủ, full đồ','2024-04-02'
GO
--o SP thứ ba thực hiện chèn dữ liệu vào bảng DANHGIA
CREATE OR ALTER PROCEDURE sp_Chen_DANHGIA @stt int,
										@maND varchar(5),
										@maNhaTro varchar(5),
										@like_dislike bit,
										@noiDung nvarchar(100)
AS
IF (@stt IS NOT NULL AND @maND IS NOT NULL AND @maNhaTro IS NOT NULL AND @like_dislike IS NOT NULL AND @noiDung IS NOT NULL)
	BEGIN
	IF EXISTS (SELECT * FROM DanhGia WHERE stt = @stt)
		BEGIN
			PRINT N'Thêm thất bại, trùng stt đánh giá!'
		END
	ELSE
		BEGIN
			INSERT INTO DanhGia VALUES (@stt,@maND, @maNhaTro, @like_dislike, @noiDung)
			PRINT N'Thêm dữ liệu thành công !'
		END
	END
ELSE PRINT N'Thêm thất bại, Bạn phải nhập liệu đầy đủ!'
GO

EXEC sp_Chen_DANHGIA 1,'ND07','NT01',1,N'Căn hộ rất đẹp, hài lòng!'
EXEC sp_Chen_DANHGIA 11,'ND07',NULL,1,N'Căn hộ rất đẹp, hài lòng!'
EXEC sp_Chen_DANHGIA 11,'ND07','NT01',1,N'Căn hộ rất đẹp, hài lòng!'
GO
--2. Truy vấn thông tin
--a. Viết một SP với các tham số đầu vào phù hợp. 
--SP thực hiện tìm kiếm thông tin các phòng trọ thỏa mãn điều kiện tìm kiếm theo: 
--Quận, phạm vi diện tích, phạm vi ngày đăng tin, khoảng giá tiền, loại hình nhà trọ.
--SP này trả về thông tin các phòng trọ, gồm các cột có định dạng sau:
--o Cột thứ nhất: có định dạng ‘Cho thuê phòng trọ tại’ + <Địa chỉ phòng trọ> + <Tên quận/Huyện>

--o Cột thứ hai: Hiển thị diện tích phòng trọ dưới định dạng số theo chuẩn Việt Nam + m2. Ví dụ 30,5 m2

--o Cột thứ ba: Hiển thị thông tin giá phòng dưới định dạng số theo định dạng chuẩn Việt Nam. Ví dụ 1.700.000
	SELECT LEFT(CONVERT(VARCHAR,GIAPHONG,1), LEN(CONVERT(VARCHAR,GIAPHONG,1))-3) AS giaPhong FROM NhaTro WHERE giaPhong = @GIATIEN

--o Cột thứ tư: Hiển thị thông tin mô tả của phòng trọ
--o Cột thứ năm: Hiển thị ngày đăng tin dưới định dạng chuẩn Việt Nam. Ví dụ: 27-02-2012
--o Cột thứ sáu: Hiển thị thông tin người liên hệ dưới định dạng sau:
--▪ Nếu giới tính là Nam. Hiển thị: A. + tên người liên hệ. Ví dụ A. Thắng
--▪ Nếu giới tính là Nữ. Hiển thị: C. + tên người liên hệ. Ví dụ C. Lan
--o Cột thứ bảy: Số điện thoại liên hệ
--o Cột thứ tám: Địa chỉ người liên hệ	
-- Viết hai lời gọi cho SP này
GO
CREATE OR ALTER PROCEDURE SP_TIMKIEM_NHATRO(@QUAN NVARCHAR(20), @DIENTICH_MIN FLOAT = NULL, @DIENTICH_MAX FLOAT = NULL, @NGAYDANG_MIN DATE = NULL,
											@NGAYDANG_MAX DATE = NULL,@GIATIEN_MIN FLOAT = NULL,@GIATIEN_MAX FLOAT = NULL,@TENLOAINHA NVARCHAR(30))
AS
BEGIN
	IF(@DIENTICH_MIN IS NULL)
		SELECT @DIENTICH_MIN = MIN(DIENTICH) FROM NhaTro
	IF(@DIENTICH_MAX IS NULL)
		SELECT @DIENTICH_MAX = MAX(DIENTICH) FROM NhaTro
	IF(@NGAYDANG_MAX IS NULL)
		SELECT @NGAYDANG_MAX = MAX(ngayDangTin) FROM NhaTro
	IF(@NGAYDANG_MIN IS NULL)
		SELECT @NGAYDANG_MIN = MAX(ngayDangTin) FROM NhaTro
	IF(@GIATIEN_MIN IS NULL)
		SELECT @GIATIEN_MIN = MAX(giaPhong) FROM NhaTro
	IF(@GIATIEN_MAX IS NULL)
		SELECT @GIATIEN_MAX = MAX(giaPhong) FROM NhaTro

	SELECT
		N'Cho thuê tại: '+ duong_NT+ ' ' +phuong_NT+ ' ' +quan_NT AS DIACHI_THUE
		,CONVERT(VARCHAR, dienTich)+' m2' AS DIENTICH_THUE
		,FORMAT(giaPhong, '#,##0') AS GIAPHONG
		,MOTA
		,CONVERT(VARCHAR,ngayDangTin,105) AS NGAY_DANGTIN
		,CASE GIOITINH
			WHEN 1 THEN 'A. '+tenND
			WHEN 0 THEN 'C. '+tenND
		END AS NGUOI_DANGTIN
		,SDT
		,DUONG_ND+ ' ' +phuong_ND+ ' ' +quan_ND AS DIACHI_NGUOIDANG
	FROM NhaTro T
	INNER JOIN NguoiDung D ON T.maND = D.maND
	INNER JOIN LoaiNha L ON L.maLoaiNha = T.maLoaiNha
	WHERE (quan_NT = @QUAN) AND  (L.tenLoaiNha LIKE @TENLOAINHA) AND (dienTich BETWEEN @DIENTICH_MIN AND @DIENTICH_MAX)
		AND (ngayDangTin BETWEEN @NGAYDANG_MIN AND @NGAYDANG_MAX) AND (giaPhong BETWEEN @GIATIEN_MIN AND @GIATIEN_MAX)
END
EXEC SP_TIMKIEM_NHATRO N'Hồng Bàng',NULL,NULL,'2024-03-24',NULL,10000000,20000000,N'Nhà riêng'
EXEC SP_TIMKIEM_NHATRO N'Lê Chân',NULL,NULL,'2024-03-26',NULL,1000000,15000000,N'Căn hộ trung cư'

SELECT*FROM NhaTro
SELECT*FROM LOAINHA

--b. Viết một hàm có các tham số đầu vào tương ứng với tất cả các cột của bảng
--NGUOIDUNG. Hàm này trả về mã người dùng (giá trị của cột khóa chính của bảng
--NGUOIDUNG) thỏa mãn các giá trị được truyền vào tham số.
GO
CREATE OR ALTER FUNCTION fNguoiDung
		(@tenND nvarchar(30),
		@gioiTinh bit,
		@ngaySinh date,
		@SDT char(10),
		@duong_ND nvarchar(30),
		@phuong_ND nvarchar(30),
		@quan_ND nvarchar(20),
		@email varchar(50))
RETURNS varchar(10)
AS
BEGIN
	RETURN ( SELECT maND FROM NguoiDung
						WHERE tenND = @tenND AND gioiTinh = @gioiTinh AND ngaySinh = @ngaySinh
						AND SDT = @SDT AND duong_ND = @duong_ND AND phuong_ND = @phuong_ND
						AND quan_ND = @quan_ND AND email = @email )
END 
PRINT N'Mã nhân viên cần tìm là : '+ dbo.fNguoiDung(N'Nguyễn Đăng Quang',1,'1991-02-28','0907666999',N'25 Lê Thánh Tông',N'Máy Chai',N'Ngô Quyền','quangnd01@gmail.com')
GO

--c. Viết một hàm có tham số đầu vào là mã nhà trọ (cột khóa chính của bảng
--NHATRO). Hàm này trả về tổng số LIKE và DISLIKE của nhà trọ này.
CREATE OR ALTER FUNCTION f_LuotDanhGia (@manhatro varchar(5))
RETURNS TABLE
AS
RETURN
	SELECT COUNT(*) AS SOLUONG
	, CASE like_dislike
		WHEN 0 THEN 'DISLIKE'
		WHEN 1 THEN 'LIKE' END 
	AS DANHGIA
	FROM nhaTro n
	INNER JOIN danhGia d ON n.maNhaTro = d.maNhaTro
	WHERE d.maNhaTro = @manhatro
	GROUP BY like_dislike

SELECT * FROM f_LuotDanhGia('NT07')
SELECT * FROM f_LuotDanhGia('NT02')
GO

--d. Tạo một View lưu thông tin của TOP 3 nhà trọ có số người dùng LIKE nhiều nhất gồm
--các thông tin sau:
--- Diện tích
-- Giá
-- Mô tả
-- Ngày đăng tin
-- Tên người liên hệ
-- Địa chỉ
-- Điện thoại
-- Email
CREATE OR ALTER VIEW VIEW_TOP3_NHATRO
AS
	SELECT TOP 3 dienTich, giaPhong, moTa, ngayDangTin, ND.tenND AS NGUOI_LIENHE, ND.duong_ND+ ND.phuong_ND+ ND.quan_ND AS DIACHI_NGUOI_LIENHE, ND.SDT, ND.email
	, COUNT(CASE like_dislike
		WHEN 0 THEN 0
		WHEN 1 THEN 1 END) AS LUOT_LIKE
	FROM NhaTro NT
	INNER JOIN NguoiDung ND ON ND.maND = NT.maND
	INNER JOIN DanhGia DG ON DG.maNhaTro = NT.maNhaTro
	GROUP BY dienTich, giaPhong, moTa, ngayDangTin, ND.tenND , ND.duong_ND+ ND.phuong_ND+ ND.quan_ND , ND.SDT, ND.email
	ORDER BY LUOT_LIKE DESC
GO

SELECT * FROM VIEW_TOP3_NHATRO
GO

--e. Viết một Stored Procedure nhận tham số đầu vào là mã nhà trọ (cột khóa chính của
--bảng NHATRO). SP này trả về tập kết quả gồm các thông tin sau:
-- Mã nhà trọ
-- Tên người đánh giá
-- Trạng thái LIKE hay DISLIKE
-- Nội dung đánh giá
CREATE OR ALTER PROCEDURE sp_ThongTinDanhGia @manhatro varchar(5)
AS
	SELECT DG.maNhaTro, ND.tenND AS NGUOI_DANHGIA, CASE like_dislike WHEN 0 THEN 'DISLIKE' WHEN 1 THEN 'LIKE' END AS TRANGTHAI, noiDung AS NOIDUNG_DANHGIA
	FROM NhaTro NT
	INNER JOIN DanhGia DG ON NT.maNhaTro = DG.maNhaTro
	INNER JOIN NguoiDung ND ON DG.maND = ND.maND 
	WHERE DG.maNhaTro = @manhatro

EXEC sp_ThongTinDanhGia'NT02'
GO

--CÁCH FUNCTION
CREATE OR ALTER FUNCTION f_ThongTinDanhGia (@manhatro varchar(5))
RETURNS TABLE
AS
RETURN
	SELECT DG.maNhaTro, ND.tenND AS NGUOI_DANHGIA, CASE like_dislike WHEN 0 THEN 'DISLIKE' WHEN 1 THEN 'LIKE' END AS TRANGTHAI, noiDung AS NOIDUNG_DANHGIA
	FROM NhaTro NT
	INNER JOIN DanhGia DG ON NT.maNhaTro = DG.maNhaTro
	INNER JOIN NguoiDung ND ON DG.maND = ND.maND 
	WHERE DG.maNhaTro = @manhatro
GO

SELECT * FROM dbo.f_ThongTinDanhGia('NT02')
GO
--3. Xóa thông tin
--1. Viết một SP nhận một tham số đầu vào kiểu int là số lượng DISLIKE. 
--SP này thực hiện thao tác xóa thông tin của các nhà trọ và thông tin đánh giá của chúng,
--nếu tổng số lượng DISLIKE tương ứng với nhà trọ này lớn hơn giá trị tham số được truyền vào.
--Yêu cầu: Sử dụng giao dịch trong thân SP, để đảm bảo tính toàn vẹn dữ liệu khi một thao tác xóa thực hiện không thành công.
GO
CREATE OR ALTER PROCEDURE sp_XOA_THEOLUOTDISLIKE @SL_DISLIKE INT
AS
BEGIN
      DECLARE @NhaTro_Delete TABLE (maNhaTro VARCHAR(5))

      INSERT INTO @NhaTro_Delete (maNhaTro)

      SELECT NT.maNhaTro
      FROM NhaTro NT
      INNER JOIN DanhGia DG ON DG.maNhaTro = NT.maNhaTro
      GROUP BY NT.maNhaTro
      HAVING COUNT(CASE like_dislike
                   WHEN 0 THEN 1
                   WHEN 1 THEN 0 END) > @SL_DISLIKE;

      DELETE FROM DanhGia WHERE maNhaTro IN (SELECT maNhaTro FROM @NhaTro_Delete)
      DELETE FROM NhaTro WHERE maNhaTro IN (SELECT maNhaTro FROM @NhaTro_Delete)
END
GO
EXEC sp_XOA_THEOLUOTDISLIKE 2


--2. Viết một SP nhận hai tham số đầu vào là khoảng thời gian đăng tin. 
--SP này thực hiện thao tác xóa thông tin những nhà trọ được đăng trong khoảng thời gian được truyền vào qua các tham số.
--Lưu ý: SP cũng phải thực hiện xóa thông tin đánh giá của các nhà trọ này.
--Yêu cầu: Sử dụng giao dịch trong thân SP, để đảm bảo tính toàn vẹn dữ liệu khi một thao tác
--xóa thực hiện không thành công.
GO
CREATE OR ALTER PROCEDURE sp_XOA_THEOTHOIGIAN @NGAYDANG_MIN DATE = NULL, @NGAYDANG_MAX DATE = NULL
AS
BEGIN
	IF(@NGAYDANG_MAX IS NULL)
		SELECT @NGAYDANG_MAX = MAX(ngayDangTin) FROM NhaTro
	IF(@NGAYDANG_MIN IS NULL)
		SELECT @NGAYDANG_MIN = MIN(ngayDangTin) FROM NhaTro

		DECLARE @KHOANG_THOIGIAN TABLE (maNhaTro VARCHAR(5))
		INSERT INTO @KHOANG_THOIGIAN (maNhaTro)

		SELECT maNhaTro FROM NhaTro
		WHERE ngayDangTin BETWEEN @NGAYDANG_MIN AND @NGAYDANG_MAX

		DELETE FROM DanhGia WHERE maNhaTro IN (SELECT maNhaTro FROM @KHOANG_THOIGIAN)
		DELETE FROM NhaTro WHERE maNhaTro IN (SELECT maNhaTro FROM @KHOANG_THOIGIAN)
END
GO
EXEC sp_XOA_THEOTHOIGIAN NULL,'2024-03-25'
GO