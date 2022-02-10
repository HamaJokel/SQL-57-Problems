WITH AllOrders AS(
  SELECT 
    O.EmployeeID, 
    E.LastName, 
    COUNT(*) AS TotalOrders 
  From 
    Orders O 
    JOIN Employees E ON O.EmployeeID = E.EmployeeID 
  GROUP BY 
    O.EmployeeID, 
    E.LastName
), 
LateOrders AS(
  SELECT 
    O.EmployeeID, 
    E.LastName, 
    COUNT(*) AS LateOrders 
  FROM 
    Orders O 
    JOIN EMPLOYEES E ON O.EmployeeID = E.EmployeeID 
  WHERE 
    ShippedDate >= RequiredDate 
  GROUP BY 
    O.EmployeeID, 
    E.LastName
) 
SELECT 
  AllOrders.EmployeeID, 
  AllOrders.LastName, 
  AllOrders.TotalOrders, 
  COALESCE(LateOrders.LateOrders, 0) AS LateOrders, 
  COALESCE(
    CAST(LateOrders AS DECIMAL) / CAST(Totalorders AS DECIMAL), 
    0
  ) AS PercentLateOrders 
FROM 
  AllOrders 
  LEFT JOIN LateOrders ON AllOrders.EmployeeID = LateOrders.EmployeeID 
ORDER BY 
  AllOrders.EmployeeID
