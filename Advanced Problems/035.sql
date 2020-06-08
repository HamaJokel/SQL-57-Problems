SELECT employeeid, 
       orderid, 
       orderdate 
FROM   orders 
WHERE  orderdate = Eomonth(orderdate) 
ORDER  BY employeeid, 
          orderdate 