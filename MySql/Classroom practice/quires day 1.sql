select * from students;

select student_name,age from students;

-- comment1
## comment2
/* dnrkfnk
ndfekwn
runfwdcskn
dfdf
2345v  comment 3 */

SELECT * FROM STUDENTS;

## Retrive all the details from students table where the students age is greater than 22
select * from students
where age >22;

## to viwe the particular column using the condition
select student_name, grad_year,age 
from students 
where age >22;

## to viwe the tabel 
select * from student_details;

## insert the  record in tabel 
insert into student_details (first_name, last_name, grad_year, dob, age, address)
values ('deven','gangurde',2025,'2002-03-11',23,'Nashik');

## update the record value 
update student_details 
set address='Nashik, Maharashtra'
where sid=5;

select * from student_details;

## selecting the age greater than 22 
select * from student_details where age>22;

## selecting the perticular columans value 
select  dob  from student_details where first_name='Deven';
  
## deleting the row
 delete from student_details where sid=5;
 
 
 
 -- Data Exploration
 use classes;
 select * from students;
 
 -- 1. how many tabels are there in this data set
 show tables;
 
 -- 2. view columns and tables structure
 describe students;
 
 -- 3. count no of rows in table
 select count(*) as count_of_students from students;
 
 -- 4. check null values in age of student
 select count(*)  as student_null from students where age is null;
 
 -- 5. check if not null values 
 select count(*) as student_null from students where age is not null;
 
 -- 6 cheks unique values of grad_year
 select distinct(grad_year) from students;
 
 -- 7 count of unique gradu_year
 select count(distinct(grad_year)) as count from students;
 
 -- 8 how many student are in each grad_year
 select count(*) as pass_2020 from students where grad_year =2020;
 select count(*) as pass_2021 from students where grad_year =2021;
 select count(*) as pass_2022 from students where grad_year =2022;
 select count(*) as pass_2023 from students where grad_year =2023;
 select count(*) as pass_2024 from students where grad_year =2024;
 
 -- using the group by
 select grad_year, count(*) from students group by grad_year;
 
 select age from students group by age having age < 30;
 
  select * from students order by grad_year desc;
  
  -- 10. Statistical value (min ,max, avg) of age
  select max(age) as max_age from students;
 select min(age) as min_age from students;
 select avg(age) as avg_age from students;
 
 -- 11. View specific row
 -- first 5
 select * from students limit 5;
 
 -- 12. 8th row only
 select * from students limit 1 offset 7;
 
 -- 13. range 25th row onwards 6 rows
 select * from students limit 6 offset 24;
 
 -- 14. view all values from students
 select * from students;
 
 -- 15. specific column
 select age from students;
 
select * from students where age =20 and grad_year=2024;

select * from student_details order by age desc,last_name asc;
select * from  student_details;