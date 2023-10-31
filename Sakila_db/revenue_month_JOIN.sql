/*Query revenue in 2015 from 2 branch to compare month by month*/
SELECT
A.store_id,
B.address,
STRFTIME('%Y-%m',payment_date) as MonthID,
ROUND(SUM(D.amount),2) as 'Total_Amount'
from store A 
join address B on A.address_id = B.address_id
JOIN staff C on A.store_id = C.store_id
JOIN payment D on C.staff_id = D.staff_id
GROUP by 1,2,3
HAVING MonthID like '2005%'
