/*Count date of each rental film in rental table*/

--Use JULIANDAY to count days between two dates--
SELECT
	A.rental_id,
    C.title,
    CAST(JULIANDAY(return_date) - JULIANDAY(rental_date) as INT) as 'Rental_day'
from rental A
join inventory B on A.inventory_id = B.inventory_id
join film C ON B.film_id = C.film_id
WHERE return_date IS NOT NULL
ORDER by 3 desc;
