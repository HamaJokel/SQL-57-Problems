WITH cte 
     AS (SELECT C.customerid, 
                C.companyname, 
                O.orderid, 
                TotalOrderAmount = Sum(OD.quantity * OD.unitprice) 
         FROM   customers C 
                JOIN orders O 
                  ON C.customerid = O.customerid 
                JOIN orderdetails OD 
                  ON O.orderid = OD.orderid 
         WHERE  Year(O.orderdate) = 2016 
         GROUP  BY C.customerid, 
                   C.companyname, 
                   O.orderid) 
SELECT customerid, 
       companyname, 
       orderid, 
       totalorderamount 
FROM   cte 
WHERE  totalorderamount >= 10000 
ORDER  BY totalorderamount DESC 