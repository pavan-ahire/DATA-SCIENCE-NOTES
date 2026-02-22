use emp_db;
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

-- 2. JOB ROLE AND DEPARTMENT ANALYSIS 
-- ● How many different job roles exist in each department? 
	select jobdept,count(name) as diff_job_role
    from jobdepartment
    group by jobdept;
	
-- ● What is the average salary range per department? 
	select jobdept,avg(amount) as avg_salary_dep
	from salarybonus sb 
    join jobdepartment jd
    on jd.job_id  = sb.job_id
    group by jobdept;
    
-- ● Which job roles offer the highest salary? 
	select jd.name ,sb.amount
	from salarybonus sb
    join jobdepartment jd
    on jd.job_id = sb.job_id
    order by amount desc
    limit 5;
    
-- ● Which departments have the highest total salary allocation? 
	select jobdept,sum(amount) as highest_total_salary
	from salarybonus sb
    join jobdepartment jd
    on jd.job_id = sb.job_id
    group by jobdept
    order by highest_total_salary desc;
    
-- 3. QUALIFICATION AND SKILLS ANALYSIS 
-- ● How many employees have at least one qualification listed? 
	select count(e.emp_id) as emp_with_qualification
	from employee e
	join qualification q
    on e.emp_id = q.emp_id
    where q.requirements is not null;
    
-- ● Which positions require the most qualifications? 
	select Position,Requirements
	from qualification 
    where Requirements like '%/%';
    
-- ● Which employees have the highest number of qualifications? 
	select e.firstname,e.lastname ,q.position,q.requirements
	from employee e
    join qualification q
    on q.emp_ID = e.emp_ID
    where q.requirements like '%/%';
    
    
-- 4. LEAVE AND ABSENCE PATTERNS 
-- ● Which year had the most employees taking leaves? 
    select year(date) as year,count(date) as leaves
	from employee e
    join leaves l
    on l.emp_id = e.emp_id
    group by year(date);
    
-- ● What is the average number of leave days taken by its employees per department? 
	select jd.jobdept,avg(day(current_date()) - day(l.date)) as AVG
	from leaves l
    join employee e
	on e.emp_id  = l.emp_id
    join jobdepartment jd
    on jd.job_id = jd.job_id
    group by jd.jobdept;
    
    
SELECT d.jobdept,AVG(l.date) AS avg_leave_days
FROM employee e
JOIN jobdepartment d 
ON e.job_id = d.job_id
JOIN leaves l 
ON e.emp_id = l.emp_id
GROUP BY d.jobdept;

-- ● Which employees have taken the most leaves? 
	
-- ● What is the total number of leave days taken company-wide? 
-- ● How do leave days correlate with payroll amounts?
