with Countries AS (
  SELECT 
    country 
  FROM 
    suppliers 
  UNION 
  SELECT 
    country 
  FROM 
    customers
), 
SupplierCountry AS (
  SELECT 
    distinct country 
  FROM 
    suppliers
), 
CustomerCountry AS (
  SELECT 
    distinct country 
  FROM 
    customers
) 
SELECT 
  sp.country as suplier_country, 
  cp.country as customer_country 
FROM 
  Countries C 
  LEFT JOIN SupplierCountry SP on C.Country = SP.Country 
  LEFT JOIN Customercountry CP on C.Country = CP.Country
