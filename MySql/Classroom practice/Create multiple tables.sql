create database school;
use school;

create table if not exists branches(
branch_id tinyint auto_increment primary key,
branch_name varchar(100) not null,
city varchar(100) not null
);

-- classes
create table if not exists classes(
class_id tinyint auto_increment primary key,
branch_id tinyint,
class_name varchar(100),
foreign key (branch_id) references branches(branch_id)
);

-- Students
create table if not exists students(
student_id tinyint auto_increment primary key,
name varchar(100) not null,
age tinyint,
phone char(10),
email varchar(100),
address mediumtext,
class_id tinyint,
foreign key (class_id) references classes (class_id)
);

-- Fees
create table if not exists fees(
fees_id smallint auto_increment primary key,
student_id tinyint,
total_amount decimal,
amount_paid decimal,
payment_date date,
foreign key (student_id) references students(student_id),
check (amount_paid <= total_amount)
);

-- department
create table if not exists departments(
department_id smallint auto_increment primary key,
department_name varchar(100) not null
);

-- Teachers
create table if not exists teachers(
teacher_id smallint auto_increment primary key,
name varchar(100) not null,
qualifiction varchar(100),
designation varchar(70),
phone char(10),
email varchar(100),
address varchar(100),
department_id smallint,
foreign key (department_id) references departments(department_id)
);

-- Teacher class
create table if not exists teacher_class(
class_id tinyint,
teacher_id smallint,
foreign key (class_id) references classes(class_id),
foreign key (teacher_id) references teachers(teacher_id)
);

-- Employee
create table if not exists employee(
employee_id smallint auto_increment primary key,
name varchar(100),
qualification varchar(100),
designation varchar(100),
phone char(10),
email varchar(100),
address mediumtext,
department_id smallint,
foreign key (department_id) references departments(department_id)
);

-- SEE the tables
select * from branches;
select * from students;
select * from classes;
select * from fees;
select * from departments;
select * from teachers;
select * from teacher_class;
select * from employee;