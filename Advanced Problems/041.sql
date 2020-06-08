SELECT OrderID, CONVERT(date, OrderDate) AS OrderDate, CONVERT(date, RequiredDate) AS RequiredDate, ShippedDate 
FROM Orders
WHERE RequiredDate <= ShippedDate