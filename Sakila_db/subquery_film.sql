/*Query film title only available either store 1 or 2 but not both (To clarify to customers which store should they rent that film)*/

--outer query to select film title -- 
SELECT DISTINCT
	title,
    store_id
from film A 
join inventory B on A.film_id = B.film_id
-- inner query to select only title that available at only one store;
WHERE A.film_id in (
  	select film_id
  	from inventory
  	GROUP by 1
  	HAVING count (DISTINCT store_id) = 1);
