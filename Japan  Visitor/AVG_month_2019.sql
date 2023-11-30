--Average visitors per month in Japan in 2019--
SELECT (AVG_visit)/12 from (
SELECT
    SUM(visitor) as AVG_Visit
from JPN_by_month
where Year = 2019
  );
