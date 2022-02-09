SELECT 
  E.EmployeeID, 
  E.LastName, 
  OD.OrderID, 
  OD.ProductID, 
  OD.Quantity 
FROM 
  Employees E 
  JOIN Orders O ON E.EmployeeID = O.EmployeeID 
  JOIN OrderDetails OD ON O.OrderID = OD.OrderID