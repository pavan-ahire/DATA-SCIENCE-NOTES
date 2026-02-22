select * from peopledata;

-- distribution of male and female in  the data


select gender, concat(round((count(*)/(select count(*) from peopledata))*100,1),"%") as percent
from peopledata
group by gender;

select is_subscribed, concat(round((count(*)/(select count(*) from peopledata))*100,1),"%") as percent
from peopledata
group by is_subscribed;

select gender, is_subscribed,concat(round((count(*)/(select count(*) from peopledata))*100,1),"%") as percent
from peopledata
group by gender,is_subscribed
order by gender;

-- SUBQUERIES IN WHERE
-- find emp whoes salary > company's avg salary
select *
 from (select *,avg(salary) as avg_salary
from myemp) as s
where salary > avg_salary;

select *
from myemp
where salary > (select avg(salary) from myemp);

-- find the second highet salary of emp

select * 
from myemp
order by SALARY desc
limit 3 offset 1;

select *
from myemp
where salary = (select max(salary) from myemp
where salary < (select max(SALARY) from myemp));

-- Multiple tables
select * from movies;
select * from members;

-- rented movies info

select *
from movies
where id in ( select movieid from members);

select members.*,movies.title
from members
left join movies
on movies.id = members.movieid
where movieid in ( select id from movies);

-- subquery in JOINS
use myschool;

select * from employees;
select * from departments;


select * 
from employees e
join (select * from departments where dept_name='admin') as d
on e.dept_id= d.dept_id;