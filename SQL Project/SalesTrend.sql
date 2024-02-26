/* Revenue trend by month ID using Shipped date 
(Normally we count since product shipped out from company) */
SELECT
	STRFTIME('%Y-%m',shippeddate) as Ddate,
    ROUND(SUM(SalePrice),2) as Salesamount
from OrderDT2
JOIN Orders ON OrderDT2.OrderID = Orders.OrderID
where shippeddate is not NULL
group by Ddate;