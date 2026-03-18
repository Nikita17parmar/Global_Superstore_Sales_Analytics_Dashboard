USE retail_analytics;

-- =========================
-- Validation Queries
-- =========================

SELECT COUNT(*) AS stage_row_count
FROM orders_stage;

SELECT * 
FROM orders_stage
LIMIT 5;

SELECT
  SUM(order_id IS NULL OR order_id = '') AS null_order_id,
  SUM(order_date IS NULL OR order_date = '') AS null_order_date,
  SUM(sales IS NULL) AS null_sales,
  SUM(profit IS NULL) AS null_profit
FROM orders_stage;

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT order_id) AS distinct_orders,
  COUNT(DISTINCT customer_id) AS total_customers,
  COUNT(DISTINCT product_id) AS total_products
FROM orders_stage;

SELECT
  MIN(order_date) AS min_order_date,
  MAX(order_date) AS max_order_date,
  SUM(order_date IS NULL) AS null_order_dates
FROM orders_clean;

SELECT COUNT(*) AS clean_row_count
FROM orders_clean;

SELECT COUNT(*) AS fact_rows
FROM fact_sales;

SELECT COUNT(*) AS dim_date_rows
FROM dim_date;

SELECT COUNT(*) AS dim_customer_rows
FROM dim_customer;

SELECT COUNT(*) AS dim_product_rows
FROM dim_product;

SELECT COUNT(*) AS dim_geo_rows
FROM dim_geo;

-- =========================
-- Business Analysis Queries
-- =========================

-- Monthly Sales Trend
SELECT
  order_year,
  order_month,
  SUM(sales) AS total_sales,
  SUM(profit) AS total_profit
FROM orders_clean
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Top 10 Products by Profit
SELECT
  product_name,
  SUM(profit) AS total_profit,
  SUM(sales) AS total_sales
FROM orders_clean
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Sales by Region
SELECT
  region,
  SUM(sales) AS total_sales,
  SUM(profit) AS total_profit
FROM orders_clean
GROUP BY region
ORDER BY total_sales DESC;

-- Discount Impact on Profit
SELECT
  discount,
  SUM(sales) AS total_sales,
  SUM(profit) AS total_profit
FROM orders_clean
GROUP BY discount
ORDER BY discount;
