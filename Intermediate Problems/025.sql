SELECT TOP 3 shipcountry, 
             Avg(freight) AS AverageFreight 
FROM   orders 
GROUP  BY shipcountry 
ORDER  BY averagefreight DESC 