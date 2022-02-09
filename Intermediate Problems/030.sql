SELECT 
  C.CustomerID, 
  O.CustomerID 
FROM 
  Customers C 
  LEFT JOIN Orders O ON O.CustomerID = C.CustomerID 
WHERE 
  O.CustomerID IS NULL
