WITH cte AS(
	SELECT OrderID
	FROM OrderDetails
	WHERE Quantity >= 60 
	GROUP BY OrderID, Quantity
	HAVING COUNT(*) > 1
)
SELECT OrderID, ProductID, UnitPrice, Quantity, Discount
FROM OrderDetails
WHERE OrderID IN (Select OrderID from cte)
ORDER BY OrderID, Quantity
