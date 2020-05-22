SELECT P.ProductID, P.ProductName, S.CompanyName
FROM Products P 
JOIN Suppliers S
ON P.SupplierID = S.SupplierID