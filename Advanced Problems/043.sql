WITH AllOrders AS( --All Orders
	SELECT E.EmployeeID, COUNT(*) AS AllOrders
	FROM Employees E
	JOIN Orders O 
	ON E.EmployeeID = O.EmployeeID
	GROUP BY E.EmployeeID
),  LateOrders AS( --Late Orders
		SELECT E.EmployeeID, COUNT(*) AS LateOrders
		FROM Employees E
		JOIN Orders O 
		ON E.EmployeeID = O.EmployeeID
		WHERE O.RequiredDate <= O.ShippedDate
		GROUP BY E.EmployeeID, E.LastName
	) 
SELECT E.EmployeeID, E.LastName, AllOrders.AllOrders, LateOrders.LateOrders
FROM Employees E
JOIN LateOrders
ON E.EmployeeID = LateOrders.EmployeeID
JOIN AllOrders 
ON LateOrders.EmployeeID = AllOrders.EmployeeID
ORDER BY EmployeeID