SELECT 
  EmployeeID, 
  OrderID, 
  OrderDate 
FROM 
  Orders 
WHERE 
  CAST(OrderDate AS DATE) = CAST(
    EOMONTH(OrderDate) AS DATE
  ) 
ORDER BY 
  EmployeeID, 
  OrderID, 
  OrderDate
