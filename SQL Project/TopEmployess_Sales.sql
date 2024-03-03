/* Find the top 5 employees who have the best sales in the latest 3 years
and what is their title/position*/
SELECT
    Employees.employeeid,
    firstname || ' ' || lastname as EmployeeName,
    title,
	SUM(ROUND((unitprice * quantity) - (unitprice * quantity * discount),2)) as SalesPrice
from OrderDetails
JOIN Orders on OrderDetails.OrderID = Orders.OrderID
join Employees on Orders.EmployeeID = Employees.EmployeeID
WHERE orderdate >= '2020-01-01' AND orderdate <= '2023-12-31'
GROUP by 2
Order by SalesPrice DESC
limit 10;