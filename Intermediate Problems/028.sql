SELECT TOP 3 shipcountry, 
             Avg(freight) AS AverageFreight 
FROM   orders 
WHERE  orderdate >= ( Dateadd(yy, -1, (SELECT Max(orderdate) 
                                       FROM   orders)) ) 
GROUP  BY shipcountry 
ORDER  BY averagefreight DESC 