use classess;
select * from students;

-- string operatons
-- FUNCTIONS

-- 1. UPPER() 
select *,upper(student_name) as name_uppercase
 from students;
 
 -- 2. LOWER()
 select *,lower(student_name) as name_lowerrcase
 from students;
 
 -- 3. Length
 
select *,Length(student_name) as length
 from students;
 
 -- 4. CONCAT()
 select * from student_details;
 
 select *,concat(first_name, ' ' , last_name) as fullname
 from student_details;
 
 -- 5. substring()
 -- get first 4 character of students name
  select first_name,substring(first_name,2,4) as short_name
 from student_details;
 
 select *,substring(address,locate(',',address)+1) as state_name
 from student_details;
 
  select address,locate(',',address) as state_name -- it will give us count 
 from student_details;
 
  select *,SUBSTRING_INDEX(address,',',-1) as state_name
 from student_details;
 
 -- 6. replace()
 select email, replace(email, '@gmail.com','@innomatics.com') as updated_email
 from students;
 
 -- 7. find the leftmost and rightmost values
 -- in python we have find() and rfind()
 -- left() and right()
 
 -- see the first 4 char of address
 select address, left(address, 4) as first_4
 from student_details;
 
 -- last 4 char of address
 select address, right(address, 4) as last_4
 from student_details;
 
 -- Last 3 digit from student table
  select phone, right(phone, 3) as last_3
 from students;
 
 -- REVERSE()
-- reverse the students name
select first_name, reverse(first_name) as reverse_fn
from student_details;

-- describe student_details; it will give us to all column names 

