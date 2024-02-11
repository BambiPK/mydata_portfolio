SELECT
	Orders.OrderID,
    Orders.customerid,
    unitprice,
    quantity,
    discount   
from Orders
JOIN OrderDetails on
Orders.OrderID = OrderDetails.OrderID;