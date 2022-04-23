create database bai_tap_1;
use bai_tap_1;
create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat date
);

create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap date
);

create table vat_tu(
ma_vtu int primary key,
ten_vtu varchar(30)
);

create table sdt(
id_sdt int primary key auto_increment,
sdt varchar(10)
);

create table nha_cc(
ma_ncc int primary key,
ten_ncc varchar(30),
dia_chi varchar(30),
id_sdt int,
--                           id_sdt int references sdt(id_sdt),: dùng khoá ngoại bằng cách này được không ta????
foreign key(id_sdt) references sdt(id_sdt)
);

create table don_dh(
so_dh int primary key auto_increment,
ngay_dh date,
ma_ncc int,
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

create table chi_tiet_phieu_xuat(
dg_xuat double,
sl_xuat int,
so_px int,
ma_vtu int,
primary key(so_px,ma_vtu),
-- foreign key(so_px) references phieu_xuat(so_px) ,
foreign key(ma_vtu)  references vat_tu(ma_vtu),
foreign key(so_px) references phieu_xuat(so_px)
);

create table chi_tiet_phieu_nhap(
dg_nhap double,
sl_nhap int,
ma_vtu int ,
so_pn int ,
primary key(ma_vtu, so_pn),
foreign key(ma_vtu) references vat_tu(ma_vtu),
foreign key(so_pn) references phieu_nhap(so_pn)
);

create table chi_tiet_don_dat_hang(
ma_vtu int,
so_dh int,
primary key(ma_vtu, so_dh),
foreign key(ma_vtu) references vat_tu(ma_vtu),
foreign key(so_dh) references don_dh(so_dh)
);

-- drop database bai_tap_1;
