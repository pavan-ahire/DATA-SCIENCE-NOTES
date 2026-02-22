select * from sales;

/*1. Find all sales of ELectronics products where rthe discout is 
greater than 20%, price is more than 40,000 and the purchase made in 2023*/

select *
from sales
where category = 'Electronics'
and DiscountPercent > 20
and price > 40000
and year(saleDate) = 2023;

/*Get sale of the city where the city is either Banglore or Hyd
and payment is not COD and discount is 10 to 30 percent*/

select *
from sales
where city in ('Bangalore','Hyderabad')
and paymentMethod not in ('COD')
and discountpercent between 10 and 30;

/*Find transaction where customers email has 'example.net' and 
had purchase fashion item & got discount atleast 25%*/

select *
from sales
where CustomerEmail like '%example.net'
and category ='Fashion'
and discountpercent >= 25;

/*Get the average price of product sold in each city where 
at least 5 transaction took place*/

select city ,avg(price) as avgprice
from sales
where price group by city 
having count(*) >= 5;

/*find the names of customers who purchased 
products containing 'Laptop' or 'phone' and 
paid using UPI*/

select CustomerName,Product,PaymentMethod
from sales
where (product like '%laptop%' or Product like '%phone%');

/*Find most popular category in terms of no of orders, 
but only for 2023 transaction*/

select Category,count(*) as ordercount
from sales
where year(SaleDate) = 2023
group by category 
order by ordercount desc
limit 1;

/*names of customers who bought more than 2 items & spent over 
20,000 in one order */

select CustomerName,Quantity, (quantity * price) as totalordervalue
from sales
where quantity > 2
and (quantity * price) > 20000;

-- show all sales made using upi , wallet and netbanking
select *
from sales
where paymentmethod in ('upi','wallet','netbanking');

-- find all customer whos address contain word 'street'
select*
from sales
where deliveryaddress like '%street%';

-- customer who never made payment using cod
select *
from sales
where paymentmethod not in ('cod');

## Discount analysis

-- avg discount in each product
select * from sales;

select Product,avg(DiscountPercent) as discount_avg_each_product
from sales
group by product
order by discount_avg_each_product desc
limit 1;
