SELECT E.employeeid, 
       E.lastname, 
       O.orderid, 
       P.productname, 
       D.quantity 
FROM   orders AS O 
       JOIN orderdetails D 
         ON O.orderid = D.orderid 
       JOIN products P 
         ON D.productid = P.productid 
       JOIN employees E 
         ON O.employeeid = E.employeeid 