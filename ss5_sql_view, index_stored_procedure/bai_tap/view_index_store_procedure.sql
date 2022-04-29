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
select *from products;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_product_code on products (product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_product_name_product_price on products (product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select *from products;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view sub_product as
select product_code,  product_name, product_price, 	product_status from products;

-- Tiến hành sửa đổi view
update sub_product 
set product_code = "aaaaabbbbbccccc"
where product_name like "cake";
select *from sub_product;

-- Tiến hành xoá view
drop view sub_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure products( ) 
begin
	select *from products;
end;
// delimiter ;
call products();

drop procedure products;

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product(product_code varchar(50), product_name varchar(50),product_price double,product_amount int,product_description varchar(50),product_status bit) 
begin
	insert into products (product_code,product_name,product_price,product_amount,product_description,product_status) values
    (product_code,product_name,product_price,product_amount,product_description,product_status);
end;
// delimiter ;
call add_product("g","fish",10000,5,"bad",1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product(id_edit int, product_code_edit varchar(50), product_name_edit varchar(50),product_price_edit double,product_amount_edit int,product_description_edit varchar(50),product_status_edit bit) 
begin
	update products set 
    product_code = product_code_edit,
    product_name = product_name_edit,
    product_price= product_price_edit,
    product_amount = product_amount_edit,
    product_description = product_description_edit,
    product_status =product_status_edit
    where id = id_edit;
end;
// delimiter ;
call edit_product(1,"hello","bowl",5000,1,"good",0);

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product(id_delete int) 
begin
	delete from products where id = id_delete;
end;
// delimiter ;

drop procedure delete_product;
call delete_product(5);


