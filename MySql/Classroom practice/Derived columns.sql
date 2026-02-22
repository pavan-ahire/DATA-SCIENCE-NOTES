## DERIVED COLUMNS

-- 1. Mathematical expression
-- 2. Build-in SQL functions
-- 3. using conditions

use learndb;
select * from drinks;

## mathematical operations to derive columns
--
select *,rate + (rate * 0.18) as rate_with_gst
from drinks;

-- Build in fuctions
-- check peopledata table. 
-- Compare the registration date with '2024-12-31' and see if the no of days they have been registered.

select * from peopledata;

select name,reg_date,
datediff('2024-12-31',reg_date) as days_since_reg
from peopledata;

## conditonal statements
-- 
select name, purchase_amount,
(case
when purchase_amount >50000 then  'Premium'
else 'Regular'
end) as customer_type
from peopledata;

select name, purchase_amount,
(case
when purchase_amount >50000 then  'Premium'
else 'Regular'
end) as customer_type,
(case
when age > 35 then 'Adult'
else 'Old'
end) as buyers_type
from peopledata;