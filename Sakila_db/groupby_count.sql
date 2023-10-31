--Find rating value in Rating column of film table (distinc)--
select rating,
count (rating) N 
from film
GROUP by rating;
