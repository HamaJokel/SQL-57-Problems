WITH cte 
     AS (SELECT c.CustomerID, 
                c.CompanyName, 
                TotalsWithoutDiscount = Sum(od.quantity * od.unitprice), 
                TotalsWithDiscount = Sum(od.quantity * od.unitprice * 
                                         ( 1 - od.discount )) 
         FROM   customers c 
                JOIN orders o 
                  ON c.customerid = o.customerid 
                JOIN orderdetails od 
                  ON o.orderid = od.orderid 
         WHERE  Year(o.orderdate) = 2016 
         GROUP  BY c.customerid, 
                   c.companyname) 
SELECT * 
FROM   cte 
WHERE  TotalsWithDiscount >= 10000 
ORDER  BY TotalsWithDiscount DESC 