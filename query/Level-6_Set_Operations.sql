/*
=========================================================
Project  : Retail Store SQL Project
Author   : Ajit Kumar
Level    : Level 6 - Set Operations
Database : MySQL
Description:
This file demonstrates SQL Set Operations including
UNION and an INTERSECT equivalent using INNER JOIN,
as supported in MySQL.
=========================================================
*/

-- =====================================================
-- Question 1
-- List all customers who have either placed an order
-- OR written a product review
-- (UNION removes duplicate records)
-- =====================================================

SELECT
    c.customer_id,
    c.name AS customer_name,
    c.email
FROM
    customers AS c
INNER JOIN
    orders AS o
ON
    c.customer_id = o.customer_id

UNION

SELECT
    c.customer_id,
    c.name AS customer_name,
    c.email
FROM
    customers AS c
INNER JOIN
    product_reviews AS pr
ON
    c.customer_id = pr.customer_id;

-- =====================================================
-- Question 2
-- List all customers who have placed an order
-- AND also reviewed a product
-- (MySQL does not support INTERSECT directly,
-- so INNER JOIN is used instead.)
-- =====================================================

SELECT DISTINCT
    c.customer_id,
    c.name AS customer_name,
    c.email
FROM
    customers AS c
INNER JOIN
    orders AS o
ON
    c.customer_id = o.customer_id
INNER JOIN
    product_reviews AS pr
ON
    c.customer_id = pr.customer_id;

-- ========================= END OF LEVEL 6 =========================