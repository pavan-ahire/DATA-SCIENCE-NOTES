## SELECT , FROM AND WHERE 
use learndb;
select title,length(title) as title_length
from books 
where AuthorId in (1,5);

-- method 1
select FIRST_NAME 
from myemp
where FIRST_NAME like 'a%' or FIRST_NAME like 'e%' or FIRST_NAME like 'i%' or FIRST_NAME like 'o%'
or FIRST_NAME like 'u%';

-- method 2
select FIRST_NAME 
from myemp
where  left(FIRST_NAME,1) in ('a','e','i','o','u');



## GROUP BY
select * from books;

-- find how many books are written by author

select authorid,count(*) as book_count
from books
group by authorid;

-- use myemp table and find the avg salary of emp wrt dep_id
select * from myemp;

select dep_id,avg(salary) as avg_salary
from myemp
group by dep_id;

-- use the peopledata 
-- find the avg purchase amount of subscribed customer grouped by gender

select * from peopledata;
select gender,avg(purchase_amount) as avg_purchase_amount
from peopledata
where is_subscribed =1
group by gender;

## HAVING

-- how many books written  by auther, show book count equal to 3
select authorid,count(*) as bookcount
from books
group by authorid
having bookcount = 3;

-- use myemp table and find the avg salary of emp wrt dep_id
select * from myemp;

select dep_id,avg(salary) as avg_salary
from myemp
group by dep_id
having avg_salary > 8000;

## ORDER BY
-- retrieve emp_id, name and their salaries in order

select emp_id, first_name,salary
from myemp
order by salary;

-- sorting 
-- dep_id = ascending orde
-- salary = descending order
select dep_id,salary
from myemp
order by dep_id asc,
salary desc;

-- peopledata, sort such subscribed users come first, then by 
-- descending purchase amount
select person_id, name,purchase_amount,is_subscribed
from peopledata
order by is_subscribed desc, purchase_amount desc;