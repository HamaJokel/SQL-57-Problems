SELECT 
  O.EmployeeID, 
  E.LastName, 
  COUNT(*) AS TotalLateOrders 
FROM 
  Orders O 
  JOIN Employees E ON O.EmployeeID = E.EmployeeID 
WHERE 
  ShippedDate >= RequiredDate 
GROUP BY 
  O.EmployeeID, 
  E.LastName 
ORDER BY 
  TotalLateOrders DESC
