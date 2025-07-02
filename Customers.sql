SELECT Gender, COUNT(*) AS total_customers
FROM df
GROUP BY Gender;

SELECT Country, COUNT(*) AS total_customers
FROM df
GROUP BY Country
ORDER BY total_customers DESC;

SELECT Continent, COUNT(*) AS total_customers
FROM df
GROUP BY Continent
ORDER BY total_customers DESC;

SELECT State, Gender, COUNT(*) AS total_customers
FROM df
GROUP BY State, Gender
ORDER BY State, Gender;

SELECT CustomerKey, Name, Gender, City, State, Country
FROM df
WHERE City = 'New York';

SELECT "Zip Code", COUNT(*) AS total_customers
FROM df
GROUP BY "Zip Code"
ORDER BY total_customers DESC;

SELECT 
  MIN(Birthday) AS oldest_birthday,
  MAX(Birthday) AS youngest_birthday
FROM df;

SELECT "State Code", COUNT(*) AS total_customers
FROM df
GROUP BY "State Code"
ORDER BY total_customers DESC;

SELECT AVG(TIMESTAMPDIFF(YEAR, Birthday, CURDATE())) AS average_age FROM df;

SELECT 
  FLOOR(TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) / 10) * 10 AS age_group,
  COUNT(*) AS total_customers
FROM df
GROUP BY age_group
ORDER BY age_group;








