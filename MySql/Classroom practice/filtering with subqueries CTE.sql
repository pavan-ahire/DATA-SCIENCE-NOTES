use learndb;

select * from myemp;

select first_name , salary, ( salary * 0.20) as bonus 
from myemp
where bonus > 2000; -- It will gives us error becuase where does not understand bonus column

-- use subquery
select * 
from (select first_name , salary, ( salary * 0.20) as bonus 
from myemp) as s
where bonus > 2000;


-- calculate bonus of 20%
-- filter employee bonus > 2000
-- calculate total_salary ( salary + bonus )
-- filter total_salary with > 20000
-- deduct 5% tax ( final_salary = total_salary - total_salary * 0.05 )
-- filter final_salary > 20K
select * 
from (select *, total_salary - total_salary * 0.05  as final_salary
from (select *,salary + bonus as total_salary
from (select * , salary * 0.20 as bonus
from myemp) as s
where bonus > 2000) as s1
where total_salary > 20000) as s2
where final_salary > 20000;

-- CTE - common table expression

with cte_1 as ( select *, salary * 0.20 as bonus from myemp),
cte_2 as ( select *, salary + bonus as total_salary from cte_1
where bonus > 2000),
cte_3 as (select *,total_salary - total_salary * 0.05 as final_salary
from cte_2 where total_salary > 20000)
select * from cte_3
where final_salary > 20000;


