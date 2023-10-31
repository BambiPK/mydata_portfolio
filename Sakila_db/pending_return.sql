/*Query customer info (Name, Address, Postal code) that pending return
If there's no any return from customer, the result would be null*/
SELECT DISTINCT
A.first_name,
A.last_name,
A.email,
B.address,
B.postal_code,
C.return_date
from customer A 
Join address B on A.address_id = B.address_id
JOIN rental C on A.customer_id = C.customer_id
where C.return_date is NULL
ORDER by first_name;
