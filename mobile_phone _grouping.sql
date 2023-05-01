-- -----------------------------Grouping of data---------------------------------------------------
select brand_name, count(*) as "Num_of_phone"
from smartphone.smartphones_cleaned_v6
group by brand_name
order by Num_of_phone desc
limit 5 ; -- top 5

/*
-- 1. Group smartphones by whether they have an NFC and get the average price and rating 
Avg price of 5g phones vs avg price of non 5g phones
*/
select brand_name, count(*) as "Num_of_phone",
round(avg(price)) as "average",
max(rating) as "max_rating",
round((screen_size),3) as "average_screen_size",
round(avg(battery_capacity)) as "average_battery_capacity"
from smartphone.smartphones_cleaned_v6
group by brand_name
order by Num_of_phone desc
limit 10;

/*
Group smartphones by whether they have an NFC and get the average price and rating
 Avg price of 5g phones vs avg price of non 5g phones
 */
 select has_nfc, has_5g,
 round(avg(price)) as "avergae_price",
 round(avg(rating),2) as "average_rating"
 from smartphone.smartphones_cleaned_v6
 group by has_5g;
 
 
 
 select has_nfc, has_5g, extended_memory_available,
 round(avg(price)) as "avergae_price",
 round(avg(rating),2) as "average_rating"
 from smartphone.smartphones_cleaned_v6
 group by extended_memory_available;
 
 /*
  Group smartphones by the brand and processor brand and get the count of models 
  and the average primary camera resolution (rear)
 */
 
 select brand_name, 
 processor_brand,
 os,
 count(*) as "Count_of_phone",
 round(avg(primary_camera_rear)) as " average primary camera resolution (rear)"
 from smartphone.smartphones_cleaned_v6
 group by brand_name , processor_brand,os
 order by brand_name desc;
 
 /*
 Top 5 most costly phone brand 
 */
 select brand_name,
 round(avg(price)) as "average_price"
 from smartphone.smartphones_cleaned_v6
 group by brand_name
 order by average_price desc
 limit 5;
 
 /*
 which brand has smallest screen size
 */
  select brand_name,
round(avg(screen_size)) as "avg_screen_size"
 from smartphone.smartphones_cleaned_v6
 group by brand_name
 order by avg_screen_size asc
 limit 5;
 
 /*
 Group smartphones by the brand, and find the brand with 
 the highest number of models that have both NFC and an IR blaster
 */
 
   select brand_name, 
   count(*) as "Total_no_of_model",
   has_nfc, has_ir_blaster
 from smartphone.smartphones_cleaned_v6
 where has_nfc = "True" and has_ir_blaster = "True"
 group by brand_name
 order by Total_no_of_model desc
 limit 5;
 
 /*
  Find all Samsung 5g enabled smartphones and find out the avg price for NFC and Non-NFC phones
 */
 
 select brand_name,
 round(avg(price)) as "avg_price",
 has_nfc
 from smartphone.smartphones_cleaned_v6
 where brand_name = "samsung" and has_5g = "True"
 group by has_nfc
 
 
 /* 
 count(*) this will give the count of rows 	and used for rows counting
 The COUNT(*) function returns the number of rows in a table in a query. 
 It counts duplicate rows and rows that contain null values.
 */
 