--How many visitors in Japan each year and which year has the most visitors--
SELECT
	year,
   	SUM(visitor) as TTL_Visitors
from JPN_by_month
GROUP by year
ORDER by TTL_Visitors desc;
