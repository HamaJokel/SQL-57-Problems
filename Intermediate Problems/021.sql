SELECT Country, City, COUNT(City) AS TotalCustomer 
FROM Customers
GROUP BY Country, City 
ORDER BY TotalCustomer DESC