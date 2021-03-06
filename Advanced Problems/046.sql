WITH AllOrders AS( --All Orders
	SELECT E.EmployeeID, COUNT(*) AS AllOrders
	FROM Employees E
	LEFT JOIN Orders O 
	ON E.EmployeeID = O.EmployeeID
	GROUP BY E.EmployeeID
),  LateOrders AS( --Late Orders
		SELECT E.EmployeeID, COUNT(*) AS LateOrders
		FROM Employees E
		LEFT JOIN Orders O 
		ON E.EmployeeID = O.EmployeeID
		WHERE O.RequiredDate <= O.ShippedDate
		GROUP BY E.EmployeeID, E.LastName
	) 
SELECT E.EmployeeID, 
       E.LastName, 
       AllOrders.AllOrders, 
       Isnull(LateOrders.LateOrders, 0) 
       AS LateOrders, 
       Cast(LateOrders.LateOrders AS DECIMAL) / Cast( 
       AllOrders.AllOrders AS DECIMAL) AS 
       PercentLateOrders 
FROM   Employees E 
       LEFT JOIN LateOrders 
              ON E.EmployeeID = LateOrders.EmployeeID 
       JOIN AllOrders 
         ON E.EmployeeID = AllOrders.EmployeeID 
ORDER  BY EmployeeID 