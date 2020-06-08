SELECT E.employeeid, 
       E.lastname, 
       Count(*) AS TotalLateOrders 
FROM   orders O 
       JOIN employees E 
         ON O.employeeid = E.employeeid 
WHERE  O.requireddate <= O.shippeddate 
GROUP  BY E.employeeid, 
          E.lastname 
ORDER  BY totallateorders DESC; 