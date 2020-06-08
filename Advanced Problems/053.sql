WITH orders2016 
     AS (SELECT customers.customerid, 
                customers.companyname, 
                TotalOrderAmount = Sum(quantity * unitprice) 
         FROM   customers 
                JOIN orders 
                  ON orders.customerid = customers.customerid 
                JOIN orderdetails 
                  ON orders.orderid = orderdetails.orderid 
         WHERE  orderdate >= '20160101' 
                AND orderdate < '20170101' 
         GROUP  BY customers.customerid, 
                   customers.companyname) 
SELECT customerid, 
       companyname, 
       totalorderamount, 
       customergroupname 
FROM   orders2016 
       JOIN customergroupthresholds 
         ON orders2016.totalorderamount BETWEEN 
            customergroupthresholds.rangebottom AND 
            customergroupthresholds.rangetop 
ORDER  BY customerid 