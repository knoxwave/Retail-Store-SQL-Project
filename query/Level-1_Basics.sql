/*
=========================================================
Project  : Retail Store SQL Project
Author   : Ajit Kumar
Level    : Level 1 - Basics
Database : MySQL
Description:
This file contains basic SQL queries used for retrieving,
filtering, and sorting data from the Retail Store database.
=========================================================
*/

-- =====================================================
-- Question 1
-- Retrieve customer names and emails for email marketing
-- =====================================================

SELECT
    name,
    email
FROM
    customers;

-- =====================================================
-- Question 2
-- View complete product catalog with all available details
-- =====================================================

SELECT
    *
FROM
    products;

-- =====================================================
-- Question 3
-- List all unique product categories
-- =====================================================

SELECT
    DISTINCT category
FROM
    products;

-- =====================================================
-- Question 4
-- Show all products priced above ₹1,000
-- =====================================================

SELECT
    *
FROM
    products
WHERE
    price > 1000;

-- =====================================================
-- Question 5
-- Display products within a mid-range price bracket
-- (₹2,000 to ₹5,000)
-- =====================================================

SELECT
    *
FROM
    products
WHERE
    price BETWEEN 2000 AND 5000;

-- =====================================================
-- Question 6
-- Fetch data for specific customer IDs
-- (e.g., from loyalty program list)
-- =====================================================

SELECT
    *
FROM
    customers
WHERE
    customer_id IN (5, 8, 12, 18, 25);

-- =====================================================
-- Question 7
-- Identify customers whose names start with the letter 'A'
-- =====================================================

SELECT
    *
FROM
    customers
WHERE
    name LIKE 'A%';

-- =====================================================
-- Question 8
-- List products priced under ₹3,000
-- =====================================================

SELECT
    *
FROM
    products
WHERE
    price < 3000;

-- =====================================================
-- Question 9
-- Display product names and prices
-- in descending order of price
-- =====================================================

SELECT
    name,
    price
FROM
    products
ORDER BY
    price DESC;

-- =====================================================
-- Question 10
-- Display product names and prices,
-- sorted by price and then by name
-- =====================================================

SELECT
    name,
    price
FROM
    products
ORDER BY
    price ASC,
    name ASC;

-- ========================= END OF LEVEL 1 =========================