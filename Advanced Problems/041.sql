SELECT 
  OrderID, 
  CAST(OrderDate AS DATE) AS OrderDate, 
  CAST(RequiredDate AS DATE) AS RequiredDate, 
  CAST(ShippedDate AS DATE) AS ShippedDate 
FROM 
  Orders 
WHERE 
  ShippedDate >= RequiredDate
