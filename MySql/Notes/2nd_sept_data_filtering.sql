use classess;

## DATA FILTERING
-- COMPARISION OPERATORS
-- FInd students whose age is greater than 25
select student_name, age
from students
where age > 25;

-- -- list of students who have a qualification of 'B.Tech'
select * from students;
select student_name, qualification
from students
where qualification= 'B.Tech';

-- find students who are younger than 23 year old
select student_name, age
from students
where age < 23;


-- LOGICAL OPERATORS
-- find students who are either 27 or 29 years old
select student_name, age
from students
where age = 27 or age = 20;


select * from students;

/*Get the names of students who have age less than 25 & have enrolled 
after 2024-01-01 */
select student_name, age, enrolled_on
from students
where age < 25 and enrolled_on > 01-01-2024;

select student_name, age, enrolled_on
from students
where enrolled_on > '2024-01-01' and age < 25;

-- RANGE OPERATOR
-- list students with grad_year between 2020 & 2023
select student_name, grad_year
from students
where grad_year between 2020 and 2023;

-- find students who enrolled between Jan 2024 and June 2024
select student_name, enrolled_on 
from students
where enrolled_on between '2024-01-01' and '2024-06-30';

-- Find students who are born between 2000 and 2005
select student_name, dob 
from students
where dob between '2000-01-01' and '2005-12-31';

-- Menbership operators
-- Find students who have qualification of 'B.Sc', 'B.Tech' and 'MCA'
select student_name, qualification
from students
where qualification in ('B.Sc','B.Tech','MCA');

-- Students who are enrolled in 2024 or 2025
select student_name, enrolled_on
from students
where year(enrolled_on) in (2024,2025);

-- Find students either frm 'Hyderabad, Pune'

-- SEARCH OPERATOR

-- LIKE {wild card} ['%' - {all values} and '_'{Specified values]

-- Find the studetns whose names contain 'A'
select student_name
from students
where student_name like '%A%';

-- QUalification starts with "M"
select student_name, qualification
from students
where qualification like 'M%';

-- address ending with 'Maharashtra'
select student_name, address
from students
where address like '%Maharashtra';

-- Pune
select student_name, address
from students
where address like 'Pune%';

-- '%@gmail.com'

-- get the students phone no ends with '00'
select phone
from students
where phone like '_______00';