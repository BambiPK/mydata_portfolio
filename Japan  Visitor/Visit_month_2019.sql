--which month in 2019 Japan had the most visitors--
SELECT
	month_,
    SUM(Visitor) as TTL
from JPN_by_month
where Year = 2019
GROUP by month_
ORDER by TTL desc;

/*Answer
1st - July (Summer in Japan)
2nd - Apr (Sakura ohanami or Cherry blossom)
3rd - Start to Summer, not that hot */
