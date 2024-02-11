--Merge two table using JOIN for more details--
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
Orders.OrderID = OrderDetails.OrderID;