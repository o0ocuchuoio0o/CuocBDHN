use ems_enterprise
go
declare @Ma_Tinh int;
Set @Ma_Tinh=100000; ---Thay doan Ma_Tinh bang (Ha Noi: 100000, DN:550000 , HCM: 700000)


delete dich_vu where ma_dich_vu='ECC';
insert into dich_vu (Ma_Dich_Vu,Ten_Dich_Vu,Phan_Loai,Paypost,Nhat_An) values('ECC',N'EMS Cây Cảnh',0,0,'nhatan.gif');

delete tham_so_tinh_cuoc where ma_dich_vu='ECC';
insert tham_so_tinh_cuoc (
Tu_Ngay,
Den_Ngay,
Phan_Loai_DV,
Ma_Dich_Vu,
Toan_quoc,
Ma_BC_Chap_nhan,
Ma_BC_Phat_tra,
Cuoc_CD,
He_So_Cuoc_CD,
Cuoc_Chinh,
Bang_Cuoc,
Ma_KH,
Ko_tinh_quay_dau,
He_So_Cuoc_Chinh,
Theo_bang_cuoc,
Thu_ho,
Gia_von,
Cong_phat_1,
Cong_phat_2,
Trong_Nuoc,
isLo,
isPPXD,
isPPVX,
Dv_Loai_Tru,
Khoi_Luong_Max
)
values
(
20171201,
99991231,
0,
'ECC',
1,
0,
0,
0,
1,
1,
1,
'',
0,
1,
1,
0,
0,
0,
0,
1,
0,
0,
0,
'',
0
);

declare @Id_Tinh_Cuoc int;
select @Id_Tinh_Cuoc=Id_Tinh_Cuoc from tham_so_tinh_cuoc where ma_dich_vu='ECC';
delete tham_so_phu_tro_tinh_cuoc where ma_dich_vu='ECC';
--1. Noi_Tinh (Vung1)
insert into 
tham_so_phu_tro_tinh_cuoc 
(
	Ma_Dich_Vu,
	Don_Vi_Tinh,
	Cach_Tinh,
	Den_Nac,
	Muc_Cuoc,
	Cuoc_Toi_Thieu,
	Phan_Tram_Cuoc,
	Ma_Tinh_Nhan,
	Ma_Tinh_Tra,
	Id_Tinh_Cuoc,
	Ma_KH
)
select 
	'ECC',
	0,
	0,
	1000,
	0,
	0,
	0,
	@Ma_Tinh,
	@Ma_Tinh,
	@Id_Tinh_Cuoc,
	''
from khu_vuc_tn where khu_vuc in (1) and tinh_chap_nhan=@Ma_Tinh and tinh_phat_tra=@Ma_Tinh;

insert into 
tham_so_phu_tro_tinh_cuoc 
(
	Ma_Dich_Vu,
	Don_Vi_Tinh,
	Cach_Tinh,
	Den_Nac,
	Muc_Cuoc,
	Cuoc_Toi_Thieu,
	Phan_Tram_Cuoc,
	Ma_Tinh_Nhan,
	Ma_Tinh_Tra,
	Id_Tinh_Cuoc,
	Ma_KH
)
select 
	'ECC',
	0,
	1,
	1000,
	0,
	0,
	0,
	@Ma_Tinh,
	@Ma_Tinh,
	@Id_Tinh_Cuoc,
	''
from khu_vuc_tn where khu_vuc in (1) and tinh_chap_nhan=@Ma_Tinh and tinh_phat_tra=@Ma_Tinh;


-------------

--1. Lien Tinh (Vung 2, 3)
insert into 
tham_so_phu_tro_tinh_cuoc 
(
	Ma_Dich_Vu,
	Don_Vi_Tinh,
	Cach_Tinh,
	Den_Nac,
	Muc_Cuoc,
	Cuoc_Toi_Thieu,
	Phan_Tram_Cuoc,
	Ma_Tinh_Nhan,
	Ma_Tinh_Tra,
	Id_Tinh_Cuoc,
	Ma_KH
)
select 
	'ECC',
	0,
	0,
	1000,
	7000,
	7000,
	0,
	@Ma_Tinh,
	Tinh_Phat_Tra,
	@Id_Tinh_Cuoc,
	''
from khu_vuc_tn where khu_vuc in (2,3,4,22) and tinh_chap_nhan=@Ma_Tinh;

insert into 
tham_so_phu_tro_tinh_cuoc 
(
	Ma_Dich_Vu,
	Don_Vi_Tinh,
	Cach_Tinh,
	Den_Nac,
	Muc_Cuoc,
	Cuoc_Toi_Thieu,
	Phan_Tram_Cuoc,
	Ma_Tinh_Nhan,
	Ma_Tinh_Tra,
	Id_Tinh_Cuoc,
	Ma_KH
)
select 
	'ECC',
	0,
	1,
	1000,
	7000,
	7000,
	0,
	@Ma_Tinh,
	Tinh_Phat_Tra,
	@Id_Tinh_Cuoc,
	''
from khu_vuc_tn where khu_vuc in (2,3,4,22) and tinh_chap_nhan=@Ma_Tinh;

go