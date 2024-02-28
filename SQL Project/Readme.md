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

**1.1 How many customers in northwind business?
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
