select * from smartphone.smartphones_cleaned_v6;
 
-- deleting the rows where camera megaphixl >150 and brand_name = samsung
delete  from smartphone.smartphones_cleaned_v6
where primary_camera_rear >150 and brand_name = "samsung";

-- check the rows of samsung having camera megapixal >150
select * from smartphone.smartphones_cleaned_v6
where primary_camera_rear >150;

-- function in sql 
-- there are two types of function in sql 1. buildin 2. userdefined
-- 1. build in function are 2 types 1. scaler and 2. aggregate
-- 1.1. Scalar funtion: 1. round -> roundoff values output 
-- 1.2. aggregate function: 1. average -> give the average of columns. gives 1 values for whole columns
-- 1.2.2 min, max, aggregate function are more useful


-- MAX and MIN

-- 1. find the most expensive phone in data
select max(price) from smartphone.smartphones_cleaned_v6;
-- most expensive phone cost is 650000

 -- 2. find the least expensive phone in data 
 select min(price) from smartphone.smartphones_cleaned_v6;
 
 -- 3. max and min ram capacity
 select min(ram_capacity), max(ram_capacity) from smartphone.smartphones_cleaned_v6;
 
 -- 4. find the price of costiest samsung phone.
select max(price) from smartphone.smartphones_cleaned_v6
where brand_name = 'samsung';

-- 5. most expensive samsung phone 

select * from smartphone.smartphones_cleaned_v6
where brand_name = 'samsung' and price = 163980;

-- average rating of apple phone
select avg(rating) from smartphone.smartphones_cleaned_v6
where brand_name = 'apple';


-- count function  is similar as python df['columns_name'].value_counts
-- find the total no samsung phone in data
select count(*) from smartphone.smartphones_cleaned_v6
where brand_name = "samsung"; 

-- find the total no apple phone in data
select count(*) from smartphone.smartphones_cleaned_v6
where brand_name = "apple"; 

-- count distint will gives us a unique values counts
-- find no of brands in data -> duplicate values is not allowed
select count(distinct(brand_name)) as "no_of_brands"
from smartphone.smartphones_cleaned_v6;

-- count distint will gives us a unique values counts
-- find no of processor brand in data -> duplicate values is not allowed
select count(distinct(processor_brand)) as "no_of_processor_brands"
from smartphone.smartphones_cleaned_v6;

-- statistical analysis using 1.std, 2.variance, 3.mean, 4.median, 5.mode
-- standard deviation (std) , mean , variance, median of screen_size 
select std(screen_size), avg(screen_size), variance(screen_size)
from smartphone.smartphones_cleaned_v6; 


-- scalar function: function is not a function which doesnot gives a summary of particular columns it gives a value for particular value
-- ABS (absolute) it gives output of -15 as 15 and for 15 it also gives 15 it is like a modulus function
-- ceil function will round of to next positive no ex 4.1 -> 5, 4.4-> 5, 4.8-> 5, 4.9-> 5
-- floor function will round of to previous postive no. ex: 4.1 -> 4, 4.4-> 4, 4.8-> 4, 4.9-> 4

