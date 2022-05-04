create database if not exists furama;
.
select *from vi_tri;
select *from trinh_do;
select *from bo_phan;
select *from nhan_vien;
select *from loai_khach;
select *from khach_hang;
select *from kieu_thue;
select *from loai_dich_vu;
select *from dich_vu;
select *from dich_vu_di_kem;
select *from hop_dong;
select *from hop_dong_chi_tiet;

--  drop database furama;
--  
use furama;

create table if not exists  vi_tri(
ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45)
);
insert into vi_tri(ten_vi_tri) values("Quản lí"),  ("Nhân viên");
select *from vi_tri;

create table if not exists trinh_do(
ma_trinh_do int primary key auto_increment,
ten_trinh_do varchar(45)
);
insert into trinh_do(ten_trinh_do) values ("Trung cấp "),  ("Cao đẳng"),  ("Đại học"),  ("Sau đại học");
select *from trinh_do;

create table if not exists bo_phan(
ma_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45)
);
insert into bo_phan(ten_bo_phan) values("Sale – Marketing"),("Hành chính"),("Phục vụ"),("Quản lí");
select *from bo_phan;

create table if not exists nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values
("Nguyễn Văn An", "1970-11-07","456231786",10000000,"0901234121","annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng", 1, 3, 1),
("Lê Văn Bình", "1997-04-09", "654231234", 7000000, "0934212314", "binhlv@gmail.com", "22 Yên Bái, Đà Nẵng",1,2,2),
("Hồ Thị Yến","1995-12-12","999231723",14000000,"0412352315","thiyen@gmail.com","K234/11 Điện Biên Phủ, Gia Lai",1,3,2),
("Võ Công Toản","1980-04-04","123231365",17000000,"0374443232","toan0404@gmail.com","77 Hoàng Diệu, Quảng Trị",1,4,4),
("Nguyễn Bỉnh Phát","1999-12-09","454363232",6000000,"0902341231","phatphat@gmail.com","43 Yên Bái, Đà Nẵng",2,1,1),
("Khúc Nguyễn An Nghi","2000-11-08","964542311",7000000,"0978653213","annghi20@gmail.com","294 Nguyễn Tất Thành, Đà Nẵng",2,2,3),
("Nguyễn Hữu Hà","1993-01-01","534323231",8000000,"0941234553","nhh0101@gmail.com","4 Nguyễn Chí Thanh, Huế",2,3,2),
("Nguyễn Hà Đông","1989-09-03","234414123",9000000,"0642123111","donghanguyen@gmail.com","111 Hùng Vương, Hà Nội",2,4,4),
("Tòng Hoang","1982-09-03","256781231",6000000,"0245144444","hoangtong@gmail.com","213 Hàm Nghi, Đà Nẵng",2,4,4),
("Nguyễn Công Đạo","1994-01-08","755434343",8000000,"0988767111","nguyencongdao12@gmail.com","6 Hoà Khánh, Đồng Nai",2,3,2);
select *from nhan_vien;

create table if not exists loai_khach(
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45)
);
insert into loai_khach(ten_loai_khach) values ("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");
select *from loai_khach;

create table if not exists khach_hang(
ma_khach_hang int primary key auto_increment,
ma_loai_khach int,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);
insert into khach_hang(ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnnd,so_dien_thoai,email,dia_chi) values
(5,"Nguyễn Thị Hào",'1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng'),
(3,'Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị'),
(1,'Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh'),
(1,'Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng'),
(4,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai'),
(4,'Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng'),
(1,'Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh'),
(3,'Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum'),
(1,'Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi'),
(2,'Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng');
select *from khach_hang;

create table if not exists loai_dich_vu(
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);
insert into loai_dich_vu(ten_loai_dich_vu) values ("Villa"),("House"),("Room");
select *from loai_dich_vu;

create table if not exists kieu_thue(
ma_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45)
);
insert into kieu_thue(ten_kieu_thue) values ("theo năm"),("theo tháng"),("theo ngày"),("theo giờ");
select *from kieu_thue;

create table if not exists dich_vu(
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);
insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,ma_loai_dich_vu,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang) values
('Villa Beach Front',25000,10000000,10,3,1,'vip','Có hồ bơi',500,4),
('House Princess 01',14000,5000000,7,2,2,'vip','Có thêm bếp nướng',null,3),
('Room Twin 01',5000,1000000,2,4,3,'normal','Có tivi',null,null),
('Villa No Beach Front',22000,9000000,8,3,1,'normal','Có hồ bơi',300,3),
('House Princess 02',10000,4000000,5,3,2,'normal','Có thêm bếp nướng',null,2),
('Room Twin 02',3000,900000,2,4,3,'normal','Có tivi',null,null);
select *from dich_vu;

create table if not exists hop_dong(
ma_hop_dong int primary key auto_increment,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
constraint fk_hop_dong_khach_hang foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);
insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values
("2020-12-08","2020-12-08",0,3,1,3),
("2020-07-14","2020-07-21",200000,7,3,1),
("2021-03-15","2021-03-17",50000,3,4,2),
("2021-01-14","2021-01-18",100000,7,5,5),
("2021-07-14","2021-07-15",0,7,2,6),
("2021-06-01","2021-06-03",0,7,7,6),
("2021-09-02","2021-09-05",100000,7,4,4),
("2021-06-17","2021-06-18",150000,3,4,1),
("2020-11-19","2020-11-19",0,3,4,3),
("2021-04-12","2021-04-14",0,10,3,5),
("2021-04-25","2021-04-25",0,2,2,1),
("2021-05-25","2021-05-27",0,7,10,1);
select *from hop_dong;

create table if not exists dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar(45)
);
insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values
("Karaoke",10000,"giờ","tiện nghi,hiện tại"),
("Thuê xe máy",10000,"chiếc","hỏng 1 xe"),
("Thuê xe đạp",20000,"chiếc","tốt"),
("Buffet buổi sáng",15000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi trưa",90000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi tối",16000,"suất","đầy đủ đồ ăn, tráng miệng");
select *from dich_vu_di_kem;

create table if not exists hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key auto_increment,
ma_hop_dong int,
ma_dich_vu_di_kem int,
so_luong int,
constraint fk_hdct_hop_dong foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);
insert into hop_dong_chi_tiet(ma_hop_dong,ma_dich_vu_di_kem,so_luong) values
(2,4,5),
(2,5,8),
(2,6,15),
(3,1,1),
(3,2,11),
(1,3,1),
(1,2,2),
(12,2,2);
select *from hop_dong_chi_tiet;
--  drop database furama;
-- Câu1: Thêm mới thông tin cho các bảng

-- Câu2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select *from nhan_vien where( ho_ten rlike '^[HKT]' and char_length(ho_ten)<=15);

-- cách 2: select *from nhan_vien where( ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%') and char_length(ho_ten)<=15);
	-- "a%': truy xuất nhân viên có tên bắt đầu bằng 'a'
	-- dấu '^':  sd để khớp với phần tử đầu tiên( hoa thường như nhau)
	-- CHAR_LENGTH(): trả về độ dài của chuỗi được đo bằng ký tự .

-- Câu 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *from khach_hang where(( DATEDIFF(CURDATE(), ngay_sinh)/365) between 18 and 50) and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');
	-- '%ABCXYZ' Truy xuất những khách hàng mà địa chỉ kết thúc bằng 'ABCXYZ'
	-- curdate: trả về ngày của máy tính
	-- drop database furama;

-- Câu 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
	--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_khach_hang) as so_lan_dat_phong from khach_hang
join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
join loai_khach on loai_khach.ma_loai_khach=khach_hang.ma_loai_khach
where ten_loai_khach ="Diamond"
group by hop_dong.ma_khach_hang
order by so_lan_dat_phong;

-- Câu 5: Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau:
	-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
	-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
    
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, sum(dich_vu.chi_phi_thue+ifnull(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)) as tong_tien
from khach_hang
left join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
left join hop_dong on hop_dong.ma_khach_hang =  khach_hang.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by khach_hang.ma_khach_hang, hop_dong.ma_hop_dong
order by ma_khach_hang, ngay_lam_hop_dong;


-- Câu 6: Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 
	-- (Quý 1 là tháng 1, 2, 3).

select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
where dich_vu.ma_dich_vu not in(
select hop_dong.ma_dich_vu from hop_dong
where hop_dong.ngay_lam_hop_dong between "2021-01-01" and "2021-03-31" );

-- Câu 7: Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt 
	-- phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu, dich_vu.dien_tich,dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu 
from dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
where  dich_vu.ma_dich_vu in ( select hop_dong.ma_dich_vu from hop_dong where year(hop_dong.ngay_lam_hop_dong) = 2020
and dich_vu.ma_dich_vu not in
(select hop_dong.ma_dich_vu from hop_dong
 where year( hop_dong.ngay_lam_hop_dong) = 2021));

-- Câu 8 : Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
	-- Yêu cầu lấy họ tên trùng nhau
select khach_hang.ho_ten from khach_hang group by ho_ten having count(ma_khach_hang)>=2;
	-- Yêu cầu lấy họ tên không trùng nhau
    -- Cách 1:
select khach_hang.ho_ten from khach_hang group by ho_ten having count(ho_ten) < 2 ;
	-- Cách 2:
select khach_hang.ho_ten from khach_hang
where khach_hang.ho_ten not in (select khach_hang.ho_ten from khach_hang group by ho_ten having count(ho_ten) >= 2 );
	-- Cách 3:
    
-- Distinct thì vẫn hiện lại phần tử trùng lặp
select distinct khach_hang.ho_ten from khach_hang;

-- Câu 9: Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hop_dong.ngay_lam_hop_dong) as thang,count(ma_khach_hang) as so_luong_khach_hang from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021
group by month(hop_dong.ngay_lam_hop_dong)
order by thang;

-- Câu 10: Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc,
	-- tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, ifnull(sum(hop_dong_chi_tiet.so_luong),0) from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong.ma_hop_dong;

-- Câu 11: Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem from dich_vu_di_kem
left join hop_dong_chi_tiet  on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
left join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
where loai_khach.ten_loai_khach like "Diamond" and khach_hang.dia_chi like "%Vinh%" or khach_hang.dia_chi like "%Quảng Ngãi%";

-- Câu 12: Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc 
	-- sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hop_dong.ma_hop_dong, nhan_vien.ho_ten as ho_ten_nhan_vien, khach_hang.ho_ten as ho_ten_khach_hang, khach_hang.so_dien_thoai as sdt_khach_hang,dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, ifnull(sum(hop_dong_chi_tiet.so_luong),0) as so_luong_dich_vu_di_kem, hop_dong.tien_dat_coc
from hop_dong
left join nhan_vien on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
left join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where dich_vu.ma_dich_vu in (select hop_dong.ma_dich_vu from hop_dong where hop_dong.ngay_lam_hop_dong between "2020-10-01" and "2020-12-31"
and  dich_vu.ma_dich_vu not in (select  hop_dong.ma_dich_vu  from hop_dong where hop_dong.ngay_lam_hop_dong between "2021-01-01" and "2020-06-30"))
group by hop_dong.ma_hop_dong;

-- Câu 13: Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
	-- Cách 1
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_luong_dv_di_kem from dich_vu_di_kem
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem 
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_luong_dv_di_kem >= all (select sum(hop_dong_chi_tiet.so_luong) from hop_dong_chi_tiet
group by hop_dong_chi_tiet.ma_dich_vu_di_kem);

	-- Cách 2:
drop view if exists table_view;
create view table_view as
(
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_luong_dv_di_kem from dich_vu_di_kem
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem 
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_luong_dv_di_kem >= all (select sum(hop_dong_chi_tiet.so_luong) from hop_dong_chi_tiet
group by hop_dong_chi_tiet.so_luong)
);
select *from table_view where so_luong_dv_di_kem >= all (select so_luong_dv_di_kem  from table_view);
    
-- Câu 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
	-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem). 
select hop_dong.ma_hop_dong, loai_dich_vu.ten_loai_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem, count(hop_dong_chi_tiet.ma_dich_vu_di_kem) so_luong_dich_vu_di_kem
from dich_vu_di_kem
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
left join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem =1
order by ma_hop_dong;

-- Câu 15: Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 
	-- 3 hợp đồng từ năm 2020 đến 2021.
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, trinh_do.ten_trinh_do, bo_phan.ten_bo_phan, nhan_vien.so_dien_thoai, nhan_vien.dia_chi
from nhan_vien
join trinh_do on trinh_do.ma_trinh_do = nhan_vien.ma_trinh_do
join bo_phan on bo_phan.ma_bo_phan = nhan_vien.ma_bo_phan
join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
group by hop_dong.ma_nhan_vien
having count(hop_dong.ma_nhan_vien) <=3 ;

-- Câu 16: Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

	-- Bảng gồm những nhân viên chưa từng lập bất kì hợp đồng nào từ nănm 2019 đến 2021
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten as ho_ten_nv
from nhan_vien
where nhan_vien.ma_nhan_vien not in( select hop_dong.ma_nhan_vien from hop_dong
where hop_dong.ngay_lam_hop_dong between "2019-01-01" and "2021-12-31");

	-- Xoá những nhân viên trên
delete from nhan_vien
where nhan_vien.ma_nhan_vien not in( select hop_dong.ma_nhan_vien from hop_dong
where hop_dong.ngay_lam_hop_dong between "2019-01-01" and "2021-12-31");

-- Câu 17: Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng 
	-- với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
    
    -- Cách 1:
drop view if exists update_table;
create view update_table as
select khach_hang.ma_khach_hang, khach_hang.ho_ten,loai_khach.ma_loai_khach, loai_khach.ten_loai_khach, sum(dich_vu.chi_phi_thue+ifnull(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)) as tong_tien 
from khach_hang
left join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
left join hop_dong on hop_dong.ma_khach_hang =  khach_hang.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where year(hop_dong.ngay_lam_hop_dong ) = 2021 and khach_hang.ma_loai_khach = 2
group by hop_dong.ma_hop_dong
having tong_tien > 10000000 ;

select *from update_table;

update khach_hang
set khach_hang.ma_loai_khach = 1
where khach_hang.ma_khach_hang in (select update_table.ma_khach_hang from update_table);

select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ma_loai_khach 
from khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where khach_hang.ma_khach_hang = 10;
	
    -- Cách 2:
update khach_hang
set khach_hang.ma_loai_khach = 1
where khach_hang.ma_khach_hang in(
select *from(
select khach_hang.ma_khach_hang
from khach_hang
left join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
left join hop_dong on hop_dong.ma_khach_hang =  khach_hang.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where year(hop_dong.ngay_lam_hop_dong ) = 2021 and khach_hang.ma_loai_khach = 2
group by hop_dong.ma_hop_dong
having sum(dich_vu.chi_phi_thue+ifnull(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)) > 10000000 
) as table_update
);
-- Câu 18: Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
alter table hop_dong drop foreign key fk_hop_dong_khach_hang;
	-- Thêm khoá ngoại này KHÔNG được do ở bảng hợp đồng có các khách hàng có mã là 1 , 3 , 4 nhưng ở bảng khách hàng không còn các khách hàng có mã này nữa.
alter table hop_dong add constraint fk_hop_dong_khach_hang foreign key (ma_khach_hang) references khach_hang(ma_khach_hang);
alter table hop_dong_chi_tiet drop foreign key fk_hdct_hop_dong;
alter table hop_dong_chi_tiet add constraint fk_hdct_hop_dong  foreign key (ma_hop_dong) references hop_dong(ma_hop_dong);

delete from khach_hang
where khach_hang.ma_khach_hang in (select hop_dong.ma_khach_hang from hop_dong where year(hop_dong.ngay_lam_hop_dong) < 2021);

-- Câu 19: Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

drop view if exists update_table_dvdk;
create view update_table_dvdk as
select hop_dong_chi_tiet.ma_dich_vu_di_kem, hop_dong_chi_tiet.so_luong as so_luong_dv_di_kem, hop_dong.ngay_lam_hop_dong 
from hop_dong_chi_tiet
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2020
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having sum(so_luong_dv_di_kem) > 10 ;

select *from update_table_dvdk;

update dich_vu_di_kem
set dich_vu_di_kem.gia = dich_vu_di_kem.gia*2
where dich_vu_di_kem.ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from update_table_dvdk);

-- Câu 20: Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select nhan_vien.ma_nhan_vien as "ma",nhan_vien.ho_ten as "ho_ten",nhan_vien.email,nhan_vien.so_dien_thoai,nhan_vien.ngay_sinh,nhan_vien.dia_chi,  "nhan vien" as vi_tri from nhan_vien
group by nhan_vien.ma_nhan_vien
union all
select khach_hang.ma_khach_hang,khach_hang.ho_ten,khach_hang.email,khach_hang.so_dien_thoai,khach_hang.ngay_sinh,khach_hang.dia_chi, "khach hang" from khach_hang
group by khach_hang.ma_khach_hang;

-- Câu 21: Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
drop view if exists v_nhan_vien; 
create view v_nhan_vien as 
select *from nhan_vien
join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
where nhan_vien.dia_chi like "%Đà nẵng%"  and  date(hop_dong.ngay_lam_hop_dong) = '2019-12-12'
group by hop_dong.ma_nhan_vien
having  count(hop_dong.ma_hop_dong) > 0 ;
select *from v_nhan_vien;

-- Câu 22: Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update nhan_vien 
set nhan_vien.dia_chi = "Liên Chiểu"
where nhan_vien.ma_nhan_vien in (select v_nhan_vien.ma_nhan_vien from v_nhan_vien);

-- Câu 23: Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
drop procedure if exists sp_xoa_khach_hang
delimiter //
create procedure sp_xoa_khach_hang (id_kh_delete int)
begin 
alter table hop_dong_chi_tiet drop foreign key fk_hdct_hop_dong;
delete from khach_hang
where khach_hang.ma_khach_hang = id_kh_delete;
end;
// delimiter ;
call sp_xoa_khach_hang(2);
alter table hop_dong_chi_tiet add constraint fk_hdct_hop_dong  foreign key (ma_hop_dong) references hop_dong(ma_hop_dong);

-- Câu 24: Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
	-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
drop procedure if exists sp_them_moi_hop_dong
delimiter //
create procedure sp_them_moi_hop_dong (add_ngay_lam_hop_dong datetime,
add_ngay_ket_thuc datetime,
add_tien_dat_coc double,
add_ma_nhan_vien int,
add_ma_khach_hang int,
add_ma_dich_vu int
)
begin 
alter table hop_dong add foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
add constraint fk_hop_dong_khach_hang foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
add foreign key (ma_dich_vu) references dich_vu(ma_dich_vu);
insert into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) 
values (add_ngay_lam_hop_dong,add_ngay_ket_thuc,tien_dat_coc,add_ma_nhan_vien,add_ma_khach_hang,add_ma_dich_vu);
end;
// delimiter ;
call sp_them_moi_hop_dong("2111-12-12","2111-12-12",4000,2000,20000,30000);



