create database  quan_li_diem_thi;

use quan_li_diem_thi;
create table if not exists hoc_sinh(
ma_hs varchar(20) primary key,
ten_hs varchar(30),
ngay_sinh datetime,
lop varchar (30),
gt varchar(30)
);

create table if not exists mon_hoc(
ma_mh varchar(30) primary key,
ten_mh varchar(30)
);

create table if not exists bang_diem(
ma_hs varchar(30),
foreign key(ma_hs) references hoc_sinh(ma_hs),
ma_mh varchar(30),
foreign key (ma_mh) references mon_hoc(ma_mh), 
diem_thi int,
primary key (ma_hs, ma_mh)
);

create  table if not exists giao_vien(
ma_gv varchar(30) primary key,
ten_gv varchar(30),
sdt varchar(10)
);

alter table mon_hoc add ma_gv varchar(30);
alter table mon_hoc add foreign key (ma_gv) references giao_vien(ma_gv);

-- drop database quan_li_diem_thi;