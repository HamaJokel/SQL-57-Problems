WITH CTE AS(
  Select 
    ShipCountry, 
    CustomerID, 
    OrderID, 
    OrderDate = convert(date, OrderDate), 
    ROW_NUMBER() OVER(
      PARTITION BY ShipCountry 
      ORDER BY 
        ShipCountry
    ) row_num 
  FROM 
    orders
) 
SELECT 
  ShipCountry, 
  CustomerID, 
  OrderID, 
  OrderDate = CONVERT(DATE, Orderdate) 
FROM 
  CTE 
WHERE 
  row_num = 1 
ORDER BY 
  ShipCountry
