SELECT TOP 10 O.orderid, 
              Count(*) AS TotalOrderDetails 
FROM   orderdetails OD 
       JOIN orders O 
         ON OD.orderid = O.orderid 
GROUP  BY O.orderid 
ORDER  BY totalorderdetails DESC 