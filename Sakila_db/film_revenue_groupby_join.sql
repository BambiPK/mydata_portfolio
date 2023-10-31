/*Find top 10 film title that has the most rental and revenue*/
SELECT
	A.title as Film_Title,
    F.name as FilmCategory,
    ROUND(SUM(amount),2) as Revenue
from film A 
JOIN inventory B on A.film_id = B.film_id
JOIn rental C on B.inventory_id = C.inventory_id
JOIn payment D on C.rental_id = D.rental_id
JOIN film_category E on A.film_id = E.film_id
JOIN category F on E.category_id = F.category_id
group by 1,2
order by 3 DESC
limit 10;
