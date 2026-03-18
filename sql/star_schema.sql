USE retail_analytics;

-- =========================
-- Dimension: Date
-- =========================
DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date AS
SELECT DISTINCT
  d AS date_key,
  YEAR(d) AS year,
  MONTH(d) AS month,
  MONTHNAME(d) AS month_name,
  QUARTER(d) AS quarter,
  DAY(d) AS day_of_month,
  DAYNAME(d) AS day_name,
  WEEK(d, 3) AS week_of_year,
  CASE
    WHEN DAYOFWEEK(d) IN (1, 7) THEN 1
    ELSE 0
  END AS is_weekend
FROM (
  SELECT order_date AS d FROM orders_clean
  UNION
  SELECT ship_date AS d FROM orders_clean
) x
WHERE d IS NOT NULL;

ALTER TABLE dim_date ADD PRIMARY KEY (date_key);

-- =========================
-- Dimension: Customer
-- =========================
DROP TABLE IF EXISTS dim_customer;

CREATE TABLE dim_customer AS
SELECT DISTINCT
  customer_id,
  customer_name,
  segment
FROM orders_clean;

ALTER TABLE dim_customer ADD PRIMARY KEY (customer_id);

-- =========================
-- Dimension: Product
-- =========================
DROP TABLE IF EXISTS dim_product;

CREATE TABLE dim_product AS
SELECT DISTINCT
  product_id,
  product_name,
  category,
  sub_category
FROM orders_clean;

ALTER TABLE dim_product ADD PRIMARY KEY (product_id);

-- =========================
-- Dimension: Geography
-- =========================
DROP TABLE IF EXISTS dim_geo;

CREATE TABLE dim_geo AS
SELECT DISTINCT
  CONCAT(country, '|', state, '|', city, '|', region, '|', market) AS geo_id,
  country,
  state,
  city,
  region,
  market
FROM orders_clean;

ALTER TABLE dim_geo ADD PRIMARY KEY (geo_id);

-- =========================
-- Dimension: Ship Mode
-- =========================
DROP TABLE IF EXISTS dim_ship_mode;

CREATE TABLE dim_ship_mode AS
SELECT DISTINCT
  ship_mode
FROM orders_clean;

ALTER TABLE dim_ship_mode ADD PRIMARY KEY (ship_mode);

-- =========================
-- Fact Table: Sales
-- =========================
DROP TABLE IF EXISTS fact_sales;

CREATE TABLE fact_sales AS
SELECT
  order_id,
  order_date AS order_date_key,
  ship_date AS ship_date_key,
  customer_id,
  product_id,
  CONCAT(country, '|', state, '|', city, '|', region, '|', market) AS geo_id,
  ship_mode,
  order_priority,
  delivery_days,
  sales,
  profit,
  quantity,
  discount,
  shipping_cost
FROM orders_clean;

ALTER TABLE fact_sales
  ADD INDEX idx_order_date (order_date_key),
  ADD INDEX idx_ship_date (ship_date_key),
  ADD INDEX idx_customer (customer_id),
  ADD INDEX idx_product (product_id),
  ADD INDEX idx_geo (geo_id),
  ADD INDEX idx_ship_mode (ship_mode);
