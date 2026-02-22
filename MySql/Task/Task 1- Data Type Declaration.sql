-- Data Type Declaration
-- 1. create an sql query to difine a table named product for an e-commerce website,
-- with the following columns and appropriate data types to accurately represent
-- their real world attribute.

-- - product_id (unique identifier for each product)
-- - product_name (name of the product)
-- - description (detailed description of the product)
-- - price (price of the product)
-- - manufacturer (name of the company that manufactures the product)
-- - manufacture_date (date when the product was manufactured)
-- - weight (weight of the product in kilograms)
-- - available_stock (the number of units available in stock)
-- - is_featured (a boolean value indicating whether the product is featured on the website)

-- Choose the most suitable data types to accurately represent the real-world attributes of the
-- products and to optimize data storage and retrieval for an e-commerce platform.

create database assignment;

use assignment;

create table product (
product_id int unique not null primary key, 
product_name varchar(100) not null,
description varchar(100) not null,
price int not null,
manufacturer varchar(100) not null,
manufacture_date date not null,
weight double,
available_stock int not null,
is_featured bool
);

insert into product values
(1, 'Smartphone', 'Android 5G phone', 25000, 'Samsung', '2024-05-10', 0.18, 120, true),
(2, 'Laptop', '15.6 inch i5 11th Gen', 55000, 'Dell', '2024-03-15', 1.6, 80, true),
(3, 'Headphones', 'Noise cancelling wireless', 3500, 'Sony', '2024-07-22', 0.25, 200, false),
(4, 'Washing Machine', 'Front load 7kg', 28000, 'LG', '2023-11-05', 45.0, 30, true),
(5, 'Refrigerator', 'Double door 300L', 32000, 'Whirlpool', '2023-10-12', 55.0, 25, true),
(6, 'Microwave Oven', 'Convection 28L', 15000, 'Panasonic', '2024-01-25', 18.0, 40, false),
(7, 'Tablet', '10 inch Android Tablet', 20000, 'Lenovo', '2024-06-08', 0.5, 70, false),
(8, 'Camera', 'DSLR 24MP', 45000, 'Canon', '2023-12-20', 1.2, 15, true),
(9, 'Smartwatch', 'Fitness tracker waterproof', 7000, 'Amazfit', '2024-08-01', 0.08, 300, true),
(10, 'Printer', 'All-in-one wireless', 12000, 'HP', '2024-04-14', 6.0, 50, false),
(11, 'Air Conditioner', 'Split AC 1.5 Ton', 40000, 'Voltas', '2023-09-30', 60.0, 22, true),
(12, 'Mixer Grinder', '750W with 3 jars', 4500, 'Philips', '2024-02-19', 5.5, 90, false),
(13, 'Bluetooth Speaker', 'Portable waterproof', 2500, 'boAt', '2024-05-28', 0.35, 180, false),
(14, 'Television', '43 inch Smart LED TV', 38000, 'Samsung', '2024-07-05', 8.5, 33, true),
(15, 'Gaming Console', 'Latest gen console', 50000, 'Sony', '2024-03-07', 4.2, 12, true);

select * from product;

-- 2. Create an SQL query to extract the first 10 characters of the 'product_description' column for
-- all products in the 'Product' table. Ensure that the text is trimmed and does not exceed 10
-- characters.

select product_id,product_name,
left(trim(description), 10) AS short_description
from Product;



-- 3. Let say you have the date in the following column,
-- - manufacture_date - 2023-10-27.

-- Write a SQL query that extracts the month and year from the manufacture_date column and
-- formats them into a single column.

SELECT product_id,product_name,
date_format(manufacture_date, '%m-%Y') AS month_year
FROM Product;

-- 4. Write an SQL query to extract the products whose price falls within a specific range (e.g.,
-- $10 to $100). Return the product name, price, and available stock for each product within this
-- price range.

select product_name,price,available_stock
from product
where price between 10000 and 30000;

-- 5. Create an SQL query to retrieve all products from the 'Product' table that are marked as 'featured' (i.e.,
-- where the is_featured column is true). Return the product ID, product name, and price of these featured
-- products.

select product_id,product_name,price
from product
where is_featured = true;