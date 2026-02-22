use classes;

## Data filtering
-- Comparision operations

-- 1. Find student whose age is greater than 25
select student_name, age 
from students 
where age >25;

-- Find the list of students who have a qualification od 'B.tech'

select student_name, qualification
from students
where qualification ='B.Tech' ;

-- find student who are younger than 23 year old
select student_name , age
from students
where age <23;

## Logical opereators

-- 1. find students who are either 27 or 20 years old
select student_name, age
from students
where age =27 or age=20;

-- 2. find the student who have age less than 25  and enrolled the after 2024-01-01
select student_name, age ,enrolled_on
from students
where age < 25 and enrolled_on > 2024-01-01;

## Range operator

-- 1. list student with grad_year between 2020 and 2023
select student_name, grad_year
from students
where grad_year between 2020 and 2023;

-- 2.  list the sudent who enrolled between jan 2024 and june 2024
select student_name,enrolled_on
from students
where enrolled_on between '2024-01-01' and '2024-06-30'; 

-- 3. find student who are born between 2020 and 2005
select student_name,dob
from students
where dob between '2000-01-01' and '2005-12-31'; 

## MEMBERSHIP OPERATOR

-- 1. find the student whose qualification 'B.sc', 'B.Tech, 'MCA'
select student_name, qualification
from students
where qualification in ('B.Sc','B.Tech','MCA');

-- 2. student who are enrolled in 2024 or 2025
select student_name, enrolled_on
from students
where year(enrolled_on) in (2024,2025);

-- find student either from 'haydrabaad, pune'
select student_name, address
from students
where ( address) not in ('Hyderabad','Pune');

## Search  operator   'like'

--  1. find the student name start with the 'A'
select student_name from students  where student_name like 'A%';

-- 2. find the student name ends with the 'A'
select student_name from students  where student_name like '%A';

-- 3. find the student name have 'A' in between their name
select student_name from students  where student_name like '%A%';

-- 4. qualification strt  with 'M'
  select student_name, qualification from students  where qualification like 'm%';
  
  -- 5 find the student whose from maharashtra
  select student_name, address from students  where address like '%Maharashtra';
  
  -- 6. get the student phone no ends with '00'
  select student_name, phone
  from students
  where phone like '________00';

