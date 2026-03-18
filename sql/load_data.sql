Update the file path before using:-

LOAD DATA LOCAL INFILE 'C:/Users/amans/Downloads/superstore_clean.csv'
INTO TABLE orders_stage
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
