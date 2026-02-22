use netflix;
-- creating customer table

create table customers(
customer_id tinyint primary key,
first_name varchar(100),
last_name varchar(100),
email varchar(60));

-- creating orders table

create table orders(
order_id tinyint primary key,
customer_id tinyint,
order_date date,
foreign key (customer_id) references customers(customer_id));

-- creating products table

create table products(
product_id tinyint primary key,
product_name varchar(100),
price int
);

-- creating order_items table

create table order_items(
order_id tinyint,
product_id tinyint,
quantity int,
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id));

select * from customers;
select * from orders;
select * from products;
select * from order_items;

-- 1 Which product has the highest price?
select product_name,price
from products
order by price desc;

-- 2 Which customer has made the most orders?

select c.first_name,c.last_name,count(os.quantity) as order_made
from customers c
join orders o
on c.customer_id=o.customer_id
join order_items os
on o.order_id=os.order_id
group by c.customer_id,c.first_name,c.last_name
order by order_made desc;

-- 3 Which product has the highest total revenue?
select p.product_name,oi.quantity,(p.price *oi.quantity) as revenue
from products p
join order_items oi
on p.product_id=oi.product_id
order by revenue desc;

-- 4. Find the top customer who have ordered the most distinct products
select c.customer_id,c.first_name,c.last_name,count(distinct oi.product_id) as distinct_products
from customers c
join orders o
on c.customer_id=o.customer_id
join order_items oi
on o.order_id=oi.order_id
group by c.customer_id,c.first_name,c.last_name
order by distinct_products desc;

-- 5. Find the first order (by date) for  customer "John Doe"
select c.first_name,c.last_name,o.order_date
from customers c
join orders o
on c.customer_id=o.customer_id
where c.first_name='John' and c.last_name='Doe';




