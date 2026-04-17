-- =========================
-- SALES SQL ANALYSIS PROJECT
-- =========================

-- 1. Load Data (used during setup)
COPY sales_raw
FROM 'C:/Temp/sales_data.csv'
DELIMITER ','
CSV HEADER;

-- =========================
-- 2. DATA VALIDATION
-- =========================

-- Total records
SELECT COUNT(*) AS total_rows
FROM sales_raw;

-- Preview data
SELECT *
FROM sales_raw
LIMIT 10;

-- =========================
-- 3. MONTHLY SALES TREND
-- =========================

SELECT 
    DATE_TRUNC('month', TO_DATE(sale_date, 'DD/MM/YYYY')) AS month,
    SUM(sales_amount::NUMERIC) AS total_revenue
FROM sales_raw
GROUP BY month
ORDER BY month;

-- =========================
-- 4. REVENUE BY REGION
-- =========================

SELECT 
    region,
    SUM(sales_amount::NUMERIC) AS total_revenue
FROM sales_raw
GROUP BY region
ORDER BY total_revenue DESC;

-- =========================
-- 5. REVENUE BY PRODUCT CATEGORY
-- =========================

SELECT 
    product_category,
    SUM(sales_amount::NUMERIC) AS total_revenue
FROM sales_raw
GROUP BY product_category
ORDER BY total_revenue DESC;

-- =========================
-- 6. PROFIT ANALYSIS
-- =========================

SELECT 
    product_category,
    SUM(
        (unit_price::NUMERIC - unit_cost::NUMERIC) 
        * quantity_sold::NUMERIC
    ) AS total_profit
FROM sales_raw
GROUP BY product_category
ORDER BY total_profit DESC;

-- =========================
-- 7. CUSTOMER ANALYSIS
-- =========================

SELECT 
    customer_type,
    SUM(sales_amount::NUMERIC) AS total_revenue
FROM sales_raw
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- =========================
-- 8. SALES CHANNEL ANALYSIS
-- =========================

SELECT 
    sales_channel,
    SUM(sales_amount::NUMERIC) AS total_revenue
FROM sales_raw
GROUP BY sales_channel
ORDER BY total_revenue DESC;
