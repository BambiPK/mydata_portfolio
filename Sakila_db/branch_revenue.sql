--Which Salika branch has the most revenue from rental--
SELECT
A.store_id,
count(*) as totalN,
SUM(B.amount) as TTLSales
from staff A 
join payment B on A.staff_id = B.staff_id
GROUP by store_id
ORDER by store_id desc;

--branch2 is the answer--
