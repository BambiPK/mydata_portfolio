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

-- No Significant big ratio of each shipper company--