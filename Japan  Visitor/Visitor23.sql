--Find top 5 contries visited japan the most in 2023
SELECT
	country,
    SUM(visitor) as N 
FROM JPN_by_month
where year = 2023
GROUP by country
order by N desc;

/* Answer
1st - South Korea
2nd - Taiwan
3rd - United states
4th - Hongkong
5th - China */
