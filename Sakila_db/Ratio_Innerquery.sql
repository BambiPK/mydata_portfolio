--Show ratio of each rating from film table--
SELECT
	rating,
    N,
    ROUND((N/ cast(TotalN as REAL))*100,2) as 'Rating ratio'
FROM (
    SELECT
		rating,
    	count(*) N,
		(SELECT count(*) from film) as TotalN
	from film
	GROUP by rating
  	  );
