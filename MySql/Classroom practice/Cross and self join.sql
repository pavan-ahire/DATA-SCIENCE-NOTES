use learndb;

select * from meals;
select * from drinks;

select *
from meals 
cross join drinks ;

select mealname,drinkname,(meals.rate + drinks.rate) as totalbill
from meals 
cross join drinks ;

select mealname,drinkname,(meals.rate + drinks.rate) as totalbill
from meals 
cross join drinks order by totalbill desc;

select m.mealname,d.drinkname,(m.rate+d.rate) from drinks as d
cross join meals as m
order by mealname,drinkname;

-- SELF JOIN
select * from myemp;

select m.emp_id,m.first_name as mgr_name,
e.first_name as emp_name , e.emp_id
from myemp as e
inner join myemp as m
on e.emp_id = m.mgr_id;