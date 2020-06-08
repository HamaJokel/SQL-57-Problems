WITH cte AS 
( 
         SELECT   c.customerid, 
                  c.companyname, 
                  totalorderamount = sum(od.quantity * od.unitprice) 
         FROM     customers c 
         JOIN     orders o 
         ON       c.customerid = o.customerid 
         JOIN     orderdetails od 
         ON       o.orderid = od.orderid 
         WHERE    year(o.orderdate) = 2016 
         GROUP BY c.customerid, 
                  c.companyname)
SELECT * 
FROM cte 
WHERE totalorderamount >= 15000
ORDER BY totalorderamount DESC