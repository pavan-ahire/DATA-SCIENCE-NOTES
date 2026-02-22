use classess;
## 1. String Functions
-- Problem 1: Basic String Function
-- Task: Write a SQL query to extract the first 5 characters of the CustomerName column.
select customerName, left(customerName,5) as first_5_char
from sales;

-- Problem 2: String Manipulation (Using UPPER, LOWER, and CONCAT)
-- Task: Write a query to display the CustomerName in uppercase, lowercase, and the concatenation of the CustomerName with the City.
select customerName,upper(customerName)as upperCase_name,
lower(customerName) as lowecase,
concat(customerName,"--",city) as name_city
from sales;


-- Problem 3: String Pattern Matching (LIKE)
-- Task: Write a SQL query to find all customers whose CustomerName starts with the letter "A".
select customerName
from sales
where customerName like 'A%';


## 2. DateTime Functions
-- Problem 1: Basic Date Function (YEAR, MONTH, DAY)
-- Task: Write a SQL query to extract the Year, Month, and Day from the SaleDate column.
select year(saleDate) as year,
month(saleDate) as month,
day(saleDate) as day
from sales;


-- Problem 2: Date Calculation (Using DATEDIFF)
-- Task: Write a SQL query to calculate the number of days between the SaleDate and today's date.
select curdate() as today, saledate,
datediff(curdate(),saledate) as days
from sales;

-- Problem 3: Date Formatting (Using DATE_FORMAT)
-- Task: Write a SQL query to display the SaleDate in the format "DD-MM-YYYY".
select saledate,date_format(saledate,'%d-%m-%Y')
from sales;
select * from sales;

## 3. Combining String and DateTime Functions
-- Problem 1: Concatenating Customer Name and Year of Purchase
-- Task: Write a SQL query to concatenate the CustomerName with the year of purchase.
select concat(customername,'-',year(saledate)) as custyear
from sales;

-- Problem 2: Checking for Customers Whose Names Contain a Specific String and Purchase After a Date
-- Task: Write a query to find customers whose CustomerName contains "A" and their SaleDate is after January 1, 2024.
select customerName
from sales
where customername like '%A%' and saledate > date('2024-01-01');


-- Problem 3: Format SaleDate and Check for Specific Year in CustomerName
-- Task: Write a SQL query to concatenate the CustomerName with the formatted SaleDate (in DD-MM-YYYY format), only for customers whose SaleDate is in 2023.
select concat(customerName,' ',date_format(saledate,'%d-%m-%Y')) as custyear
from sales
where year(saledate) = 2023;

-- Problem 4: String Replacement and Date Difference
-- Task: Write a SQL query to replace "Nike" with "Adidas" in the Product column and calculate the number of days since the purchase for products bought after March 2023.
select saledate,product,replace(product,'Nike','Adidas') as updated_product,
datediff(curdate(),saledate) as days_since_purchase
from sales
where saledate > date('2023-03-01');

select * from sales;

## 4. Combining 3 or More Functions
-- Problem 1: Concatenate, Change Case, and Format Date
-- Task: Write a SQL query to concatenate the uppercase CustomerName and the formatted SaleDate, separating them with a hyphen.

select concat(date_format(saledate,'%d-%m-%Y'),'>>>',upper(customername)) as f
from sales;


-- Problem 2: Extract Year and Month, Format Date, and Perform String Matching
-- Task: Write a SQL query to extract the year and month from the SaleDate, format the SaleDate in YYYY-MM-DD format, and find all customers whose CustomerName contains the letter "M".
select customerName,year(saledate) as year,
month(saledate) as month,
date_format(saledate,'%Y-%m-%d') as formated
from sales
where customerName like '%M%';

-- Problem 3: String and Date Combination in Filter Conditions
-- Task: Write a SQL query to display the CustomerName and SaleDate only for customers whose name starts with "S" and whose SaleDate is before June 2024.


-- Problem 4: Check for Specific Text in Product and Format Date
-- Task: Write a SQL query to check if the product name contains "Shoes", and format the SaleDate in MM-YYYY format.


-- Problem 5: Combine String and Date Calculations in SELECT
-- Task: Write a SQL query to concatenate the CustomerName with the number of days since purchase and the product name, but only for customers whose SaleDate is before August 2024.


