WITH CTE AS
		(
			SELECT 
			ROW_NUMBER() OVER(
			PARTITION BY ShipCountry
			ORDER BY ShipCountry) as row_num,
			ShipCountry, 
			CustomerID, 
			OrderID, 
			OrderDate = CONVERT(DATE, orderdate) 
			FROM Orders
		)
SELECT ShipCountry, CustomerID, OrderID, OrderDate 
FROM CTE
WHERE row_num = '1'
