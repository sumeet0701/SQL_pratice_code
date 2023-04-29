SELECT * FROM smartphone.smartphones_cleaned_v6 where 1;

-- 1. selecting the model, price and rating from dataset
SELECT model, price ,rating FROM smartphone.smartphones_cleaned_v6;

-- 2. selecting the model , battery_capacity , os from dataset
select model, battery_capacity , os from smartphone.smartphones_cleaned_v6;

-- 3. rename the columns while output side
select os as "Opeating system " , model, battery_capacity as "MaH" from smartphone.smartphones_cleaned_v6;

-- 4. selecting the model which having os == android 
select os, model from smartphone.smartphones_cleaned_v6 where os = 'android';

-- 5. selecting the model which having os == android and price should be less than 30000
select os, model, price from smartphone.smartphones_cleaned_v6 
where os = 'android' and price < 31000;

-- 6. selecting the model which having os == android and price should be less than 10000
select os, model, price from smartphone.smartphones_cleaned_v6 
where os = 'android' and price < 11000;

-- 7. calculating ppi (pixel per inches) 
-- ppi = d0/d1 where d0 = squareroot(w2 +h2) , di = screensize
select model,
 sqrt(resolution_width *resolution_width +resolution_height* resolution_height) as "d0",
 screen_size as "d1",
 sqrt(resolution_width *resolution_width +resolution_height* resolution_height)/screen_size as "PPI"
from smartphone.smartphones_cleaned_v6;

-- 8. converting rating into 10's scale
select model , rating/10 as "rating_10's" from smartphone.smartphones_cleaned_v6;
-- 9. selecting a model which have rating greater than 8 

select model , rating/10 as "rating_10" from smartphone.smartphones_cleaned_v6 
where rating/10 >8;

-- 10. select a unique brand name :
select distinct(brand_name) from smartphone.smartphones_cleaned_v6;


-- 11. select a unique brand name and count them :
select count(distinct(brand_name)) as 'count' from smartphone.smartphones_cleaned_v6;

-- 12. select a unique processor brand name :
select distinct(processor_brand) from smartphone.smartphones_cleaned_v6;

-- 13 . select the distinct brand name and processoer _brand
select distinct brand_name , processor_brand 
from smartphone.smartphones_cleaned_v6;

-- 14. select the distinct brand name and processoer _brand where brand_name == samsung
select distinct brand_name , processor_brand 
from smartphone.smartphones_cleaned_v6
where brand_name = 'samsung';

-- 15. selecting the model where the price between 10000 and 20000
select model from smartphone.smartphones_cleaned_v6
where price between 10000 and 20000;

-- 16. selecting the unique model where the price between 10000 and 20000
select distinct(model) from smartphone.smartphones_cleaned_v6
where price between 10000 and 20000;

-- 17. selecting the unique model from samsung where the price between 10000 and 20000
select distinct(model) from smartphone.smartphones_cleaned_v6
where (price between 10000 and 20000) and brand_name='samsung';

-- 18. selecting the unique model  where the price between 10000 and 20000 and rating >10
select distinct(model) from smartphone.smartphones_cleaned_v6
where (price between 10000 and 20000) and rating/10 >8;

-- 19. find all samsung phone with ram >8Gb
select distinct(model) from smartphone.smartphones_cleaned_v6
where brand_name ='samsung' and ram_capacity>8;

-- 20. find all samsung phone with sanpdragron processor
select distinct(model) from smartphone.smartphones_cleaned_v6
where brand_name= 'samsung' and processor_brand ='snapdragon';

-- 21. find brand name who sell phones with price > 50000
select distinct brand_name from smartphone.smartphones_cleaned_v6
where price > 50000;

-- 22. find count no of brand name who sell phones with price > 50000
select count(distinct brand_name) as "count" 
from smartphone.smartphones_cleaned_v6
where price > 50000;

-- 23. updating the processor_brand where name = mediatak to dimensity
UPDATE smartphone.smartphones_cleaned_v6
SET processor_brand = "dimensity"
WHERE processor_brand = "mediatek";

-- 24. check if processor name  mediatek exist of no
select processor_brand from smartphone.smartphones_cleaned_v6
where processor_brand = "mediatek ";
