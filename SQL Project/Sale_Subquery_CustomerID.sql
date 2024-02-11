SELECT
	Customerid,
    ROUND(SUM(SalesPrice),2) as TTL_Sales
from (
SELECT
	Orders.OrderID,
    Orders.customerid,
    unitprice,
    quantity,
    discount,
    (unitprice * quantity) as OrgPrice,
    (discount * (unitprice * quantity)) as DISC,
    ((unitprice * quantity) - (discount * (unitprice * quantity))) as SalesPrice      
from Orders
JOIN OrderDetails on
Orders.OrderID = OrderDetails.OrderID) as subquery
GROUP by customerid;