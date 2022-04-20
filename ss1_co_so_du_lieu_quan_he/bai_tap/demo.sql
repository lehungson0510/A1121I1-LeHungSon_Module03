-- tao databate
create database if not exists my_database;

-- su dung database nay
use my_database;

-- tao bang
create table if not exists student(
`id` int primary key auto_increment,
`name` varchar(100),
`birthday` date,
`where` varchar(200)
);

-- them moi record
insert into student(`name`,`birthday`,`where`) values ("son1","2000-10-05","Da Nang"),("son2","2000-10-05","Hue"),("son1","2000-10-05","Da Nang"),("son2","2000-10-05","Hue");

-- hien thi tat ca thong tin
select *from student;

-- xoa thong tin null;
delete from student where id is null;

-- hien thi 1 phan thong tin cua bang
select id, `name` from student;

-- xoa het, id bat dau lai tu dau
truncate student;

-- sua record
-- truoc khi update phai co dong nay
set sql_safe_updates =0;
update student set `name` ="son3", `point` = 3 where id = 1;
update student set `point` = 10 where id = 2;

-- xoa record
delete from student;
delete from student where id = 2;

-- xoa bang
drop table student;
drop database my_database;

-- them moi truong/cot cho bang
alter table student add `point` int;



