--Store Sales in VIEW--
CREATE VIEW OrderDT2 AS
SELECT *,
		(unitprice * quantity) as OrgPrice,
		(discount * (unitprice * quantity)) as DISC,
        ((unitprice * quantity) - (discount * (unitprice * quantity))) as SalePrice
        
from OrderDetails;
		