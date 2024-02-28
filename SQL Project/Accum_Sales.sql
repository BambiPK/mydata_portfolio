/* Running total of salesamount by monthID using common table expression */
WITH TB1 AS (
	SELECT
		STRFTIME('%Y-%m',shippeddate) as Ddate,
    	ROUND(SUM(SalePrice),2) as Salesamount    
	from OrderDT2
	JOIN Orders ON OrderDT2.OrderID = Orders.OrderID
	where shippeddate is not NULL
	group by Ddate
  			)
SELECT
	Ddate,
    Salesamount,
    ROUND(SUM(Salesamount) OVER(ORDER BY Ddate),2) as Accum
from TB1
GROUP BY Ddate;
