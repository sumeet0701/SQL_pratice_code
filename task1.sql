create database country;

-- Q1. Find out top 10 countries' which have maximum A and D values.

select t1.Country,
max(t1.A) as max_a,
max(t2.D) as max_b
 from country.country_ab t1
join country.country_cd t2
on t1.Country = t2.Country
group by t1.Country
order by max_a desc, max_b desc
limit 10;

-- code 2 using inner join 
SELECT t1.Country,
 MAX(t1.A) AS Max_A, 
 MAX(t2.D) AS Max_D
FROM country.country_ab t1
INNER JOIN country.country_cd t2 
ON t1.Country = t2.Country AND t1.Region = t2.Region AND t1.Edition = t2.Edition
GROUP BY t1.Country
ORDER BY Max_A DESC, Max_D DESC
LIMIT 10;

/*
-- Q2. Find out highest CL value for 2020 for every regioEditionn.
 Also sort the result in descending order. 
Also display the CL values in descending order.
*/

select t1.country,
t2.Region,
max(t1.CL) as max_cl
from country.country_cl t1
inner join country.country_ab t2
on t1.Country = t2.Country and t1.Edition = t2.Edition 
inner join country.country_cd t3
on t1.Country = t3.Country and t1.Edition = t3.Edition 
inner join country.country_efg t4
on t1.Country= t4.Country and t1.Edition = t3.Edition
where t1.Edition = "2020"
group by t1.Country
order by max_cl desc;

-- method 2

SELECT t1.Region, t1.Edition, MAX(t4.CL) AS Max_CL,t1.Country
FROM country.country_ab t1
INNER JOIN country.country_cd t2 ON t1.Country = t2.Country AND t1.Region = t2.Region AND t1.Edition = t2.Edition
INNER JOIN country.country_efg t3 ON t1.Country = t3.Country AND t1.Region = t3.Region AND t1.Edition = t3.Edition
INNER JOIN country.country_cl t4 ON t1.Country = t4.Country AND t1.Edition = t4.Edition
WHERE t1.Edition = '2020'
GROUP BY t1.Region, t1.Edition
ORDER BY Max_CL DESC;
