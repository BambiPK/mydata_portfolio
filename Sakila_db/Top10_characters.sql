SELECT
	first_name || ' ' || last_name Fullname,
    count(*) N
from actor
join film_actor on actor.actor_id = film_actor.actor_id
GROUP by fullname
order by N desc
limit 10; 
