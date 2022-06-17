create database if not exists furama2;
 SET FOREIGN_KEY_CHECKS = 0;
 SET SQL_SAFE_UPDATES = 0;

-- .
 use furama2;
-- drop database furama2;

create table if not exists `position` (
position_id int primary key auto_increment,
position_name varchar(45)
);

insert into  `position`(position_name) values("Lễ tân"),  ("Phục vụ"),("Chuyên viên"),("Giám sát"),("Quản lí"),("Giám đốc");
select *from  `position`;

create table if not exists education_degree (
education_degree_id int primary key auto_increment,
education_degree_name varchar(45)
);
insert into education_degree(education_degree_name) values ("Trung cấp "),  ("Cao đẳng"),  ("Đại học"),  ("Sau đại học");
select *from education_degree;

create table if not exists division(
division_id int primary key auto_increment,
division_name varchar (45)
);
insert into division(division_name) values("Sale – Marketing"),("Hành chính"),("Phục vụ"),("Quản lí");
select *from division;

create table if not exists `role`(
role_id int primary key auto_increment,
role_name varchar(255)
);
insert into `role`(role_name) values ("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");
select *from `role`;

create table if not exists `user`(
username varchar(255) primary key,
pass_word varchar(255)
);
insert into  `user`(username,pass_word) values ("Sơn",123),("Thắng",321),("Trường",131),("Huy",122),("Thành",133);
select * from `user`;

create table if not exists user_role(
role_id int,
username varchar(255),
foreign key(role_id) references `role`(role_id),
foreign key(username) references `user`(username)
);
insert into  `user_role`(role_id,username) values (1,"Sơn"), (2,"Trường"), (3,"Huy"), (4,"Thắng"), (5,"Thành");
select * from `user_role`;

create table if not exists employee(
employee_id int primary key auto_increment,
employee_name varchar(45) not null,
employee_birthday date not null,
employee_id_card varchar(45) not null,
employee_salary double not null,
employee_phone varchar(45) not null,
employee_email varchar(45) not null,
employee_address varchar(45),
position_id int,
education_degree_id int,
division_id int,
username varchar(255),
foreign key(position_id) references `position`(position_id),
foreign key(education_degree_id) references education_degree(education_degree_id),
foreign key(division_id) references division(division_id),
foreign key(username) references `user`(username)
);
-- insert into employee(employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,division_id,username) values ("Lê Hùng Sơn", "2000-10-05","456231786",10000000,"0901234121","annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng", 1, 3, 1,"Sơn2");
-- update employee set employee_name = "Sơn", employee_birthday = "1970-11-07", employee_id_card = "123", employee_salary = 500000, employee_phone = "1000", employee_email = "son@", employee_address = "hue", position_id = 1,education_degree_id = 2,division_id = 2,username = "Thắng"  where employee_id = 1;
insert into employee(employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,division_id,username) values
("Nguyễn Văn An", "1970-11-07","456231786",10000000,"0901234121","annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng", 1, 3, 1,"Sơn"),
("Lê Văn Bình", "1997-04-09", "654231234", 7000000, "0934212314", "binhlv@gmail.com", "22 Yên Bái, Đà Nẵng",3,2,2,"Huy"),
("Hồ Thị Yến","1995-12-12","999231723",14000000,"0412352315","thiyen@gmail.com","K234/11 Điện Biên Phủ, Gia Lai",4,3,2,"Thành"),
("Võ Công Toản","1980-04-04","123231365",17000000,"0374443232","toan0404@gmail.com","77 Hoàng Diệu, Quảng Trị",2,4,4,"Thắng"),
("Nguyễn Bỉnh Phát","1999-12-09","454363232",6000000,"0902341231","phatphat@gmail.com","43 Yên Bái, Đà Nẵng",2,1,1,"Sơn"),
("Khúc Nguyễn An Nghi","2000-11-08","964542311",7000000,"0978653213","annghi20@gmail.com","294 Nguyễn Tất Thành, Đà Nẵng",3,2,3,"Sơn"),
("Nguyễn Hữu Hà","1993-01-01","534323231",8000000,"0941234553","nhh0101@gmail.com","4 Nguyễn Chí Thanh, Huế",4,3,2,"Sơn"),
("Nguyễn Hà Đông","1989-09-03","234414123",9000000,"0642123111","donghanguyen@gmail.com","111 Hùng Vương, Hà Nội",1,4,4,"Huy"),
("Tòng Hoang","1982-09-03","256781231",6000000,"0245144444","hoangtong@gmail.com","213 Hàm Nghi, Đà Nẵng",4,4,4,"Sơn"),
("Nguyễn Công Đạo","1994-01-08","755434343",8000000,"0988767111","nguyencongdao12@gmail.com","6 Hoà Khánh, Đồng Nai",3,3,2,"Trường");
select *from employee;

create table if not exists customer_type(
customer_type_id int primary key auto_increment,
customer_type_name varchar(45)
);
insert into customer_type(customer_type_name) values ("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");
select *from customer_type;

create table if not exists customer(
customer_id int primary key auto_increment,
customer_type_id int,
foreign key(customer_type_id) references customer_type(customer_type_id),
customer_name varchar(45) not null,
customer_birthday date not null,
customer_gender bit(1) not null,
customer_id_card varchar (45) not null,
customer_phone varchar (45) not null,
customer_email varchar (45),
customer_address varchar (45)
);
insert into customer(customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address) values
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
select *from customer;


create table if not exists service_type(
service_type_id int primary key auto_increment,
service_type_name varchar(45)
);
insert into service_type(service_type_name) values ("Villa"),("House"),("Room");
select *from service_type;

create table if not exists rent_type(
rent_type_id int primary key auto_increment,
rent_type_name varchar(45),
rent_type_cost double
);
insert into rent_type(rent_type_name,rent_type_cost) values ("theo năm",1000),("theo tháng",2000),("theo ngày",5000),("theo giờ",200);
select *from rent_type;

create table if not exists service(
service_id int primary key auto_increment,
service_name varchar(45) not null,
service_area double,
service_cost double not null,
service_max_people int,
rent_type_id int,
foreign key(rent_type_id) references rent_type(rent_type_id),
service_type_id int,
foreign key(service_type_id) references service_type(service_type_id),
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int
);
insert into service(service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,standard_room,description_other_convenience,pool_area,number_of_floors) values
('Villa Beach Front',25000,10000000,10,3,1,'vip','Có hồ bơi',500,4),
('House Princess 01',14000,5000000,7,2,2,'vip','Có thêm bếp nướng',null,3),
('Room Twin 01',5000,1000000,2,4,3,'normal','Có tivi',null,null),
('Villa No Beach Front',22000,9000000,8,3,1,'normal','Có hồ bơi',300,3),
('House Princess 02',10000,4000000,5,3,2,'normal','Có thêm bếp nướng',null,2),
('Room Twin 02',3000,900000,2,4,3,'normal','Có tivi',null,null);
select *from service;

create table if not exists attach_service(
attach_service_id int primary key auto_increment,
attach_service_name varchar(45) not null,
attach_service_cost double not null,
attach_service_unit varchar(45) not null,
attach_service_status varchar(45)
);
insert into attach_service(attach_service_name,attach_service_cost,attach_service_unit,attach_service_status) values
("Karaoke",10000,"giờ","tiện nghi,hiện tại"),
("Thuê xe máy",10000,"chiếc","hỏng 1 xe"),
("Thuê xe đạp",20000,"chiếc","tốt"),
("Buffet buổi sáng",15000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi trưa",90000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi tối",16000,"suất","đầy đủ đồ ăn, tráng miệng");
select *from attach_service;

create table if not exists contract(
contract_id int primary key auto_increment,
contract_start_date datetime not null,
contract_end_date datetime not null,
contract_deposit double not null,
contract_total_money double not null,
employee_id int,
constraint fk_employee_id foreign key(employee_id) references employee(employee_id)  ON DELETE CASCADE ,
customer_id int,
constraint fk_customer_id foreign key(customer_id) references customer(customer_id)  ON DELETE CASCADE ,
service_id int,
constraint fk_service_id foreign key(service_id) references service(service_id)  ON DELETE CASCADE 
);
insert into contract(contract_start_date,contract_end_date,contract_deposit,contract_total_money,employee_id,customer_id,service_id) values
("2020-12-08","2020-12-08",0,100,3,1,3),
("2020-07-14","2020-07-21",200000,200,7,3,1),
("2021-03-15","2021-03-17",50000,300,3,4,2),
("2021-01-14","2021-01-18",100000,400,7,5,5),
("2021-07-14","2021-07-15",0,500,7,2,6),
("2021-06-01","2021-06-03",0,600,7,7,6),
("2021-09-02","2021-09-05",100000,700,7,4,4),
("2021-06-17","2021-06-18",150000,800,3,4,1),
("2020-11-19","2020-11-19",0,900,3,4,3),
("2021-04-12","2021-04-14",0,100,10,3,5),
("2021-04-25","2021-04-25",0,200,2,2,1),
("2021-05-25","2021-05-27",0,300,7,10,1);
select *from contract;



create table if not exists contract_detail(
contract_detail_id int primary key auto_increment,
contract_id int,
constraint fk_contract_id foreign key(contract_id) references contract(contract_id)  ON DELETE CASCADE ,
attach_service_id int,
constraint fk_attach_service_id foreign key(attach_service_id) references attach_service(attach_service_id)  ON DELETE CASCADE ,
quantity int not null
);
insert into contract_detail(contract_id,attach_service_id,quantity) values
(2,4,5),
(2,5,8),
(2,6,15),
(3,1,1),
(3,2,11),
(1,3,1),
(1,2,2),
(12,2,2);
select *from contract_detail;

select * from customer_type;

drop trigger if exists  auto_before_create;
delimiter $$
create trigger auto_before_create 
before insert on employee
for each row
begin
--  ----------------Để không bị trùng lại primary key bảng user-------------------
if new.username not in (select username from `user`) then
insert into `user` values(new.username,'123');
end if;
end $$
delimiter ;

drop trigger if exists  auto_update_user;
delimiter $$
create trigger auto_update_user 
before update on employee
for each row
begin
--  ----------------Để không bị trùng lại primary key bảng user-------------------
if new.username not in (select username from `user`) then
insert into `user` values(new.username,'123');
end if;
end $$
delimiter ;

select * from contract;
-- update customer set customer_type_id = 5, customer_name  = "1", customer_birthday = "2000-10-05", customer_gender = 1, customer_id_card = "111",customer_phone = "111", customer_email = "111", customer_address = "111" where customer_id = 1;

select * from customer where customer_name like "%%" and customer_address like "%%" and customer_type_id like "%%";
