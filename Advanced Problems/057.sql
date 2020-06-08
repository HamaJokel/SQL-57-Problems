WITH cte AS(
Select
CustomerID
,OrderDate = convert(date, OrderDate)
,NextOrderDate = convert(date,Lead(OrderDate,1)
OVER (Partition by CustomerID order by CustomerID,OrderDate))
From Orders
)
SELECT CustomerID, OrderDate, NextOrderDate, DaysBetweenOrders = DATEDIFF(DAY, OrderDate, NextOrderDate)
FROM cte
WHERE DATEDIFF(day, OrderDate, NextOrderDate) <= 5

