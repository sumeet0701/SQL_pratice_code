-- -------------------------------------- Having Clause ----------------------------------------------

/*
select kaleya jo kama where karta ha 
same having group by ka leya karta ha 
select   -----------------> where
groupby ------------------> having

*/
 -- 1. Costliest Brand which has at least 20 phones
 
 select brand_name,
 count(*) as "count",
 round(avg(price)) as "avg_price"
 from smartphone.smartphones_cleaned_v6
 group by brand_name
 having count>20
 order by avg_price  desc;
 
 -- 2. find the avg rating of smartphone brands that have more than 20 phones
select brand_name,
 count(*) as "count",
 round(avg(rating)) as "avg_rating"
 from smartphone.smartphones_cleaned_v6
 group by brand_name
 having count>20
 order by avg_rating  desc;
 
 /*
 3. Find the top 3 brands with the highest avg ram that has a refresh rate of at 
 least 90 Hz and fast charging available and don't consider brands that have less than 10 phones
*/
select brand_name,
(avg(ram_capacity)) as "avg_ram"
from smartphone.smartphones_cleaned_v6
where refresh_rate >= 90 and fast_charging_available = 1
group by brand_name
having count(*) >10
order by avg_ram  desc
limit 3;

/*
Find the avg price of all the phone brands with avg rating of 70 
and num_phones more than 10 among all 5g enabled phones
*/
select brand_name,
avg(price) as "avg_price"
from smartphone.smartphones_cleaned_v6
where has_5g = "True"
group by brand_name
having count(*) >10 and avg(rating) >70
order by avg_price desc
