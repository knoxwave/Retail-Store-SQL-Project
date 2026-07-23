/*
=========================================================
Project  : Retail Store SQL Project
Author   : Ajit Kumar
Level    : Level 5 - Subqueries (Inner Queries)
Database : MySQL
Description:
This file demonstrates SQL Subqueries including
Single-Row Subqueries, Multi-Row Subqueries,
Correlated Subqueries, IN, NOT IN,
Aggregate Subqueries, and Business Reporting.
=========================================================
*/

-- =====================================================
-- Question 1
-- List all products priced above the average product price
-- =====================================================

SELECT
    product_id,
    name AS product_name,
    category,
    price
FROM
    products
WHERE
    price >
(
    SELECT
        AVG(price)
    FROM
        products
);

-- =====================================================
-- Question 2
-- Find customers who have placed at least one order
-- =====================================================

SELECT
    customer_id,
    name AS customer_name,
    email,
    phone
FROM
    customers
WHERE
    customer_id IN
(
    SELECT
        customer_id
    FROM
        orders
);

-- =====================================================
-- Question 3
-- Show orders whose total amount is above the
-- average order value for the same customer
-- (Correlated Subquery)
-- =====================================================

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount
FROM
    orders AS o
WHERE
    o.total_amount >
(
    SELECT
        AVG(o2.total_amount)
    FROM
        orders AS o2
    WHERE
        o2.customer_id = o.customer_id
);

-- =====================================================
-- Question 4
-- Display customers who haven't placed any orders
-- =====================================================

SELECT
    customer_id,
    name AS customer_name,
    email,
    phone
FROM
    customers
WHERE
    customer_id NOT IN
(
    SELECT
        customer_id
    FROM
        orders
);

-- =====================================================
-- Question 5
-- Display products that have never been ordered
-- =====================================================

SELECT
    product_id,
    name AS product_name,
    category,
    price,
    stock_quantity
FROM
    products
WHERE
    product_id NOT IN
(
    SELECT
        product_id
    FROM
        order_items
);

-- =====================================================
-- Question 6
-- Display the highest-value order placed
-- by each customer
-- (Correlated Subquery)
-- =====================================================

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount
FROM
    orders AS o
WHERE
    o.total_amount =
(
    SELECT
        MAX(o2.total_amount)
    FROM
        orders AS o2
    WHERE
        o2.customer_id = o.customer_id
);

-- =====================================================
-- Question 7
-- Display the highest-value order for each customer
-- including customer details
-- =====================================================

SELECT
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM
    customers AS c
INNER JOIN
    orders AS o
ON
    c.customer_id = o.customer_id
WHERE
    o.total_amount =
(
    SELECT
        MAX(o2.total_amount)
    FROM
        orders AS o2
    WHERE
        o2.customer_id = o.customer_id
)
ORDER BY
    c.customer_id;

-- ========================= END OF LEVEL 5 =========================