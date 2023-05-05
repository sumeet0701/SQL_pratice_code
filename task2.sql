-- Q1. Find top-5 most sold products.\

select t1.name,
sum(t2.Quantity) as maxsold
 from sales.products t1
inner join sales.sales1 t2 on t1.ProductID = t2.ProductID
group by t1.ProductID ,t1.name
order by maxsold desc
limit 5;

-- Q2. Find sales man who sold most no of products.

SELECT e.FirstName, e.MiddleInitial, e.LastName, COUNT(*) AS TotalProductsSold
FROM sales.employees e
INNER JOIN sales.sales1 s ON e.EmployeeID = s.SalesPersonID
GROUP BY e.EmployeeID, e.FirstName, e.MiddleInitial, e.LastName
ORDER BY TotalProductsSold DESC
LIMIT 1;

-- Q3. Sales man name who has most no of unique customer.
select count(Distinct(s.CustomerID)) as unique_person,
e.FirstName, e.MiddleInitial, e.LastName 
from sales.employees e
INNER JOIN sales.sales1 s on e.EmployeeID = s.SalesPersonID
GROUP BY e.EmployeeID, e.FirstName, e.MiddleInitial, e.LastName
order by unique_person desc
limit 1;

-- Q4. Sales man who has generated most revenue. Show top 5. 

select e.FirstName, e.MiddleInitial, e.LastName,
round((p.Price * s.Quantity)) as revenue
from  sales.employees e
inner join sales.sales1 s on e.EmployeeID = s.SalesPersonID
inner join sales.products p on p.ProductID = s.ProductID
GROUP BY e.EmployeeID, e.FirstName, e.MiddleInitial, e.LastName
order by revenue desc
limit 5;

-- Q5. List all customers who have made more than 10 purchases.

select c.CustomerID, c.FirstName, c.MiddleInitial, c.LastName,
count(*) as purchases
 from sales.customers c
inner join sales.sales1 s on s.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.MiddleInitial, c.LastName
having purchases>10;

-- Q6. List all salespeople who have made sales to more than 5 customers

select e.FirstName, e.MiddleInitial, e.LastName,
count(Distinct s.CustomerID) as total
from sales.employees e
inner join sales.sales1 s on e.EmployeeID = s.SalesPersonID
GROUP BY e.EmployeeID, e.FirstName, e.MiddleInitial, e.LastName
having total >5;

-- Q7.  List all pairs of customers who have made purchases with the same salesperson.
SELECT s1.CustomerID, s2.CustomerID, s1.SalesPersonID
FROM sales.sales1 s1
INNER JOIN sales.sales1 s2 ON s1.SalesPersonID = s2.SalesPersonID
WHERE s1.CustomerID <> s2.CustomerID;
