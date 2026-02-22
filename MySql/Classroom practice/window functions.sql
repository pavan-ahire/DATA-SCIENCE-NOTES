use learndb;

select * from myemp;
-- AGGREGATE WINDOW FUCTION
-- avg salary of each department
select dep_id ,avg(salary) as avg_sal
from myemp1
group by dep_id;

-- using window  fuction
select *,
avg(salary) over(partition by dep_id) as dep_avg
from myemp
order by dep_id desc;

-- find employees earning more than dept avg
with cte as ( select *,
avg(salary) over(partition by dep_id) as dep_avg
from myemp)
select * from cte
where salary > dep_avg;

-- cumulative salary wrt emp_id
select*,
sum(salary) over(partition by dep_id order by emp_id) as cumm_salary
from myemp;

-- RANKING WINDOW FINCTION

create table students415(
name varchar(100),
marks tinyint);

insert into students415 values
('pavan',99),
('vaibhav',90),
('devendra',67),
('roshan',49),
('dev',49),
('prasad',98),
('manisha',88),
('amol',88);

select *,
rank() over(order by marks desc) as rank_f,
dense_rank() over(order by marks desc) as dense_f,
row_number() over(order by marks desc) as row_f
from students415;


with cte as(select *,
dense_rank() over( order by salary desc) as second_highest
from myemp)
select * from cte 
where second_highest = 2;

-- Task
-- 1. Retrieve highest salaried emp from each dept
-- 2. find emp who was hired 2nd in each dept
-- (HINt: partition by dep_id order by hire_date)



drop table students415;