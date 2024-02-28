/* Revenue by customer */
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
	JOIN Orders_Details on Orders.OrderID = Orders_Details.OrderID
  	  )
GROUP by 1,2
Order by Rev DESC
LIMIT 10;