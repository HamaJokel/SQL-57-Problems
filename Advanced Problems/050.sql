WITH OrdersIn2016 AS(
	SELECT O.CustomerID, C.CompanyName, SUM(OD.UnitPrice * OD.Quantity) AS TotalOrderAmount
	FROM OrderDetails OD
	JOIN Orders O
	ON OD.OrderID = O.OrderID
	AND CONVERT(DATE, O.OrderDate) BETWEEN '2016' AND '2017'
	JOIN Customers C
	ON O.CustomerID = C.CustomerID
	GROUP BY O.CustomerID, C.CompanyName
), CustomerGroups AS(
SELECT CustomerID, CompanyName, TotalOrderAmount,  
CASE
	WHEN TotalOrderAmount BETWEEN 0 AND 1000 THEN 'Low'
	WHEN TotalOrderAmount BETWEEN 1001 AND 5000 THEN 'Medium'
	WHEN TotalOrderAmount BETWEEN 5001 AND 10000 THEN 'High'
	ELSE 'Very High'
END AS CustomerGroup
FROM OrdersIn2016
)
SELECT CustomerGroups.CustomerGroup, TotalInGroup = COUNT(*), PercentageInGroup = COUNT(*) * 1.0/(SELECT COUNT(*) FROM CustomerGroups)
FROM  CustomerGroups
group by CustomerGroups.CustomerGroup