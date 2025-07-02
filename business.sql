SELECT 
  Gender,
  FLOOR(TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) / 10) * 10 AS age_group,
  COUNT(*) AS total_customers
FROM df
GROUP BY Gender, age_group
ORDER BY age_group, Gender;

SELECT 
  p.`Product Name`,
  SUM(s.Quantity) AS total_quantity,
  SUM(s.Quantity * p.`Unit Price USD`) AS total_revenue
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY p.`Product Name`
ORDER BY total_revenue DESC
LIMIT 10;

SELECT 
  DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
  SUM(s.Quantity * p.`Unit Price USD`) AS total_revenue
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY month
ORDER BY month;

SELECT 
  d.Gender,
  d.Country,
  FLOOR(TIMESTAMPDIFF(YEAR, d.Birthday, CURDATE()) / 10) * 10 AS age_group,
  SUM(s.Quantity * p.`Unit Price USD`) AS revenue
FROM df2 s
JOIN df d ON s.CustomerKey = d.CustomerKey
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY d.Gender, d.Country, age_group
ORDER BY revenue DESC
LIMIT 10;

SELECT 
  st.StoreKey,
  st.`Square Meters`,
  SUM(s.Quantity * p.`Unit Price USD`) AS total_revenue,
  ROUND(SUM(s.Quantity * p.`Unit Price USD`) / st.`Square Meters`, 2) AS revenue_per_sq_meter
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
JOIN df3 st ON s.StoreKey = st.StoreKey
GROUP BY st.StoreKey, st.`Square Meters`
ORDER BY revenue_per_sq_meter DESC
LIMIT 10;


SELECT 
  s.CustomerKey,
  ROUND(SUM(p.`Unit Price USD` * s.Quantity) / COUNT(DISTINCT s.`Order Number`), 2) AS avg_order_value
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY s.CustomerKey
ORDER BY avg_order_value DESC
LIMIT 10;

SELECT 
  p.`Product Name`,
  SUM(s.Quantity * (p.`Unit Price USD` - p.`Unit Cost USD`)) AS total_profit
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY p.`Product Name`
ORDER BY total_profit DESC
LIMIT 10;

SELECT 
  s.`Currency Code`,
  SUM(s.Quantity * p.`Unit Price USD`) AS total_sales
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY s.`Currency Code`
ORDER BY total_sales DESC;

SELECT 
  p.Category,
  p.Subcategory,
  SUM(s.Quantity * p.`Unit Price USD`) AS category_revenue
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY p.Category, p.Subcategory
ORDER BY category_revenue DESC;

SELECT 
  st.Country,
  st.State,
  SUM(s.Quantity * p.`Unit Price USD`) AS total_sales
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
JOIN df3 st ON s.StoreKey = st.StoreKey
GROUP BY st.Country, st.State
ORDER BY total_sales DESC;
