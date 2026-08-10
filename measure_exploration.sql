-- total sales
SELECT SUM(sales_amount) AS total_sales FROM eda_gold.fact_sales

-- number of items sold
SELECT SUM(quantity) AS total_quantity FROM eda_gold.fact_sales

-- average price
SELECT AVG(price) AS average_price FROM eda_gold.fact_sales

-- number of orders
SELECT 
    COUNT(order_number) AS total_orders,
    COUNT(DISTINCT(order_number)) AS total_distinct_orders -- accounts for same customer ordering multiple things in the same order
FROM eda_gold.fact_sales

-- number of products
SELECT COUNT(product_key) AS total_products FROM eda_gold.dim_products

-- number of customers
SELECT COUNT(customer_key) AS total_customers FROM eda_gold.dim_customers

-- number of customers that placed an order
SELECT 
    COUNT(customer_key) AS total_customers,
    COUNT(DISTINCT customer_key) AS total_distinct_customers
FROM eda_gold.fact_sales

-- report on key metrics
SELECT 
    'Total Sales' AS measure_name,
    SUM(sales_amount) AS measure_value 
FROM eda_gold.fact_sales
UNION ALL
SELECT
    'Total Quantity',
    SUM(quantity)
FROM eda_gold.fact_sales
UNION ALL
SELECT
    'Average Price',
    ROUND(AVG(price), 2)
FROM eda_gold.fact_sales
UNION ALL 
SELECT 
    'Total Number of Orders',
    COUNT(DISTINCT(order_number))
FROM eda_gold.fact_sales
UNION ALL
SELECT
    'Total Number of Products',
    COUNT(product_key)
FROM eda_gold.dim_products
UNION ALL
SELECT 
    'Total Number of Customers',
    COUNT(DISTINCT customer_key)
FROM eda_gold.fact_sales