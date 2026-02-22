## Step 1: Create a Database
-- Create a new database named ProductDB.

create database if not exists ProductDB;
use ProductDB;

/*
Step 2: Create a Table
Use the ProductDB database.
Create a table named Products with the following columns:
ProductID
ProductName
Category
Price
StockQuantity
ManufactureDate
ExpiryDate
SupplierName
Note: declare appropriate data types for each column using domain constraints.*/
 create table Products(
 ProductID tinyint  not null,
ProductName varchar(50) not null,
Category varchar(50) not null,
Price double,
StockQuantity int,
ManufactureDate date,
ExpiryDate date,
SupplierName varchar(50)
);

## Task 2: Modifying the Table with ALTER Command
## Step 1: Add a Column
-- Add a column named Description to the Products table.

alter table Products add column Description text;

## Step 2: Modify the Data Type of a Column

alter table Products modify column Price decimal(6,2);

## Step 3: Drop a Column
-- 1. Change the data type of the Category column.
alter table Products modify column Category char(15);

-- 2. Remove the ExpiryDate column from the Products table.
alter table Products drop column ExpiryDate;

-- Step 4: Add a Constraint
-- Add a unique constraint to the ProductName column.
ALTER TABLE Products
ADD CONSTRAINT unique_productname UNIQUE (ProductName);


-- Step 5: Drop a Constraint
-- Remove the unique constraint from the ProductName column.

ALTER TABLE Products
DROP INDEX unique_productname;


-- Step 6: Change the Column Name
-- Rename the Price column to ProductPrice.

alter table Products change column Price ProductPrice decimal;

-- Step 7:
-- Insert 10 rows in table using all forms
-- 1
insert into Products values(1, 'Laptop', 'Electronics', 55000.50, 10, '2024-05-01', '2027-05-01', 'Dell India');

-- 2
INSERT INTO Products (ProductID, ProductName, Category, productPrice, StockQuantity, ManufactureDate, ExpiryDate, SupplierName) 
VALUES 
(2, 'Smartphone', 'Electronics', 25000.00, 20, '2024-06-10', '2026-06-10', 'Samsung');

-- 3
INSERT INTO Products (ProductID, ProductName, Category, productPrice, StockQuantity, ManufactureDate, ExpiryDate, SupplierName) 
VALUES 
(3, 'Washing Machine', 'Electronics', 18000.00, 5, '2024-04-15', '2029-04-15', 'LG'),
(4, 'Refrigerator', 'Electronics', 32000.00, 8, '2024-03-10', '2029-03-10', 'Whirlpool'),
(5, 'Office Chair', 'Furniture', 4500.00, 25, '2024-02-05', NULL, 'Godrej'),
(6, 'Notebook', 'Stationery', 50.00, 500, '2025-01-01', NULL, 'Classmate'),
(7, 'LED TV', 'Electronics', 40000.00, 6, '2024-06-12', '2029-06-12', 'Samsung'),
(8, 'Rice Bag 25kg', 'Grocery', 1200.00, 100, '2025-08-01', '2026-08-01', 'India Gate'),
(9, 'Shoes', 'Footwear', 2500.00, 40, '2025-02-10', NULL, 'Nike'),
(10, 'Water Bottle', 'Household', 150.00, 150, '2025-03-20', NULL, 'Milton');


set sql_safe_updates=0;

-- Use update command
UPDATE Products 
SET ProductPrice = 1350.00, StockQuantity = 90 
WHERE ProductID = 8;

-- Use Delete command
delete from Products where ProductID=10;

