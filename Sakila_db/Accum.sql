/* outer query: to create accum from inner query by using windows function (over(order- */
SELECT 
	paid_date,
    Revenue,
    SUM(Revenue) OVER(ORDER BY paid_date) as Accum
from ( --inner query sum each paid_date --
	SELECT
		STRFTIME('%Y-%m', payment_date) as paid_date,
    	ROUND(SUM(amount),2) as Revenue
	from payment
	GROUP by 1
  	);
