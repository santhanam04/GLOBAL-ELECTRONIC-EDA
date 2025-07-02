SELECT 
  s.StoreKey,
  SUM(s.Quantity) AS total_units_sold
FROM df2 s
GROUP BY s.StoreKey
ORDER BY total_units_sold DESC;

SELECT 
  d.StoreKey,
  d.`Square Meters`,
  SUM(s.Quantity) / d.`Square Meters` AS units_per_sq_meter
FROM df2 s
JOIN df3 d ON s.StoreKey = d.StoreKey
GROUP BY d.StoreKey, d.`Square Meters`
ORDER BY units_per_sq_meter DESC;

SELECT 
  d.Country,
  SUM(s.Quantity) AS total_quantity
FROM df2 s
JOIN df3 d ON s.StoreKey = d.StoreKey
GROUP BY d.Country
ORDER BY total_quantity DESC;

SELECT 
  d.State,
  SUM(s.Quantity) AS total_quantity
FROM df2 s
JOIN df3 d ON s.StoreKey = d.StoreKey
GROUP BY d.State
ORDER BY total_quantity DESC;

SELECT 
  StoreKey,
  `Square Meters`
FROM df3
ORDER BY `Square Meters` DESC
LIMIT 10;

SELECT 
  StoreKey,
  `Open Date`
FROM df3
ORDER BY `Open Date` DESC
LIMIT 10;

SELECT 
  StoreKey,
  `Open Date`
FROM df3
ORDER BY `Open Date` ASC
LIMIT 10;

SELECT 
  Country,
  AVG(`Square Meters`) AS avg_store_size
FROM df3
GROUP BY Country
ORDER BY avg_store_size DESC;

SELECT 
  d.StoreKey,
  SUM(s.Quantity) / TIMESTAMPDIFF(YEAR, d.`Open Date`, CURDATE()) AS avg_units_per_year
FROM df2 s
JOIN df3 d ON s.StoreKey = d.StoreKey
GROUP BY d.StoreKey, d.`Open Date`
HAVING TIMESTAMPDIFF(YEAR, d.`Open Date`, CURDATE()) > 0
ORDER BY avg_units_per_year DESC;

SELECT 
  Country,
  State,
  COUNT(*) AS total_stores
FROM df3
GROUP BY Country, State
ORDER BY total_stores DESC;
