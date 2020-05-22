SELECT C.CategoryName, COUNT(P.ProductName) AS TotalProducts
FROM Categories C
JOIN Products P
ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryName
ORDER BY TotalProducts DESC
