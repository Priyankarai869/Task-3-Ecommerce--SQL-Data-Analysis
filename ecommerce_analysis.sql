1. Basic SELECT Query with WHERE, GROUP BY, and ORDER BY

-- Query 1: Total sales per product category for 2018
SELECT Product_Category, SUM(Sales) AS Total_Sales
FROM ecommerce_order
WHERE Order_Date BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY Product_Category
ORDER BY Total_Sales DESC LIMIT 50;

2. Using INNER JOIN

-- Query 2: Order details with customer information using INNER JOIN
SELECT 
    o1.Customer_Id,
    o1.Order_Date,
    o1.Product_Category,
    o1.Sales,
    o2.Sales AS Previous_Sale
FROM ecommerce_order o1
INNER JOIN ecommerce_order o2 
    ON o1.Customer_Id = o2.Customer_Id
    AND o1.Order_Date > o2.Order_Date
ORDER BY o1.Customer_Id, o1.Order_Date
LIMIT 50;

3. Using Subqueries

-- Query 3: Order with sales greater than the average sales
SELECT Customer_ID, Sales
FROM ecommerce_order
WHERE Sales > (SELECT AVG(Sales) FROM ecommerce_order) LIMIT 50;

4. Using Aggregate Functions (SUM, AVG)

-- Query 4: Calculate the average sales and total sales per product
SELECT Product, AVG(Sales) AS Avg_Sales, SUM(Sales) AS Total_Sales
FROM ecommerce_order
GROUP BY Product;

5. Create a View for Total Sales per Product Category

-- Query 5: Create a view to summarize total sales per product category
CREATE VIEW product_sales_summary AS
SELECT Product_Category, SUM(Sales) AS Total_Sales
FROM ecommerce_order
GROUP BY Product_Category;

6. Optimize Queries with Index Creation

-- Query 6: Create an index on Order_Date for faster query performance

