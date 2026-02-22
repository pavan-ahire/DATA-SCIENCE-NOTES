create database ecommercedb;
use ecommercedb;

create table customers(
customer_id tinyint auto_increment primary key not null,
first_name varchar(100) not null,
last_name varchar(100) not null,
email varchar(100) unique not null
);

create table order_item(
order_id smallint,
product_id smallint,
quantity smallint,
foreign key (order_id) references orders(order_id)
on update cascade on delete cascade,
foreign key (product_id) references product(product_id)
on update cascade on delete cascade
);

create table orders(
order_id smallint primary key,
customer_id tinyint auto_increment not null,
order_date date,
foreign key (customer_id) references customers(customer_id)
on update cascade on delete cascade
);

create table product(
product_id smallint primary key,
product_name varchar(100),
price decimal
);

select * from customers;
select * from order_item ;
select * from orders;
select * from product;

drop table order_item;

select product_name,price
from product
order by price desc;

select c.first_name,c.last_name,count(os.quantity) as order_made
from customers c
join orders o
on c.customer_id=o.customer_id
join order_item os
on o.order_id=os.order_id
group by c.customer_id,c.first_name,c.last_name
order by order_made desc;

select p.product_name,oi.quantity,(p.price *oi.quantity) as revenue
from product p
join order_item oi
on p.product_id=oi.product_id
order by revenue desc;


select c.customer_id,c.first_name,c.last_name,count(distinct oi.product_id) as distinct_products
from customers c
join orders o
on c.customer_id=o.customer_id
join order_item oi
on o.order_id=oi.order_id
group by c.customer_id,c.first_name,c.last_name
order by distinct_products desc;