-- ----------------------------------pratice questions---------------------------------------------

-- Q1. find all the profitable order

select t2.order_id,
sum(t1.profit) as profit
 from flipkart.order_details t1
join flipkart.orders t2
on t1.order_id = t2.order_id
group by t2.order_id
having profit > 0;

-- Q2. find the customer who has placed max  number of orders

select name,
count(*)
from flipkart.orders t1
join flipkart.users t2
on t1.user_id = t2.user_id
group by t2.name
order by count(*)  desc
limit 1;

-- Q3. which is most profitable category

select t1.vertical,
sum(t2.profit)  as profit
from flipkart.category t1
join flipkart.order_details t2
on t1.category_id = t2.category_id
group by t1.vertical
order by profit desc
limit 1;

-- Q4. which is most profitable state

select t3.state,
sum(t1.profit) as "profit"
from flipkart.order_details t1
join flipkart.orders t2
on t1.order_id = t2.order_id
join flipkart.users t3
on t2.user_id = t3.user_id
group by t3.state
order by profit desc
limit 1;


-- Q5. find all categories with profit higher than 2000

select t2.vertical,
sum(t1.profit) as "Profit"
from flipkart.order_details t1
join flipkart.category t2
on t1.category_id = t2.category_id
group by t2.vertical 
having profit >2000