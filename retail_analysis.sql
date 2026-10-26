USE retail_analysis;
DESCRIBE retail_sales;
SELECT * FROM retail_sales;
INSERT INTO retail_sales
(Order_ID, Order_Date, Product, Category, Region, Quantity, Sales_Amount, Profit)
VALUES
(3, '2026-01-05', 'Laptop', 'Electronics', 'Hyderabad', 2, 80000, 12000);
SELECT * FROM retail_sales;
SELECT *
FROM retail_sales
WHERE Product = 'Laptop';
SELECT Order_ID FROM retail_sales;
SELECT *
FROM retail_sales
WHERE Product = 'Laptop';
SELECT *
FROM retail_sales
ORDER BY Sales_Amount DESC;
SELECT SUM(Sales_Amount) AS Total_Sales
FROM retail_sales;
SELECT COUNT(*) AS Total_Orders
FROM retail_sales;
SELECT AVG(Sales_Amount) AS Average_Sales
FROM retail_sales;
SELECT MAX(Sales_Amount) AS Highest_Sale
FROM retail_sales;
SELECT MIN(Sales_Amount) AS Lowest_Sale
FROM retail_sales;
SELECT Product, SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
GROUP BY Product;
SELECT Product, COUNT(*) AS Total_Orders
FROM retail_sales
GROUP BY Product;
SELECT Product, SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
GROUP BY Product
HAVING SUM(Sales_Amount) > 100000;
SELECT DISTINCT Product
FROM retail_sales;
SELECT *
FROM retail_sales
WHERE Product LIKE 'Lap%';
SELECT *
FROM retail_sales
WHERE Product IN ('Laptop', 'Mouse');
SELECT *
FROM retail_sales
WHERE Sales_Amount BETWEEN 50000 AND 90000;
INSERT INTO retail_sales
(Order_ID, Order_Date, Product, Category, Region,
 Quantity, Sales_Amount, Profit)
VALUES
(101, '2026-01-10', 'Mouse', 'Accessories', 'Hyderabad', 5, 2500, 500),
(102, '2026-01-12', 'Keyboard', 'Accessories', 'Warangal', 3, 4500, 900),
(103, '2026-02-05', 'Monitor', 'Electronics', 'Hyderabad', 2, 20000, 3000),
(104, '2026-02-15', 'Laptop', 'Electronics', 'Nirmal', 1, 60000, 8000),
(105, '2026-03-02', 'Mouse', 'Accessories', 'Warangal', 2, 1000, 200);
SELECT * FROM retail_sales;
SELECT Product, SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
GROUP BY Product
ORDER BY Total_Sales DESC;
SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT Product, SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Product
ORDER BY Total_Profit DESC;
SELECT Product, SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
WHERE Region = 'Hyderabad'
GROUP BY Product
ORDER BY Total_Sales DESC;
SELECT
    Order_ID,
    Product,
    Sales_Amount,
    CASE
        WHEN Sales_Amount >= 50000 THEN 'High Sales'
        ELSE 'Low Sales'
    END AS Sales_Category
FROM retail_sales;
SELECT
    SUM(CASE
        WHEN Sales_Amount >= 50000 THEN 1
        ELSE 0
    END) AS High_Sales_Orders
FROM retail_sales;
UPDATE retail_sales
SET Quantity = 3
WHERE Order_ID = 105;
SELECT * FROM retail_sales
WHERE Order_ID = 105;
DELETE FROM retail_sales
WHERE Order_ID = 105;
SELECT *
FROM retail_sales
ORDER BY Sales_Amount DESC
LIMIT 3;
SELECT ROUND(AVG(Sales_Amount), 2) AS Average_Sales
FROM retail_sales;
SELECT ROUND(AVG(Profit), 2) AS Average_Profit
FROM retail_sales;
SELECT
    Product,
    COALESCE(Profit, 0) AS Profit
FROM retail_sales;
SELECT
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales_Amount), 2
    ) AS Profit_Margin_Percent
FROM retail_sales;
SELECT
    Category,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Category
ORDER BY Total_Sales DESC;
CREATE TABLE customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Region VARCHAR(50)
);
INSERT INTO customers (Customer_ID, Customer_Name, Region)
VALUES
(1, 'Ravi', 'Hyderabad'),
(2, 'Priya', 'Warangal'),
(3, 'Kiran', 'Nirmal'),
(4, 'Anu', 'Hyderabad');
SELECT
    r.Order_ID,
    r.Product,
    r.Region,
    c.Customer_Name
FROM retail_sales r
INNER JOIN customers c
    ON r.Region = c.Region;
    SELECT
    r.Order_ID,
    r.Product,
    r.Region,
    c.Customer_Name
FROM retail_sales r
LEFT JOIN customers c
    ON r.Region = c.Region;
    SELECT
    c.Customer_Name,
    c.Region,
    r.Order_ID,
    r.Product
FROM retail_sales r
RIGHT JOIN customers c
    ON r.Region = c.Region;
    SELECT Region
FROM retail_sales
UNION
SELECT Region
FROM customers;
SELECT Region
FROM retail_sales
UNION ALL
SELECT Region
FROM customers;
SELECT Order_ID, Product, Sales_Amount
FROM retail_sales
WHERE Sales_Amount > (
    SELECT AVG(Sales_Amount)
    FROM retail_sales
);
SELECT
    CASE
        WHEN Sales_Amount >= 50000 THEN 'High Sales'
        ELSE 'Low Sales'
    END AS Sales_Category,
    COUNT(*) AS Total_Orders,
    SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
GROUP BY
    CASE
        WHEN Sales_Amount >= 50000 THEN 'High Sales'
        ELSE 'Low Sales'
    END;
    SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Sales_Month;
SELECT Order_ID, Order_Date, Product, Sales_Amount
FROM retail_sales
WHERE YEAR(Order_Date) = 2026;
SELECT Order_ID, Order_Date, Product, Sales_Amount
FROM retail_sales
WHERE MONTH(Order_Date) = 1;
SELECT
    MONTHNAME(Order_Date) AS Sales_Month,
    SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY MONTH(Order_Date);
SELECT *
FROM retail_sales
WHERE Profit IS NULL;
SELECT *
FROM retail_sales
WHERE Profit IS NOT NULL;
SELECT COUNT(DISTINCT Product) AS Unique_Products
FROM retail_sales;
SELECT
    CONCAT(Product, ' - ', Region) AS Product_Region,
    Sales_Amount
FROM retail_sales;
SELECT
    Product,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales_Amount), 2) AS Profit_Margin
FROM retail_sales
GROUP BY Product
ORDER BY Profit_Margin DESC;
SELECT
    Product,
    SUM(Sales_Amount) AS Total_Sales,
    RANK() OVER (
        ORDER BY SUM(Sales_Amount) DESC
    ) AS Sales_Rank
FROM retail_sales
GROUP BY Product;
SELECT
    Product,
    SUM(Sales_Amount) AS Total_Sales,
    ROW_NUMBER() OVER (
        ORDER BY SUM(Sales_Amount) DESC
    ) AS Row_Num
FROM retail_sales
GROUP BY Product;
SELECT
    Product,
    Total_Sales,
    DENSE_RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Dense_Rank
FROM (
    SELECT
        Product,
        SUM(Sales_Amount) AS Total_Sales
    FROM retail_sales
    GROUP BY Product
) AS sales_summary;
SELECT VERSION();
SELECT
    Product,
    Total_Sales,
    DENSE_RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS `Dense_Rank`
FROM (
    SELECT
        Product,
        SUM(Sales_Amount) AS Total_Sales
    FROM retail_sales
    GROUP BY Product
) AS sales_summary;
WITH product_sales AS (
    SELECT
        Product,
        SUM(Sales_Amount) AS Total_Sales
    FROM retail_sales
    GROUP BY Product
)
SELECT *
FROM product_sales
ORDER BY Total_Sales DESC;
WITH product_sales AS (
    SELECT
        Product,
        SUM(Sales_Amount) AS Total_Sales
    FROM retail_sales
    GROUP BY Product
)
SELECT
    Product,
    Total_Sales,
    LAG(Total_Sales) OVER (
        ORDER BY Total_Sales DESC
    ) AS Previous_Sales
FROM product_sales;
WITH product_sales AS (
    SELECT
        Product,
        SUM(Sales_Amount) AS Total_Sales
    FROM retail_sales
    GROUP BY Product
)
SELECT
    Product,
    Total_Sales,
    LEAD(Total_Sales) OVER (
        ORDER BY Total_Sales DESC
    ) AS Next_Sales
FROM product_sales;
WITH product_sales AS (
    SELECT Product, SUM(Sales_Amount) AS Total_Sales
    FROM retail_sales
    GROUP BY Product
)
SELECT
    Product,
    Total_Sales,
    LEAD(Total_Sales) OVER (
        ORDER BY Total_Sales DESC
    ) AS Next_Sales
FROM product_sales;
SELECT
    Region,
    Product,
    SUM(Sales_Amount) AS Total_Sales,
    RANK() OVER (
        PARTITION BY Region
        ORDER BY SUM(Sales_Amount) DESC
    ) AS Product_Rank
FROM retail_sales
GROUP BY Region, Product
ORDER BY Region, Product_Rank;
SELECT
    Order_Date,
    Product,
    Sales_Amount,
    SUM(Sales_Amount) OVER (
        ORDER BY Order_Date, Order_ID
    ) AS Running_Total
FROM retail_sales;
WITH monthly_sales AS (
    SELECT
        YEAR(Order_Date) AS Sales_Year,
        MONTH(Order_Date) AS Sales_Month,
        SUM(Sales_Amount) AS Total_Sales
    FROM retail_sales
    GROUP BY YEAR(Order_Date), MONTH(Order_Date)
),
sales_comparison AS (
    SELECT
        Sales_Year,
        Sales_Month,
        Total_Sales,
        LAG(Total_Sales) OVER (
            ORDER BY Sales_Year, Sales_Month
        ) AS Previous_Month_Sales
    FROM monthly_sales
)
SELECT
    Sales_Year,
    Sales_Month,
    Total_Sales,
    Previous_Month_Sales,
    ROUND(
        (Total_Sales - Previous_Month_Sales)
        / NULLIF(Previous_Month_Sales, 0) * 100,
        2
    ) AS Growth_Percentage
FROM sales_comparison;
WITH region_sales AS (
    SELECT
        Region,
        Product,
        SUM(Sales_Amount) AS Total_Sales
    FROM retail_sales
    GROUP BY Region, Product
),
ranked_products AS (
    SELECT
        Region,
        Product,
        Total_Sales,
        DENSE_RANK() OVER (
            PARTITION BY Region
            ORDER BY Total_Sales DESC
        ) AS Product_Rank
    FROM region_sales
)
SELECT
    Region,
    Product,
    Total_Sales,
    Product_Rank
FROM ranked_products
WHERE Product_Rank <= 2
ORDER BY Region, Product_Rank;
SELECT
    Product,
    SUM(Sales_Amount) AS Total_Sales,
    ROUND(
        SUM(Sales_Amount) * 100.0
        / SUM(SUM(Sales_Amount)) OVER (),
        2
    ) AS Sales_Percentage
FROM retail_sales
GROUP BY Product
ORDER BY Total_Sales DESC;
SELECT
    Order_ID,
    COUNT(*) AS Total_Count
FROM retail_sales
GROUP BY Order_ID
HAVING COUNT(*) > 1;
SELECT *
FROM retail_sales
WHERE Order_Date IS NULL
   OR Product IS NULL
   OR Region IS NULL
   OR Quantity IS NULL
   OR Sales_Amount IS NULL
   OR Profit IS NULL;
   SELECT
    Order_ID,
    Product,
    Profit,
    COALESCE(Profit, 0) AS Profit_Cleaned
FROM retail_sales;
SELECT
    Product,
    TRIM(Product) AS Clean_Product
FROM retail_sales;
SELECT
    Product,
    UPPER(Product) AS Upper_Product,
    LOWER(Product) AS Lower_Product
FROM retail_sales;
SELECT
    Product,
    SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 1 OFFSET 1;

SELECT Product, SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 1;

SELECT Region, SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Region
ORDER BY Total_Profit DESC;

SELECT
    SUM(Profit) AS Total_Profit,
    SUM(Sales) AS Total_Sales,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Percentage
FROM retail_sales;
SELECT
    Product,
    SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 1 OFFSET 1;

SELECT
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Percentage
FROM retail_sales
GROUP BY Product
ORDER BY Profit_Margin_Percentage DESC;

SHOW COLUMNS FROM retail_sales;

SELECT
    Product,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales_Amount),
        2
    ) AS Profit_Margin_Percentage
FROM retail_sales
GROUP BY Product
ORDER BY Profit_Margin_Percentage DESC;

SELECT
    Category,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Sales_Month;

SELECT
    Product,
    SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 3;

SELECT
    Order_ID,
    COUNT(*) AS Total_Count
FROM retail_sales
GROUP BY Order_ID
HAVING COUNT(*) > 1;

SELECT
    SUM(Sales_Amount) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    COUNT(*) AS Total_Orders,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales_Amount),
        2
    ) AS Profit_Margin_Percentage
FROM retail_sales;

SELECT
    Product,
    SUM(Sales_Amount) AS Total_Sales,
    CASE
        WHEN SUM(Sales_Amount) >= 100000 THEN 'High Sales'
        WHEN SUM(Sales_Amount) >= 10000 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS Sales_Category
FROM retail_sales
GROUP BY Product
ORDER BY Total_Sales DESC;

SELECT
    Product,
    SUM(Sales_Amount) AS Total_Sales,
    ROUND(
        SUM(Sales_Amount) * 100.0 /
        (SELECT SUM(Sales_Amount) FROM retail_sales),
        2
    ) AS Sales_Contribution_Percentage
FROM retail_sales
GROUP BY Product
ORDER BY Sales_Contribution_Percentage DESC;

SELECT
    Product,
    SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Product
HAVING SUM(Profit) >= 0
ORDER BY Total_Profit DESC;

SELECT
    Order_ID,
    Order_Date,
    Product,
    Sales_Amount,
    Profit
FROM retail_sales
WHERE Profit < 0;

SELECT
    Region,
    Product,
    SUM(Sales_Amount) AS Total_Sales
FROM retail_sales
GROUP BY Region, Product
ORDER BY Region, Total_Sales DESC;

WITH Regional_Sales AS (
    SELECT
        Region,
        Product,
        SUM(Sales_Amount) AS Total_Sales
    FROM retail_sales
    GROUP BY Region, Product
),
Ranked_Sales AS (
    SELECT
        Region,
        Product,
        Total_Sales,
        ROW_NUMBER() OVER (
            PARTITION BY Region
            ORDER BY Total_Sales DESC
        ) AS Product_Rank
    FROM Regional_Sales
)
SELECT
    Region,
    Product,
    Total_Sales
FROM Ranked_Sales
WHERE Product_Rank = 1;

SELECT
    Product,
    Category,
    SUM(Quantity) AS Total_Quantity,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales_Amount),
        2
    ) AS Profit_Margin
FROM retail_sales
GROUP BY Product, Category
ORDER BY Total_Sales DESC;

SELECT
    Product,
    SUM(Quantity) AS Total_Quantity_Sold
FROM retail_sales
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC;

SELECT
    Region,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales_Amount),
        2
    ) AS Profit_Margin
FROM retail_sales
GROUP BY Region
ORDER BY Total_Sales DESC;

















