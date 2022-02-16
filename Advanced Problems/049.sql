WITH CTE AS(
  SELECT 
    O.CustomerID, 
    C.CompanyName, 
    SUM(Quantity * UnitPrice) AS TotalOrderAmount 
  FROM 
    Orders O 
    JOIN OrderDetails OD ON O.OrderID = OD.OrderID 
    JOIN Customers C ON O.CustomerID = C.CustomerID 
  WHERE 
    YEAR(O.OrderDate) = 2016 
  GROUP BY 
    O.CustomerID, 
    C.CompanyName
) 
SELECT 
  CTE.CustomerID, 
  CTE.CompanyName, 
  COALESCE(CTE.TotalOrderAmount, 0) AS TotalorderAmount, 
  CASE WHEN TotalOrderAmount BETWEEN 0 
  AND 1000 THEN 'Low' WHEN TotalOrderAmount BETWEEN 1000 
  AND 5000 THEN 'Medium' WHEN TotalOrderAmount BETWEEN 5000 
  AND 10000 THEN 'High' ELSE 'Very High' END AS 'CustomerGroup' 
FROM 
  CTE 
ORDER BY 
  CustomerID
