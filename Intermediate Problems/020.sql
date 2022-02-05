SELECT c.CategoryName, COUNT(*) AS 'TOTAL'
FROM Categories C
JOIN Products P
ON C.CategoryID = P.CategoryID
GROUP BY c.CategoryName
ORDER BY TOTAL DESC 