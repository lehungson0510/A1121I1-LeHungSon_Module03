create database demo;

use demo;
-- drop database demo;

create table products(
id int primary key auto_increment,
product_code varchar(50),
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(50),
product_status bit
);

insert into products (product_code,product_name,product_price,product_amount,product_description,product_status) values
("a","chocolate",10000,5,"bad",0),("b","milk",9000,9,"good",0),("c","drink",12000,8,"bad",1),("d","cake",50000,1,"good",1),("e","toy",36000,30000,"bad",0);
select *from products;

create unique index index_product_code on products (product_code);
create index index_product_name_product_price on products (product_name,product_price);

explain select *from products;

create view sub_product as
select product_code,  product_name, product_price, 	product_status from products;

update sub_product 
set product_code = "aaaaabbbbbccccc"
where product_name like "cake";
select *from sub_product;

drop view sub_product;

delimiter //
create procedure products( ) 
begin
	select *from products;
end;
// delimiter ;
call products();

drop procedure products;

delimiter //
create procedure add_product( key_name varchar(50), out  ) 
begin
	insert into products (product_code,product_name,product_price,product_amount,product_description,product_status) values
("g","fish",10000,5,"bad",1);
end;
// delimiter ;
call add_products();




