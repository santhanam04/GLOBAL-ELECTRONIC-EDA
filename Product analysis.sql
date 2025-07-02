SELECT 
  p.`Product Name`,
  SUM(s.Quantity) AS total_quantity_sold
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY p.`Product Name`
ORDER BY total_quantity_sold DESC
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
  `Product Name`,
  ROUND((`Unit Price USD` - `Unit Cost USD`) / `Unit Cost USD` * 100, 2) AS profit_margin_percent
FROM df1
WHERE `Unit Cost USD` > 0
ORDER BY profit_margin_percent DESC
LIMIT 10;

SELECT 
  Brand,
  SUM(s.Quantity) AS total_quantity
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY Brand
ORDER BY total_quantity DESC;

SELECT 
  p.Category,
  SUM(s.Quantity * p.`Unit Price USD`) AS total_revenue
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY p.Category
ORDER BY total_revenue DESC;

SELECT 
  p.Subcategory,
  SUM(s.Quantity * p.`Unit Price USD`) AS total_revenue
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY p.Subcategory
ORDER BY total_revenue DESC;

SELECT 
  p.`Product Name`,
  ROUND(SUM(s.Quantity * p.`Unit Price USD`) / COUNT(DISTINCT s.`Order Number`), 2) AS avg_revenue_per_order
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY p.`Product Name`
ORDER BY avg_revenue_per_order DESC
LIMIT 10;

SELECT 
  p.Color,
  SUM(s.Quantity) AS total_quantity
FROM df2 s
JOIN df1 p ON s.ProductKey = p.ProductKey
GROUP BY p.Color
ORDER BY total_quantity DESC;

SELECT 
  `Product Name`
FROM df1
WHERE ProductKey NOT IN (SELECT DISTINCT ProductKey FROM df2);

SELECT 
  p.`Product Name`
FROM df1 p
LEFT JOIN df2 s ON s.ProductKey = p.ProductKey
GROUP BY p.ProductKey, p.`Product Name`
HAVING SUM(s.Quantity) IS NULL OR SUM(s.Quantity) = 0
LIMIT 10;
