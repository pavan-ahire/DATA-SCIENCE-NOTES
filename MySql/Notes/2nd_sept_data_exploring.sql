-- DAta Exploration
use classess;

-- 1. How many tables are there in this db?
show tables;

-- 2. View columns & tables structure 
describe students;

-- 3. Count no of rows in table
select count(*) as count_of_students from students;

-- 4. CHeck null values in age of students
select count(*) as student_null from students where age is null;

-- if not null, I want to check
select count(*) as student_null from students where age is not null;

-- 5. check unique values of grad-year
select distinct(grad_year) from students;

-- count of unique grad_year
select count(distinct(grad_year)) as count from students;

select * from students;
-- How many students are in each grad_year
select count(*) as pass_20 from students where grad_year = 2020;
select count(*) as pass_21 from students where grad_year = 2021;
select count(*) as pass_22 from students where grad_year = 2022;
select count(*) as pass_23 from students where grad_year = 2023;
select count(*) as pass_24 from students where grad_year = 2024;

select grad_year, count(*) from students group by grad_year;

-- 7.Statistical value (min,max,avg) of age 
select max(age) as max_age from students;
select min(age) as min_age from students;
select avg(age) as avg_age from students;

-- 8. View specific row
-- first 5
select * from students limit 15;

-- 8th row only
select * from students limit 1 offset 9;

-- range-> 25th row onwards 6 rows
select * from students limit 6 offset 24;

-- 9. View all values from students
select * from students;

-- 10. Specific columns 
