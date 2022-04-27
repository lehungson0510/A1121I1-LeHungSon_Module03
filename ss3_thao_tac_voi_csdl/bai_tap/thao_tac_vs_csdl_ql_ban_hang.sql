use bt2;

insert into customer(c_name,c_age) values
 ("Minh Quan",10),
 ("Ngoc Oanh",20),
 ("Hong Ha",50);
 -- drop table customer;
 
 insert into `order`(c_id,o_date) values 
(1,"2006-3-21"),
(2,"2006-3-23"),
(1,"2006-3-16");
-- drop table `order`;

insert into product(p_name,p_price) values
 ("May giat",3),
 ("Tu lanh",5),
 ("Dieu hoa",7),
 ("Quat",1),
 ("Bep dien",2);
 -- drop table product;
 
 insert into oder_detail(o_id,p_id,od_qty) values 
 (1,1,3),
 (1,3,7),
 (1,4,2),
 (2,1,1),
 (3,1,8),
 (2,5,4),
 (2,3,3);
 -- drop table oder_detail;

select *from customer;
select *from `order`;
select *from product;
select *from oder_detail;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id,o_date, o_total_price from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.c_name as customer, product.p_name as product from oder_detail
join `order` on oder_detail.o_id = `order`.o_id
join product on product.p_id = oder_detail.p_id
join customer on customer.c_id = `order`.c_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
-- cách 1:
select customer.c_id, customer.c_name from customer where not exists (select `order`.c_id from `order` where customer.c_id = `order`.c_id);
-- cách 2:
select customer.c_id, customer.c_name, count(`order`.c_id) as so_lan_mua from `order`
right join customer on `order`.c_id=customer.c_id
group by customer.c_id having  count(`order`.c_id) = 0;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.o_id, `order`.o_date,  sum(od_qty*p_price) as o_total_price from oder_detail
join `order` on oder_detail.o_id = `order`.o_id
join product on product.p_id = oder_detail.p_id
group by o_id;

-- drop database bt2;