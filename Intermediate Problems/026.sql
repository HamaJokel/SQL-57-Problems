SELECT TOP 3 shipcountry, 
             Avg(freight) AS AverageFreight 
FROM   orders 
WHERE YEAR (OrderDate) = 2015
GROUP  BY shipcountry 
ORDER  BY averagefreight DESC 
