SELECT 
  C.CustomerID, 
  O.CustomerID 
FROM 
  Customers C 
  LEFT JOIN Orders O ON C.CustomerID = O.CustomerID 
  AND O.EmployeeID = 4 
WHERE 
  O.CustomerID IS NULL