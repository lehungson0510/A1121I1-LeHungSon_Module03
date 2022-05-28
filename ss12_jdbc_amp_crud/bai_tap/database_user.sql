create database demo;
use demo;

create table if not exists  users (
id int(3) primary key auto_increment,
name varchar (120) not null,
email varchar (120) not null,
country varchar (120)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
