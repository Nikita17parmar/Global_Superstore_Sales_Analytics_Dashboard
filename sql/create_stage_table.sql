CREATE DATABASE IF NOT EXISTS retail_analytics;
USE retail_analytics;

DROP TABLE IF EXISTS orders_stage;

CREATE TABLE orders_stage(
 order_id        TEXT,
 order_date      TEXT,
 ship_date       TEXT,
 ship_mode       TEXT,
 
 customer_id     TEXT,
 customer_name   TEXT,
 segment         TEXT,
 
 market          TEXT,
 country         TEXT,
 city            TEXT,
 state           TEXT,
 region          TEXT,
 
 product_id      TEXT,
 category        TEXT,
 sub_category    TEXT,
 product_name    TEXT,
 
 sales           DOUBLE,
 quantity        INT,
 discount        DOUBLE,
 profit          DOUBLE,
 
 shiping_cost    DOUBLE,
 order_priority  TEXT,
 delivery_days   INT,
 
 order_year      INT,
 order_month     INT
);
