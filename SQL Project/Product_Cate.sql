-- Find Category of each product--
SELECT 
	Products.ProductID,
    Products.ProductName,
    Categories.CategoryID,
    categoryname
from Products
JOIn Categories on
Products.CategoryID = Categories.CategoryID
order by ProductName;
