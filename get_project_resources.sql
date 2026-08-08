CREATE DATABASE DataWarehouseAnalytics

CREATE SCHEMA eda_gold

CREATE TABLE eda_gold.dim_customers(
    customer_key INT,
    customer_id INT,
    customer_number NVARCHAR(50),
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    country NVARCHAR(50),
    marital_status NVARCHAR(50), 
    gender NVARCHAR(50),
    birthdate DATE,
    create_date DATE
)

CREATE TABLE eda_gold.dim_products(
    product_key INT,
    product_id INT,
    product_number NVARCHAR(50),
    category_id NVARCHAR(50),
    category NVARCHAR(50),
    subcategory NVARCHAR(50),
    maintenance NVARCHAR(50),
    cost INT,
    product_line NVARCHAR(50),
    start_date DATE
)

CREATE TABLE eda_gold.fact_sales(
    order_number NVARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    shipping_date DATE,
    due_date DATE,
    sales_amount INT,
    quantity TINYINT,
    price INT
)

SET GLOBAL local_infile = true

LOAD DATA LOCAL INFILE '/Users/miltonwang/Downloads/Udemy SQL /sql-data-analytics-project/sql-data-analytics-project/datasets/flat-files/dim_customers.csv'
    INTO TABLE eda_gold.dim_customers
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"' 
    LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES

LOAD DATA LOCAL INFILE '/Users/miltonwang/Downloads/Udemy SQL /sql-data-analytics-project/sql-data-analytics-project/datasets/flat-files/dim_products.csv'
    INTO TABLE eda_gold.dim_products
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"' 
    LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES

LOAD DATA LOCAL INFILE '/Users/miltonwang/Downloads/Udemy SQL /sql-data-analytics-project/sql-data-analytics-project/datasets/flat-files/fact_sales.csv'
    INTO TABLE eda_gold.fact_sales
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"' 
    LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES

SELECT * FROM eda_gold.dim_customers

SELECT * FROM eda_gold.fact_sales

SELECT * FROM eda_gold.dim_products

-- DROP TABLE IF EXISTS eda_gold.fact_sales

-- DROP TABLE IF EXISTS eda_gold.dim_customers

-- DROP TABLE IF EXISTS eda_gold.dim_products