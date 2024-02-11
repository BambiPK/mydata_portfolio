CREATE view OrderDT2 AS
	SELECT *,
    (OrgPrice - (discount * OrgPrice))
from OrderDT