--Accumulate visitors in Japan since 2017-2023--
SELECT
	*,
    SUM(Total) OVER(ORDER BY Year) as Accum
from (
  SELECT
  	year,
  	SUM(visitor) as Total
  from JPN_by_month
  GROUP by year
  );
