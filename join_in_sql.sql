-- Q1. Find order name and corresponding category name Filtering Columns 
select * from flipkart.order_details t1
join flipkart.orders t2
on t1.order_id = t2.order_id
join flipkart.users t3
on t2.user_id = t3.user_id ;


-- Q2. find order_id,name  and  city by joining users and orders

select order_id,name,city
 from flipkart.users t1
join flipkart.orders t2
on t1.user_id = t2.user_id;
-- Q3. find order_id , product category by joining order_detail annd category

select t1.order_id, t2.vertical
from flipkart.order_details as t1
join flipkart.category as t2
on t1.category_id = t2.category_id;

-- ----------------------------- Flitering Rows -----------------------------------
-- Q1. find all the orders placed in pune

select * from flipkart.orders t1
join flipkart.users t2
on t1.user_id = t2.user_id
where t2.city = "Pune";


-- Q2. find all order under chair category

select * from flipkart.order_details t1
join flipkart.category t2
on t1.category_id = t2.category_id
where t2.vertical = "chair"