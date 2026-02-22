-- create databse
create database emp_db;
use emp_db;
-- drop database emp_db;

-- Table 1: Job Department
CREATE TABLE JobDepartment (
    Job_ID INT PRIMARY KEY,
    jobdept VARCHAR(50),
    name VARCHAR(100),
    description TEXT,
    salaryrange VARCHAR(50)
);
-- Table 2: Salary/Bonus
CREATE TABLE SalaryBonus (
    salary_ID INT PRIMARY KEY,
    Job_ID INT,
    amount DECIMAL(10,2),
    annual DECIMAL(10,2),
    bonus DECIMAL(10,2),
    FOREIGN KEY (job_ID) REFERENCES JobDepartment(Job_ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);
-- Table 3: Employee
CREATE TABLE Employee (
    emp_ID INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    contact_add VARCHAR(100),
    emp_email VARCHAR(100) UNIQUE,
    emp_pass VARCHAR(50),
    Job_ID INT,
    FOREIGN KEY (Job_ID) REFERENCES JobDepartment(Job_ID)
	ON DELETE SET NULL ON UPDATE CASCADE
);

-- Table 4: Qualification
CREATE TABLE Qualification (
    QualID INT PRIMARY KEY,
    Emp_ID INT,
    Position VARCHAR(50),
    Requirements VARCHAR(255),
    Date_In DATE,
    FOREIGN KEY (Emp_ID) REFERENCES Employee(emp_ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table 5: Leaves
CREATE TABLE Leaves (
    leave_ID INT PRIMARY KEY,
    emp_ID INT,
    date DATE,
    reason TEXT,
    FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table 6: Payroll
CREATE TABLE Payroll (
    payroll_ID INT PRIMARY KEY,
    emp_ID INT,
    job_ID INT,
    salary_ID INT,
    leave_ID INT,
    date DATE,
    report TEXT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (job_ID) REFERENCES JobDepartment(job_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY (salary_ID) REFERENCES SalaryBonus(salary_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (leave_ID) REFERENCES Leaves(leave_ID)
        ON DELETE SET NULL ON UPDATE CASCADE
);

select * from employee;
select * from jobdepartment;
select * from leaves;
select * from qualification;
select * from salarybonus;
select * from Payroll;


-- 1. EMPLOYEE INSIGHTS 
-- ● How many unique employees are currently in the system? 

	select count(distinct emp_id) as No_of_emp
	from employee;                                    -- 60
    
-- ● Which departments have the highest number of employees? 
	select jobdept,count(emp_id) as No_of_emp
	from jobdepartment jd
    join  employee e
    on jd.job_id = e.job_id					-- finance and it
    group by jobdept
    order by No_of_emp desc
    limit 2;
    
-- ● What is the average salary per department? 
	select jobdept,avg(amount) as avg_salary
    from jobdepartment jd
    join salarybonus sb
    on sb.job_id = jd.job_id
    group by jobdept;
    
-- ● Who are the top 5 highest-paid employees? 
	
   select e.emp_id,jd.jobdept,e.firstname,e.lastname,sb.amount
    from salarybonus sb
    join jobdepartment jd
    on jd.job_id  = sb.job_id
    left join employee e
    on e.job_id  = jd.job_id
    order by amount desc
    limit 5;
    
-- ● What is the total salary expenditure across the company? 
select sum(amount) as total_salary_expenditure
from salarybonus;
