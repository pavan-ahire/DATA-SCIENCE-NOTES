## DATE TIME
-- 1. Get Current Date
select current_date() as today; -- it gives todays date

select * from students;

-- 2.calculate Age form the DOB
select student_name, dob,timestampdiff(year,dob, curdate()) as age
from students;

-- 3. get students born in particular month

select *
from students
where month(dob) = 2;

-- 4. Extract year, month , day from enrolled_on

select student_name, enrolled_on,
year(enrolled_on) as enrolled_year,
month(enrolled_on) as enrolled_month,
day(enrolled_on) as enrolled_day
from students;

-- 5. show how many days ago the enrollment happend
select student_name,enrolled_on,
datediff(curdate(), enrolled_on) as days_since_enrollment
from students;