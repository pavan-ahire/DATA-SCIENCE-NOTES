-- find all students along with classes they are enrolled
-- INNER JOIN
select student_id,students.name as student_name, classes.class_name, classes.stream_
from students
Inner join classes
on students.class_id = classes.class_id;

-- find all students and their associated fees payment
-- LEFT JOIN

select students.name as student_name, fees.amount_paid, fees.payment_date
from students
left join fees
on students.student_id = fees.student_id;

-- find the list of all employees and the departments names to which they are belong
-- RIGHT join
select  emp_name, departments.dept_name
 from employees 
 right join departments
 on employees.dept_id = departments.dept_id;
 
 -- list all the teachers along with the name of the classess they teach 
 select teachers.teach_name,classes.class_name,classes.stream_
from teachers
inner join teacher_class
on teachers.teacher_id= teacher_class.teacher_id
inner join classes 
on teacher_class.class_id=classes.class_id;
-- -----------------------------------------------------------------------------
select t.teach_name,c.class_name,c.stream_
from teachers t
inner join teacher_class tc
on t.teacher_id= tc.teacher_id
inner join classes c
on tc.class_id=c.class_id;
-- -------------------------------------------------------------------------
select t.teach_name,c.class_name,c.stream_
from teachers t
join teacher_class tc                    -- it will gives the by default inner join
on t.teacher_id= tc.teacher_id
join classes c                           -- it will gives the by default inner join
on tc.class_id=c.class_id;

-- 2. list the all employees working in the "accounts" dept
select e.emp_name, d.dept_name
from employees e 
join departments d
on e.dept_id = d.dept_id
where d.dept_name = 'accounts';

-- 3. list all the classes along with their teachers assigned
select c.class_name,c.stream_,t.teach_name
from classes c
left join teacher_class tc
on c.class_id = tc.class_id
left join teachers t
on tc.teacher_id = t.teacher_id;

-- 4. list all the names of students in each class and their braches
select s.name as std_name,c.class_name,b.branch_name
from students s
left join classes c
on c.class_id = s.student_id
left join branches b
on c.branch_id = b.branch_id;

-- Right join 
-- show all the students and their fees
select s.name,f.*
from fees f
right join students s
on f.student_id = s.student_id;

-- multiple details
-- students-details with their teachers and fees status
select s.name,t.teach_name,c.stream_,f.amount_paid,f.total_amount
from students s
join classes c on s.class_id = c.class_id
join teacher_class tc on c.class_id = tc.class_id
join teachers t on tc.teacher_id = t.teacher_id
join fees f on s.student_id = f.student_id;