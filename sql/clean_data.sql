DROP TABLE IF EXISTS orders_clean;

CREATE TABLE orders_clean AS
SELECT 
  order_id,
  STR_TO_DATE(order_date, '%d-%m-%Y') AS order_date,
  STR_TO_DATE(ship_date, '%d-%m-%Y') AS ship_date,
  ship_mode,
  customer_id,
  customer_name,
  segment,
  city,
  state,
  country,
  region,
  market,
  product_id,
  category,
  sub_category,
  product_name,
  CAST(sales AS DECIMAL(12,2)) AS sales,
  CAST(quantity AS SIGNED) AS quantity,
  CAST(discount AS DECIMAL(6,3)) AS discount,
  CAST(profit AS DECIMAL(12,2)) AS profit,
  CAST(shiping_cost AS DECIMAL(12,2)) AS shipping_cost,
  order_priority,
  CAST(delivery_days AS SIGNED) AS delivery_days,
  CAST(order_year AS SIGNED) AS order_year,
  CAST(order_month AS SIGNED) AS order_month
FROM orders_stage;
