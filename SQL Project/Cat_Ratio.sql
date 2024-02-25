/* Product category ratio in Northwind business
(Quantity of each product category) */
SELECT
	Cat.CategoryName,
    count(P.ProductID) as PQty,
    ROUND((COUNT(P.ProductID) * 100.0 / (SELECT COUNT(*) from Products)),2) as Cat_rate
    
from Categories as Cat
join Products as P on Cat.CategoryID = P.CategoryID
group by categoryname;