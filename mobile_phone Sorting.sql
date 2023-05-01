-- sorting of data
 -- 1. find the top 5 Samsung phones with the biggest screen size
 select model, screen_size from smartphone.smartphones_cleaned_v6
 where brand_name =  "samsung"
 order by screen_size desc
 limit 5;
 
 -- 2. sort all the phones in descending order of the number of total cameras 
 select model, brand_name, (num_rear_cameras + num_front_cameras) as "total_no_of_cameras"
 from smartphone.smartphones_cleaned_v6
 order by total_no_of_cameras desc
 limit 5;
 
 -- 3. sort all the phones in descending order of the number of total cameras for samsung brand
 select model, brand_name, (num_rear_cameras + num_front_cameras) as "total_no_of_cameras"
 from smartphone.smartphones_cleaned_v6
 where brand_name = "samsung"
 order by total_no_of_cameras desc
 limit 5;
 
 -- 4. sort data on the basis of ppi in decreasing order
 select model, brand_name,
 round(sqrt(resolution_width * resolution_width + resolution_height*resolution_height)/screen_size) as "PPI"
 from smartphone.smartphones_cleaned_v6
 order by PPI Desc 
 limit 5;

-- 5.  find the phone with 2nd largest battery
select model,brand_name, battery_capacity
from smartphone.smartphones_cleaned_v6
order by battery_capacity desc
limit 1 ,1;

-- 5.  find the phone with 2nd lowest battery
select model,brand_name, battery_capacity
from smartphone.smartphones_cleaned_v6
order by battery_capacity asc
limit 1 ,1;

-- 6.find the name and rating of the worst rated apple phone
select model, brand_name, rating
from smartphone.smartphones_cleaned_v6
where brand_name = "apple"
order by rating asc
limit 5;

-- 7.find the name and rating of the worst rated  samsung phone
select model, brand_name, rating
from smartphone.smartphones_cleaned_v6
where brand_name = "samsung"
order by rating asc
limit 5;

-- 8. sort phones alphabetically and then on the basis of rating in desc order
select model, brand_name, rating
from smartphone.smartphones_cleaned_v6
order by brand_name asc, rating desc;

-- 9. sort phones alphabetically and then on the basis of price in ascending order
select model, brand_name, price
from smartphone.smartphones_cleaned_v6
where brand_name = 'apple' or brand_name = 'samsung'
order by brand_name asc, price asc;
