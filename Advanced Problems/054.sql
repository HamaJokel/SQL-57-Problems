WITH cte1 AS
	(
		SELECT Country, COUNT(*) AS Total
		FROM Suppliers
		GROUP BY Country
	), cte2 AS
	(	SELECT Country, COUNT(*) AS Total
		FROM Customers
		GROUP BY Country
	)

SELECT Country = ISNULL(cte1.Country, cte2.Country), TotalSuppliers = ISNULL(cte1.total, 0), TotalCustomers = isnull(cte2.total, 0)
FROM cte1
FULL OUTER JOIN cte2 
ON cte1.Country = cte2.Country
