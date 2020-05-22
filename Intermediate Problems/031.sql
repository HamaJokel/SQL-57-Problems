SELECT C.customerid, 
       O.customerid 
FROM   customers C 
       LEFT JOIN orders O 
              ON c.customerid = o.customerid 
                 AND O.employeeid = 4 
WHERE  O.customerid IS NULL 