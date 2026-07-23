/*
=========================================================
Project  : Retail Store SQL Project
Author   : Ajit Kumar
Level    : Level 3 - Aggregations
Database : MySQL
Description:
This file demonstrates SQL aggregate functions including
COUNT(), SUM(), AVG(), GROUP BY, DISTINCT, ROUND(),
ORDER BY, and aggregate reporting for business insights.
=========================================================
*/

-- =====================================================
-- Question 1
-- Count the total number of orders placed
-- =====================================================

SELECT
    COUNT(*) AS total_order
FROM
    orders;

-- =====================================================
-- Question 2
-- Calculate the total revenue collected from all orders
-- =====================================================

SELECT
    SUM(total_amount) AS total_revenue
FROM
    orders;

-- =====================================================
-- Question 3
-- Calculate the average order value
-- =====================================================

SELECT
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM
    orders;

-- =====================================================
-- Question 4
-- Count the number of customers
-- who have placed at least one order
-- =====================================================

SELECT
    COUNT(DISTINCT customer_id) AS customers_with_orders
FROM
    orders;

-- =====================================================
-- Question 5
-- Find the number of orders placed by each customer
-- =====================================================

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY
    customer_id
ORDER BY
    total_orders DESC;

-- =====================================================
-- Question 6
-- Find total sales amount made by each customer
-- =====================================================

SELECT
    customer_id,
    SUM(total_amount) AS total_sales
FROM
    orders
GROUP BY
    customer_id
ORDER BY
    total_sales DESC;

-- =====================================================
-- Question 7
-- List the number of products sold per category
-- =====================================================

SELECT
    p.category,
    SUM(oi.quantity) AS total_products_sold
FROM
    products AS p
INNER JOIN
    order_items AS oi
ON
    p.product_id = oi.product_id
GROUP BY
    p.category
ORDER BY
    total_products_sold DESC;

-- =====================================================
-- Question 8
-- Find the average product price per category
-- =====================================================

SELECT
    category,
    AVG(price) AS average_price
FROM
    products
GROUP BY
    category
ORDER BY
    average_price DESC;

-- =====================================================
-- Question 9
-- Show the number of orders placed per day
-- =====================================================

SELECT
    DATE(order_date) AS order_date,
    COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY
    DATE(order_date)
ORDER BY
    order_date;

-- =====================================================
-- Question 10
-- List total payments received
-- for each payment method
-- =====================================================

SELECT
    method AS payment_method,
    SUM(amount_paid) AS total_payments
FROM
    payments
GROUP BY
    method
ORDER BY
    total_payments DESC;

-- ========================= END OF LEVEL 3 =========================