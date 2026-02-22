use pizza_store;

-- how many pizzas were orderd?
select count(distinct order_id) from customer_orders;

-- How many unique customer orders were made?
select count(distinct customer_id) from customer_orders;

-- How many successful orders were delivered by each runner?

select  count(runner_id) - count(cancellation) as total_order 
from runner_orders;

-- how many of each type of pizza was delivered?
select p.pizza_name,count(c.pizza_id) as pizza_deliver
from customer_orders c
join pizza_names p
on c.pizza_id=p.pizza_id
group by p.pizza_name;

-- How many vegiterian and meatlover were ordered by each customer?

select p.pizza_name,c.customer_id,count(*) as pizza_ord
from customer_orders c
 join pizza_names p
on c.pizza_id=p.pizza_id
group by p.pizza_name,c.customer_id;

select Pizza_name,count(*)
from customer_orders co
left join pizza_names pn
on co.pizza_id = pn.pizza_id
group by pizza_name;


select c.order_id,count(pizza_id) as max_pizza_delivered
from customer_orders c
join runner_orders r
on c.order_id=r.order_id
group by c.order_id;

select order_time,sum(order_id)
from customer_orders
group by order_time;