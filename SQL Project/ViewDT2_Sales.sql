CREATE VIEW OrderDT2 AS
	SELECT *,
    (unitprice * quantity) as OrgPrice,
    (OrgPrice - (OrgPrice * discount)) as SalesPrice
from OrderDetails;
    
    