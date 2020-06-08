WITH cte AS
	(
		Select
		InitialOrder.CustomerID
		,InitialOrderID = InitialOrder.OrderID
		,InitialOrderDate = InitialOrder.OrderDate
		,NextOrderID = NextOrder.OrderID
		,NextOrderDate = NextOrder.OrderDate
		,DaysBetween = DATEDIFF(DAY, InitialOrder.OrderDate, NextOrder.OrderDate) 
		from Orders InitialOrder
		join Orders NextOrder
		on InitialOrder.CustomerID = NextOrder.CustomerID
		WHERE InitialOrder.OrderID < NextOrder.OrderID
	)
SELECT * FROM 
CTE
WHERE DaysBetween <= 5
Order by
cte.CustomerID, cte.InitialOrderID