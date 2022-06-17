drop database if exists on_thi;
create database if not exists on_thi;
use on_thi;
-- drop database bai_thi_module_demo;


set foreign_key_checks = 0;
set sql_safe_updates = 0;

-- drop table ground_status;
create table if not exists `status`(
status_id int primary key auto_increment,
`name` varchar(25)
);
insert into `status`(`name`) values ("Văn phòng chia sẻ"),("Văn phòng trọn gói");

-- drop table ground_type;
create table if not exists type_office(
type_office_id int primary key auto_increment,
`name` varchar(25)
); 
insert into type_office(`name`) values ("Trống"), ("Hạ tầng"), ("Đầy đủ");

-- drop table ground;
create table if not exists `ground`(
id varchar(25) primary key,
area double,
status_id int,
floors int,
type_office_id int,
`description` varchar(50),
rental_price double,
start_date date,
end_date date
);
-- constraint fk_ground_status_id foreign key (ground_status_id) references ground_status(ground_status_id) on delete cascade,
-- constraint fk_ground_type foreign key (ground_type_id) references ground_type(ground_type_id) on delete cascade
insert into `ground`(id,  area, status_id, floors, type_office_id, `description`, rental_price, start_date, end_date) values 
("ABC-12-AAA",2,1,4,1,"abc",10000000,"2022/10/10","2021/11/10"),
("ABC-13-BBB",3,2,6,2,"bcd",20000000,"2022/11/10","2021/10/10"),
("ABC-14-CCC",4,2,8,3,"hihi",30000000,"2022/12/10","2021/12/10"),
("ABC-15-DDD",5,1,15,1,"haha",2000000,"2022/09/10","2021/08/10");

-- delete from ground where ground_id = 1;