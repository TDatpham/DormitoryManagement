create database QLKTX
go 
use QLKTX
go
create table KTX
( 
So_nha varchar(5) not null primary key,
So_luongp int,
Ma_ql varchar(10) not null,
);
-- Tạo bảng PHONG
create table PHONG
(
Ma_phong VARCHAR(10) not null primary key,
So_luongng int,
So_nha varchar(5)
foreign key (So_nha) references KTX(So_nha),
);
--Tạo bảng NHANVIEN
create table NHANVIEN
(Ma_nv varchar(10) not null primary key,
Ten_nv nvarchar(50),
Gioi_tinh nvarchar(5),
Ngay_sinh date,
Chuc_vu nvarchar(30),
Dc_nv nvarchar (30),
Sđt char(11),
So_nha varchar(5),
foreign key (So_nha) references KTX(So_nha)
);
--Tạo bảng SINHVIEN
create table SINHVIEN
(
Ma_sv VARCHAR(10) not null primary key,
Ten_sv nvarchar(50),
Gioi_tinh nvarchar(5),
Ngay_sinh date,
Dia_chi nvarchar(50),
Ma_phong VARCHAR(10),
foreign key (Ma_phong) references PHONG(Ma_phong),
);
--Tạo bảng VIPHAM
create table VIPHAM
(
Ma_vp varchar(15) not null primary key,
Li_do nvarchar(100),
Ht_phat nvarchar(100),
Ngay_vp date,
Ma_sv VARCHAR(10),
foreign key (Ma_sv) references SINHVIEN(Ma_sv),
);
--Tạo bảng HOPDONG
create table HOPDONG
(
Ma_hd varchar(10) not null primary key,
Ngay_ki date,
Gia_han int,
Tien_nop int,
Ma_sv VARCHAR(10),
foreign key (Ma_sv) references SINHVIEN(Ma_sv),
);

-- Chèn dữ liệu vào bảng KTX
insert into KTX
values 
('K01',50,'NV01'),
('K02',50,'NV02'),
('K03',100,'NV03');


-- Chèn dữ liệu vào bảng PHONG
insert into PHONG
values 
('1P01',10,'K01'),
('2P02',10,'K02'),
('3P03',10,'K03'),
('3P04',10,'K03'),
('3P05',10,'K03'),
('3P06',10,'K03'),
('3P07',10,'K03'),
('3P08',10,'K03'),
('3P09',10,'K03'),
('1P10',10,'K01'),
('1P11',10,'K01'),
('3P12',10,'K03'),
('2P13',10,'K02'),
('2P14',10,'K02'),
('2P15',10,'K02');

-- Chèn dữ liệu vào bảng NHANVIEN
insert into NHANVIEN
values 
('NV01',N'NGUYỄN VĂN TUẤN',N'Nam','1/1/1966', N'QUẢN LÝ', N'HÀ NỘI','09898329989', 'K01'),
('NV02',N'NGUYỄN VĂN HÒA',N'Nam','1/1/1966', N'QUẢN LÝ', N'HÀ NỘI','0338938938', 'K02'),
('NV03',N'NGUYỄN VĂN THANH',N'Nữ','1/1/1976', N'QUẢN LÝ', N'HÀ NỘI','0383378378', 'K03'),
('NV04',N'NGUYỄN THẾ YÊN',N'Nam','1/1/1966', N'NHÂN VIÊN', N'HÀ NỘI','0374783783', 'K01'),
('NV05',N'NGUYỄN THỊ HOA',N'Nữ','1/1/1986', N'NHÂN VIÊN', N'HÀ NỘI','022627627', 'K02'),
('NV06',N'NGUYỄN THỊ BƯỞI',N'Nam','1/1/1986', N'NHÂN VIÊN', N'HÀ NỘI','0222762767', 'K02'),
('NV07',N'NGUYỄN VĂN TUẤN',N'Nữ','1/1/1969', N'NHÂN VIÊN', N'HÀ NỘI','0878787878', 'K02'),
('NV08',N'NGUYỄN HÀ ANH',N'Nam','1/1/1976', N'NHÂN VIÊN', N'HÀ NỘI','001212121', 'K03'),
('NV09',N'TRẦN VĂN TUẤN',N'Nam','1/1/1969', N'NHÂN VIÊN', N'HÀ NỘI','09627672622', 'K01'),
('NV10',N'VỸ VĂN TÀI',N'Nam','1/1/1996', N'NHÂN VIÊN', N'HÀ NỘI','09445454545', 'K03');
alter table KTX
add constraint fk_qlktx foreign key (Ma_ql) references NHANVIEN(Ma_nv) 

-- Chèn dữ liệu vào bảng SINHVIEN
insert into SINHVIEN
values 
('SV01',N'NGUYỄN VĂN TUẤN',N'Nữ','1/1/2000', N'HÀ NỘI', '1P01'),
('SV02',N'NGUYỄN VĂN HÒA', N'Nữ','1/1/2003', N'SÓC TRĂNG','2P02'),
('SV03',N'NGUYỄN VĂN THANH',N'Nam','1/1/2002', N'AN GIANG','3P03'),
('SV04',N'NGUYỄN THẾ YÊN',N'Nữ','1/1/2001', N'ĐÀ NẴNG', '1P01'),
('SV05',N'NGUYỄN THỊ HOA',N'Nữ','1/1/2000', N'BÌNH THUẬN', '2P02'),
('SV06',N'NGUYỄN THỊ BƯỞI',N'Nữ','1/1/2003', N'LÀO CAI', '2P02'),
('SV07',N'NGUYỄN VĂN TUẤN',N'Nữ','1/1/2002', N'CẦN THƠ', '2P02'),
('SV08',N'NGUYỄN HÀ ANH',N'Nam','1/1/2002', N'HỒ CHÍ MINH', '3P03'),
('SV09',N'TRẦN VĂN TUẤN',N'Nữ','1/1/2000', N'HẢI DƯƠNG','1P01'),
('SV10',N'VỸ VĂN TÀI',N'Nữ','1/1/2000', N'HÀ NAM', '3P06');

-- Chèn dữ liệu vào bảng VIPHAM
insert into VIPHAM
values 
('V01',N'NẤU ĂN TRÁI PHÉP', N'LẬP BIÊN BẢN', '2/2/2022', 'SV01'),
('V02',N'VỆ SINH BẨN', N'CẢNH CÁO','3/2/2022', 'SV02'),
('V03',N'MẤT TRẬT TỰ', N'CẢNH CÁO','4/2/2022', 'SV03'),
('V04',N'VỆ SINH KHÔNG SẠCH', N'CẢNH CÁO', '4/3/2022', 'SV01'),
('V05',N'MẤT TRẬT TỰ', N'CẢNH CÁO','4/3/2022', 'SV05'),
('V06',N'MẤT TRẬT TƯ', N'CẢNH CÁO','4/5/2022', 'SV06'),
('V07',N'VỀ MUỘN', N'CẢNH CÁO','4/7/2022', 'SV09'),
('V08',N'VỀ MUỘN', N'CẢNH CÁO','4/20/2022', 'SV03'),
('V09',N'SỬ DỤNG RƯỢU BIA', N'LẬP BIÊN BẢN','4/24/2022', 'SV01');

-- Chèn dữ liệu vào bảng HOPDONG
insert into HOPDONG
values 
('V01','2/2/2022','1',750,'SV01'),
('V02','3/2/2022', '2',1500,'SV02'),
('V03','4/2/2022', '1',750,'SV03'),
('V04', '4/3/2022', '1',750,'SV01'),
('V05','4/3/2022','1', 750,'SV05'),
('V06','4/5/2022','1', 750,'SV06'),
('V07','4/7/2022','1', 750,'SV09');
insert into HOPDONG
values
('V08','4/7/2022','1', 750,'SV08');

select sum( tien_nop) as Tong_tienp_3P03
from HOPDONG, SINHVIEN
where HOPDONG.Ma_sv = SINHVIEN.Ma_sv and Ma_phong = '3P03'

select sinhvien.Ma_sv,Ten_sv, Dia_chi,Ma_phong,Ma_hd,Ngay_ki, Gia_han, Tien_nop
from sinhvien, hopdong
where SINHVIEN.Ma_sv = HOPDONG.Ma_sv and Ngay_ki ='4/3/2022';

select count(nhanvien.Ma_nv) as So_luong , Chuc_vu
from NHANVIEN
where so_nha ='K01'
group by chuc_vu;

select count(ma_sv) as sl_sv, Ngay_ki
from HOPDONG
where Ngay_ki ='4/3/2022'
group by ngay_ki;



