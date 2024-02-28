--Shipper ratio for USA customer 2--
SELECT
	Shippers.CompanyName,
    COUNT(Orders.ShipVia) as N_Ship,
    (COUNT(Orders.ShipVia) * 100 / (SELECT COUNT(*) from Orders WHERE shipcountry = 'USA')) as Ratio
from
	Orders
join Shippers ON
Orders.Shipvia = Shippers.ShipperID
where Orders.ShipCountry = 'USA'
GROUP by companyname;