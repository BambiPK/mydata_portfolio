/* Shipper ratio for USA customer*/
SELECT
	companyname,
    COUNT(companyname)
from Orders
JOIN Shippers ON
Orders.ShipVia = Shippers.ShipperID
where shipcountry = 'USA'
GROUP BY companyname;