/* TO find which category of product best sold in last 3 years (2018-2023)
Using VIEW table (OrderDT2) and CTE*/

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
order by Total_Sales desc;