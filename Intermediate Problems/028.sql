SELECT TOP 3
    ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
WHERE OrderDate >
	(SELECT DATEADD(YY, -1, MAX(OrderDate))
FROM Orders
	)
GROUP BY ShipCountry
ORDER BY AverageFreight DESC