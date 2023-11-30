--Find top 10 contry visit japan the most in latest 5 years (2019-2015)
SELECT
	country,
    SUM(visitor) as N 
FROM JPN_by_month
where year >= 2019
GROUP by country
order by N desc;

/*Answer
1st - China
2nd - South Korea
3rd - Taiwan
4th - Hongkong
5th - United States
6th - Thailand
7th - Vietnam
8th - Australia
9th - Philipines
10th - Singapore */
