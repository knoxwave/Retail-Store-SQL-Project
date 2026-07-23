
/*
=========================================================
Project  : Retail Store SQL Project
Author   : Ajit Kumar
Level    : Level 4 - Multi-Table Queries (JOINS)
Database : MySQL
Description:
This file demonstrates SQL JOIN operations including
INNER JOIN, LEFT JOIN, RIGHT JOIN, and Multi-Table JOINs
to retrieve meaningful business insights from related tables.
=========================================================
*/

-- =====================================================
-- Question 1
-- Retrieve order details along with customer information
-- using INNER JOIN
-- =====================================================

SELECT
    o.order_id,
    c.customer_id,
    c.name AS customer_name,
    o.order_date,
    o.status,
    o.total_amount
FROM
    orders AS o
INNER JOIN
    customers AS c
ON
    o.customer_id = c.customer_id;

-- =====================================================
-- Question 2
-- Retrieve products that have been sold
-- using INNER JOIN with order_items
-- =====================================================

SELECT
    p.product_id,
    p.name AS product_name,
    p.category,
    p.price
FROM
    products AS p
INNER JOIN
    order_items AS oi
ON
    p.product_id = oi.product_id;

-- =====================================================
-- Question 3
-- List all orders along with their payment details
-- using INNER JOIN
-- =====================================================

SELECT
    o.order_id,
    o.order_date,
    o.status,
    o.total_amount,
    p.payment_id,
    p.method AS payment_method,
    p.amount_paid,
    p.payment_date
FROM
    orders AS o
INNER JOIN
    payments AS p
ON
    o.order_id = p.order_id;

-- =====================================================
-- Question 4
-- Display every customer and their orders
-- using LEFT JOIN
-- =====================================================

SELECT
    c.customer_id,
    c.name AS customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.status,
    o.total_amount
FROM
    customers AS c
LEFT JOIN
    orders AS o
ON
    c.customer_id = o.customer_id
ORDER BY
    c.customer_id;

-- =====================================================
-- Question 5
-- Display every product with ordered quantity
-- using LEFT JOIN
-- =====================================================

SELECT
    p.product_id,
    p.name AS product_name,
    p.category,
    p.price,
    oi.quantity
FROM
    products AS p
LEFT JOIN
    order_items AS oi
ON
    p.product_id = oi.product_id
ORDER BY
    p.product_id;

-- =====================================================
-- Question 6
-- Display all payments including those
-- without matching order records
-- using RIGHT JOIN
-- =====================================================

SELECT
    o.order_id,
    o.order_date,
    o.status,
    p.payment_id,
    p.payment_date,
    p.method AS payment_method,
    p.amount_paid
FROM
    orders AS o
RIGHT JOIN
    payments AS p
ON
    o.order_id = p.order_id
ORDER BY
    p.payment_id;

-- =====================================================
-- Question 7
-- Combine customer, order, and payment details
-- using multiple INNER JOINs
-- =====================================================

SELECT
    c.customer_id,
    c.name AS customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.status,
    o.total_amount,
    p.payment_id,
    p.payment_date,
    p.method AS payment_method,
    p.amount_paid
FROM
    customers AS c
INNER JOIN
    orders AS o
ON
    c.customer_id = o.customer_id
INNER JOIN
    payments AS p
ON
    o.order_id = p.order_id
ORDER BY
    o.order_id;

-- ========================= END OF LEVEL 4 =========================