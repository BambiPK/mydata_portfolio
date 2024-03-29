## Northwind DB Data Analysis using SQL  
Hello everyone, Welcome to my repository with Northwind Data Analysis project.  
The programming language I use this time is SQL in SQLite with Northwind database that original from Microsoft.  
Northwind example database is very uselful to practicing analysis of business performance in food industry.
The tables in database are including from product, product details, categories, supplier to logistics details.
These are very good to pratice and understand business process.  
Following picture is schema I made from PowerBI

![image](https://github.com/BambiPK/mydata_portfolio/assets/141467571/ccac90cb-16e8-439d-9ee5-81df3367173e)

-- There are 11 tables in this database --
## 1st Section; Basic Syntax to solve the questions.

**1.1 How many customers in northwind business?**

```sql
SELECT count(customerid) as TTL_Cust
from Customers;
```
+ There are 93 customers from result set.



**1.2 How many customers in each country of this business**

```sql
SELECT 
	country,
	COUNT(*) AS Customer_N
  	FROM customers
    WHERE country IS NOT NULL
	GROUP BY country
    ORDER BY Customer_N desc;
```
>> ![image](https://github.com/BambiPK/mydata_portfolio/assets/141467571/631b78de-192f-428f-94a3-37f9640de339)

## 2nd Intermediate Function to solve the business questions.
Using JOIN, GROUP BY, ORDER BY
**2.1 Ratio of Category of product**

```sql
SELECT
    Cat.CategoryName,
    count(P.ProductID) as PQty,
    ROUND((COUNT(P.ProductID) * 100.0 / (SELECT COUNT(*) from Products)),2) as Cat_rate
    
from Categories as Cat
join Products as P on Cat.CategoryID = P.CategoryID
group by categoryname;
```
Result set ⬇️

|CategoryName	|PQty	|Cat_rate|
|---|---|---|
|Beverages	|12	|15.58|
|Condiments	|12	|15.58|
|Confections	|13	|16.88|
|Dairy Products	|10	|12.99|
|Grains/Cereals	|7	|9.09|
|Meat/Poultry	|6	|7.79|
|Produce	|5	|6.49|
|Seafood	|12	|15.58|

**2.2 Ratio of shipper, Is there any signigicant ratio of any shipper (Delivery company)?**
```sql
/* Ratio of each shipper from total order */
SELECT
    Shippers.CompanyName,
    COUNT(Orders.ShipVia) as N_Ship,
    (COUNT(Orders.ShipVia) * 100 / (SELECT COUNT(*) from Orders)) as Ratio
from
	Orders
join Shippers ON
Orders.Shipvia = Shippers.ShipperID
GROUP by companyname;
```

Result set ⬇️
|CompanyName |N_Ship	|Ratio|
|---         |---       |---  |
|Federal Shipping|5461	|33|
|Speedy Express	|5335	|32|
|United Package	|5486	|33|

No any significant or big ratio of delivery company

**2.3 Find top 5 Catogory with the best sales in latest 3 years (2020-2023)**
```sql
WITH TempTB1 as (
SELECT 
	OrderDT2.orderid,
    orderdate,
    SalePrice,
    Categories.CategoryID,
    categoryname
    
from OrderDT2
join Orders on OrderDT2.OrderID = Orders.OrderID
JOIN Products on OrderDT2.ProductID = Products.ProductID
join Categories on Products.CategoryID = Categories.CategoryID
WHERE orderdate >= '2020-01-01' AND orderdate <= '2023-12-31'
  				)

SELECT
	categoryid,
    categoryname,
    ROUND(SUM(SalePrice),2) AS Total_Sales
    
from TempTB1
GROUP by categoryid
order by Total_Sales desc
limit 5;
```
Result set ⬇️
|CategoryID	|categoryname	|Total_Sales  |
|---       |---            |---          |
1	   |Beverages	        |31,781,701.00|
3	   |Confections	        |22,625,593.77|
6	   |Meat/Poultry	|22,087,971.01|
4	   |Dairy Products	|19,611,683.10|
2	   |Condiments	        |19,103,247.10|

**2.4 Find the top 5 employees who have the best sales in the latest 3 years and what is their title/position**
```sql
SELECT
    Employees.employeeid,
    firstname || ' ' || lastname as EmployeeName,
    title,
	SUM(ROUND((unitprice * quantity) - (unitprice * quantity * discount),2)) as SalesPrice
from OrderDetails
JOIN Orders on OrderDetails.OrderID = Orders.OrderID
join Employees on Orders.EmployeeID = Employees.EmployeeID
WHERE orderdate >= '2020-01-01' AND orderdate <= '2023-12-31'
GROUP by 2
Order by SalesPrice DESC
limit 5;
```
Result set ⬇️ Most of employee from top 5 is Sale representative

|EmployeeID	|EmployeeName	        |Title	                 |SalesPrice   |
|---            |---                    |---                     |---          |
|7	        |Robert King	        |Sales Representative	 |18,166,536.22|
|4	        |Margaret Peacock	|Sales Representative	 |18,037,712.02|
|5	        |Steven Buchanan	|Sales Manager	         |17,587,355.71|
|9	        |Anne Dodsworth	        |Sales Representative	 |17,057,404.97|
|3	        |Janet Leverling	|Sales Representative	 |16,943,465.62| 




## 3rd Advance function using Subquery, Windows function
**3.1 Find top 10 Customer from total revenue

```sql
SELECT
	customerid,
    companyname,
    SUM(SalesPrice) as Rev    
FROM (
SELECT
	Customers.customerid,
    companyname,
	ROUND((unitprice * quantity) - (unitprice * quantity * discount),2) as SalesPrice
    FROM Customers
	JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	JOIN Order_Details on Orders.OrderID = Order_Details.OrderID
  	  )
GROUP by 1,2
Order by Rev DESC
LIMIT 10;
```
|customerid	|companyname	                        |Rev|
|---            |---                                    |---|
|BSBEV	        |B's Beverages	                        |6,154,115.34|
|HUNGC	        |Hungry Coyote Import Store	        |5,698,023.67|
|RANCH	        |Rancho grande	                 	|5,559,110.08|
|GOURL	        |Gourmet Lanchonetes	                |5,552,309.81|
|ANATR	        |Ana Trujillo Emparedados y helados	|5,534,356.65|
|RICAR	        |Ricardo Adocicados	                |5,524,517.32| 
|FOLIG	        |Folies gourmandes	                |5,505,502.85|
|LETSS	        |Let's Stop N Shop	                |5,462,198.02|
|LILAS	        |LILA-Supermercado	                |5,437,438.34|
|PRINI	        |Princesa Isabel Vinhos	                |5,436,770.55|

**3.2 Apply windows function to find accumulation of revenue by month-ID**
```sql
WITH TB1 AS (
	SELECT
		STRFTIME('%Y-%m',shippeddate) as Ddate,
    	ROUND(SUM(SalePrice),2) as Salesamount    
	from OrderDT2
	JOIN Orders ON OrderDT2.OrderID = Orders.OrderID
	where shippeddate is not NULL
	group by Ddate
  			)
SELECT
	Ddate,
    Salesamount,
    ROUND(SUM(Salesamount) OVER(ORDER BY Ddate),2) as Accum
from TB1
GROUP BY Ddate;
```



