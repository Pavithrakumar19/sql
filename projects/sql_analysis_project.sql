ALTER TABLE zepto_v2
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE zepto_v2
MODIFY Category VARCHAR(100),
MODIFY name VARCHAR(150),
MODIFY mrp DECIMAL(10,2),
MODIFY discountPercent INT,
MODIFY availableQuantity INT,
MODIFY discountedSellingPrice DECIMAL(10,2),
MODIFY weightInGms INT,
MODIFY outOfStock BOOLEAN,
MODIFY quantity INT;

UPDATE zepto_v2
SET outOfStock =
CASE
    WHEN outOfStock = 'TRUE' THEN 1
    WHEN outOfStock = 'FALSE' THEN 0
END;

ALTER TABLE zepto_v2
MODIFY outOfStock BOOLEAN;
DESCRIBE zepto_v2;


#data exploration

#counting number of rows
select count(*) from zepto_v2;

#sample data from table
select * from zepto_v2 limit 10;

#null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

#different product categories
select distinct category from zepto_v2 order by Category;

#products out of stock VS IN STOCK
select outOfStock, count(id) from zepto_v2 group by outOfStock;

#product names present multiple times
SELECT name, COUNT(id)
FROM zepto_v2
GROUP BY name
HAVING count(id) > 1
ORDER BY count(id) DESC;

#data cleaning
SELECT * FROM zepto_v2
WHERE mrp = 0 OR discountedSellingPrice = 0;

delete from zepto_v2 where mrp=0;

#converting paise to rupees
UPDATE zepto_v2
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto_v2;

#analysis
#finding top 10 best value products
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;

#products with high mrp but outofstock
SELECT DISTINCT name,mrp
FROM zepto_v2
WHERE outOfStock = 1
ORDER BY mrp DESC limit 10;

#Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_v2
GROUP BY category
ORDER BY total_revenue;

#Find all products where mrp is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

#Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_v2
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

#Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto_v2
GROUP BY category
ORDER BY total_weight;



