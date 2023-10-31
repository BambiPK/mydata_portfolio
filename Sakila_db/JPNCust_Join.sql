--Find Customer info (firstname, lastname, Address, City) in Japan using JOIN--
SELECT 
	A.customer_id,
	A.first_name,
    A.last_name,
    B.address,
    C.city,
    D.country
from customer A 
join address B on A.address_id = B.address_id
JOIN city C on B.city_id = C.city_id
JOIN country D on C.country_id = D.country_id
where D.country = 'Japan';
