SELECT
	OrderDetails.OrderID, ProductID, UnitPrice, Quantity, Discount
FROM OrderDetails
JOIN ( 
	SELECT DISTINCT OrderID
	FROM OrderDetails
	WHERE Quantity >= 60
	GROUP BY OrderID, Quantity
	HAVING COUNT(*) > 1	
	)
	PotentialProblemOrders 
	on PotentialProblemOrders.OrderID = OrderDetails.OrderID
	order by OrderID, ProductID
