SELECT Country, City, COUNT(*) AS 'TotalCustomer'
FROM Customers
GROUP BY Country, City
ORDER BY TotalCustomer DESC 