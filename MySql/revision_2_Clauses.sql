## Basic SQL Queries (Single Clause)
use classess;
-- 1. List all distinct cities from the Sales table.
select * from sales;
select distinct city
from sales;

-- 2. Display the names of customers who purchased a 'Kurti'.
select customerName,product
from sales
where product='Kurti';

-- 3. Find the total number of transactions made using the 'Wallet' payment method.
select count(*),paymentMethod
from sales
where paymentMethod = 'wallet';

-- 4. Show the details of the sale with the highest price.
select * 
from sales
order by price desc limit 1;

## Intermediate Queries (2–3 Clauses)

-- 1. List the top 5 highest discounted transactions.
select * 
from sales
order by discountpercent desc 
limit 5;

-- 2. Find total quantity sold for each product category.
select category,sum(quantity)
from sales
group by category;

-- 3. Show the average discount for each city where the average discount is more than 25%.
 
 select city, avg(discountpercent) as avg_dis_each_city
from sales
group by city
having  avg_dis_each_city > 25;

## Complex Queries (Filtering + Multiple Clauses + Functions)

-- 1. Find all customers who bought products in June or July 2024 and used 'Card' as a payment method.
select *
from sales 
where (year(saledate)='2024' and (month(saledate)='06' or month(saledate)='07'))
and paymentmethod='card';

-- 2. List the top 3 cities with the highest total sales value after discount.
select city, sum(price * quantity * (1- discountpercent/100)) as after_discount
from sales
group by city
order by after_discount desc
limit 3 ;

-- 3. Show all sales where the effective sale amount after discount exceeds ₹50,000.
select *,price * quantity * (1- discountpercent/100) as final_amount
from sales
where (price * quantity * (1- discountpercent/100)) > 50000;

-- 4. List customers whose email domain is example.org.


-- 5. Show monthly total sales (after discount) for 2024


-- 6. Get the most frequently purchased product in each city.


