-- How many customers in each country ?- 
SELECT 
	country,
	COUNT(*) AS Customer_N
  	FROM customers
    WHERE country IS NOT NULL
	GROUP BY country
    ORDER BY Customer_N desc;
