SELECT OrderID, ProductID, UnitPrice, UnitPrice * Quantity AS TotalPrice
FROM OrderDetails
ORDER BY OrderID, ProductID 