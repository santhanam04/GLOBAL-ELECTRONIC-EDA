SELECT 
  DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
  SUM(Quantity) AS total_units
FROM df2
GROUP BY month
ORDER BY month;

SELECT 
  YEAR(`Order Date`) AS year,
  COUNT(DISTINCT `Order Number`) AS total_orders
FROM df2
GROUP BY year
ORDER BY year;

SELECT 
  DAYNAME(`Order Date`) AS day_of_week,
  COUNT(*) AS total_orders
FROM df2
GROUP BY day_of_week;

SELECT 
  ProductKey,
  SUM(Quantity) AS total_sold
FROM df2
GROUP BY ProductKey
ORDER BY total_sold DESC
LIMIT 10;

SELECT 
  StoreKey,
  SUM(Quantity) AS total_units_sold
FROM df2
GROUP BY StoreKey
ORDER BY total_units_sold DESC;

SELECT 
  StoreKey,
  COUNT(DISTINCT `Order Number`) AS total_orders
FROM df2
GROUP BY StoreKey
ORDER BY total_orders DESC;

SELECT 
  `Currency Code`,
  SUM(Quantity) AS total_units
FROM df2
GROUP BY `Currency Code`
ORDER BY total_units DESC;

SELECT 
  AVG(DATEDIFF(`Delivery Date`, `Order Date`)) AS avg_delivery_days
FROM df2
WHERE `Delivery Date` IS NOT NULL;

SELECT 
  DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
  COUNT(DISTINCT `Order Number`) AS orders_this_month,
  LAG(COUNT(DISTINCT `Order Number`)) OVER (ORDER BY DATE_FORMAT(`Order Date`, '%Y-%m')) AS previous_month_orders
FROM df2
GROUP BY month;

SELECT 
  ProductKey,
  SUM(Quantity) AS quantity_last_30_days
FROM df2
WHERE `Order Date` >= CURDATE() - INTERVAL 30 DAY
GROUP BY ProductKey
ORDER BY quantity_last_30_days DESC
LIMIT 10;

SELECT 
  StoreKey,
  ProductKey,
  COUNT(*) AS product_order_count
FROM df2
GROUP BY StoreKey, ProductKey
ORDER BY StoreKey, product_order_count DESC;
