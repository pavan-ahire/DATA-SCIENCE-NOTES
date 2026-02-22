use learndb;

select * from myemp;

create view dep_90 as (
select * from myemp
where dep_id = 90);

select * from dep_90;

-- updatable views
update dep_90 set dep_id = 1000;
-- when update view change will reflect in original & viceversa

-- reverse dep_id = 90 now
update myemp set dep_id = 90
where dep_id = 1000;

-- Non updatable view 
create view dept_80 as ( select * from myemp where dep_id = 80)
with check option;

select * from dept_80;
-- Try updating
update dept_80 set dep_id = 8000
where dep_id = 80;

-- deop view depa_90
drop view dep_90;
select * from dep_90;

select * from myemp
where dep_id = 