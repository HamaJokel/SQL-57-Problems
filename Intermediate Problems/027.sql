-- This query is incorrect since France should be the third country. Easier to just reformat the date filter as
-- 'WHERE YEAR(OrderDate) = 2015 since it includes ALL orders from 2015, and not those 'less' than 2015-12-31'

SELECT TOP 3 shipcountry, 
             AverageFreight = Avg(freight) 
FROM   orders 
WHERE  orderdate BETWEEN '1/1/2015' AND '12/31/2015' 
GROUP  BY shipcountry 
ORDER  BY averagefreight DESC; 