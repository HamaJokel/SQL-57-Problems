SELECT C.customerid, 
       O.customerid 
FROM   customers C 
       LEFT JOIN orders O 
              ON C.customerid = O.customerid 
WHERE  O.customerid IS NULL 