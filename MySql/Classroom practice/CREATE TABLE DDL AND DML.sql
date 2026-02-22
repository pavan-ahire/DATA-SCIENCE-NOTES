## Creating the Table

## DDL Commands

create database exam;

create database if not exists exam;

-- always define a db which you want to use
use exam;

-- create table students_reg

create table students_reg(
sid tinyint not null unique,
name varchar(100) not null,
age tinyint check (age > 18), 
email varchar(100) unique not null,
phone_num char(10) unique,
address varchar(100) default 'not specified',
qualification varchar(100)
);
select * from students_reg;
describe students_reg;

-- ALTER
-- change table by adding column 'About'
alter table students_reg add column abouts varchar(100);

-- change tha data type, varchar(100) to text of Abouts
alter table students_reg modify column abouts text;

describe students_reg;

-- change the column name phone_num -> phone
alter table students_reg change column phone_num phone char(10);

-- DROP 
-- drop column abouts
alter table students_reg drop column abouts;

-- drop constraints
alter table students_reg drop index email;

-- specified order
insert into students_reg (sid,name,age,email,phone_num,address,qualification)
values
(1,'vaibhav',21,'vumbarar227@gmail.com',9011666438,'pune','BSC(Computer science)');

-- general order
insert into students_reg
values
(2,'pavan',21,'pavan227@gmail.com','8457498873','pune','BCA');

-- Adding NUll values
-- general order
insert into students_reg values (3,'Raj',22,'R@yahoo.com',NULL,'Mumbai','B.Tech');


-- Specified order
insert into students_reg (sid,name,age,email,address,qualification)
values (4,'yash',23,'y@yahoo.com','pune','B.Com');
-- If not specified it will give error
-- always specified what you want to insert


-- Add multiple rows
-- General order
insert into students_reg values
(5,'amol',19,'A@yahoo.com',8843546534,'Hyderabad','B.E'),
(6,'dev',19,'D@yahoo.com',9243546534,'banglore','BCA');

-- specified order
insert into students_reg (sid,name,age,email,phone,address,qualification)
values
(value1),
(value2);

-- UPDATE
-- change the age of Raj
set sql_safe_updates = 0;
update students_reg set age = 25
where name  = 'Raj';

-- change address Mumbai -> 'AAAA'
update students_reg set address = 'AAAA'
where address = 'Mumbai';

-- change qualification where age > 22 to 'OOOO'
update students_reg set qualification = 'OOOO'
where age > 22;

-- change the addresss 'CCCC' where name  = 'yash'
update students_reg set address = 'CCCC' 
where name = 'yash';

-- Always use WHERE clause when use UPDATE command.

-- DELETE 
-- delete if roll number is 4
delete  from students_reg where sid = 4;

-- delete if age is greater than 22
delete  from students_reg where age > 22;

-- delete without where clause
delete  from students_reg;

### Each Update and Delete you should use Where clause otherwise you cannot perform Update and delete

-- TRUNCATE 
truncate students_reg;
describe students_reg;

-- DROP
drop table students_reg;

select * from students_reg;

