/*
=========================================================
Project  : Retail Store SQL Project
Author   : Ajit Kumar
Level    : Level 2 - Filtering and Formatting
Database : MySQL
Description:
This file demonstrates SQL filtering techniques,
column aliases, calculated columns, string functions,
and data formatting for business reporting.
=========================================================
*/

-- =====================================================
-- Question 1
-- Retrieve orders where customer information is missing
-- (possibly due to data migration or deletion)
-- =====================================================

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    o.total_amount
FROM
    orders AS o
LEFT JOIN
    customers AS c
ON
    o.customer_id = c.customer_id
WHERE
    c.customer_id IS NULL;

-- =====================================================
-- Question 2
-- Display customer names and email addresses
-- using column aliases for frontend readability
-- =====================================================

SELECT
    name AS customer_name,
    email AS email_address
FROM
    customers;

-- =====================================================
-- Question 3
-- Calculate total value for each ordered item
-- (Quantity × Item Price)
-- =====================================================

SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    item_price,
    (quantity * item_price) AS total_value
FROM
    order_items;

-- =====================================================
-- Question 4
-- Combine customer name and phone number
-- into a single formatted column
-- =====================================================

SELECT
    customer_id,
    CONCAT(name, ' - ', phone) AS customer_contact
FROM
    customers;

-- ========================= END OF LEVEL 2 =========================