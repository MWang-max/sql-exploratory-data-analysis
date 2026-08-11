-- # of customers by country
SELECT
    country,
    COUNT(customer_key) AS total_customers
FROM eda_gold.dim_customers
GROUP BY country
ORDER BY total_customers DESC

-- # of customers by gender

SELECT
    gender,
    COUNT(customer_key) AS total_customers
FROM eda_gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC

-- # of products by category

SELECT
    category,
    COUNT(product_key) AS total_products
FROM eda_gold.dim_products
GROUP BY category
ORDER BY total_products DESC

-- average cost by category

SELECT
    category,
    ROUND(AVG(cost), 2) AS average_cost
FROM eda_gold.dim_products
GROUP BY category
ORDER BY average_cost DESC

-- total revenue by category

SELECT
    p.category,
    SUM(f.sales_amount) AS total_revenue
FROM eda_gold.fact_sales AS f
LEFT JOIN eda_gold.dim_products AS p
ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC

-- total revenue by customer

SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM eda_gold.fact_sales AS f
LEFT JOIN eda_gold.dim_customers AS c
ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC

-- total items sold by country

SELECT
    c.country,
    SUM(f.quantity) AS total_sold_items
FROM eda_gold.fact_sales AS f
LEFT JOIN eda_gold.dim_customers AS c
ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_sold_items DESC