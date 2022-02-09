SELECT TOP 3
    ShipCountry, AVG(Freight) as AverageFreight
FROM Orders
GROUP BY ShipCountry
ORDER BY AverageFreight DESC 
