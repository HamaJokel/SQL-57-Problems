SELECT DISTINCT ContactTitle, COUNT(*) As TotalContactTitle
FROM Customers 
GROUP BY ContactTitle
ORDER BY TotalContactTitle DESC