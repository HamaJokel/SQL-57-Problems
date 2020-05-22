SELECT O.OrderID, CONVERT(DATE, O.OrderDate) As OrderDate, S.CompanyName
FROM Orders O
JOIN Shippers S
ON ShipVia = ShipperID
WHERE OrderID < 10300
