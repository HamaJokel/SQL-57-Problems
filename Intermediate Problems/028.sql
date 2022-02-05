SELECT TOP 3
    ShipCountry, AVG(Freight) as AverageFreight
FROM Orders
WHERE OrderDate >(
	(SELECT
    DATEADD(yy, -1, MAX(OrderDate))
FROM Orders))
GROUP BY ShipCountry
ORDER BY AverageFreight DESC