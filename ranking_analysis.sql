-- 5 products of highest revenue

SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM eda_gold.fact_sales AS f
LEFT JOIN eda_gold.dim_products AS p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5

-- 5 products of lowest revenue

SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM eda_gold.fact_sales AS f
LEFT JOIN eda_gold.dim_products AS p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC
LIMIT 5

-- 5 best subcategories

SELECT
*
FROM(
SELECT
    p.subcategory,
    SUM(f.sales_amount) AS total_revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
FROM eda_gold.fact_sales AS f
LEFT JOIN eda_gold.dim_products AS p
ON p.product_key = f.product_key
GROUP BY p.subcategory
ORDER BY total_revenue DESC
)t
WHERE rank_products <= 5

-- 5 worst subcategories

SELECT
*
FROM(
SELECT
    p.subcategory,
    SUM(f.sales_amount) AS total_revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) ASC) AS rank_products
FROM eda_gold.fact_sales AS f
LEFT JOIN eda_gold.dim_products AS p
ON p.product_key = f.product_key
GROUP BY p.subcategory
ORDER BY total_revenue ASC
)t
WHERE rank_products <= 5

-- top 10 customers by revenue

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
LIMIT 10

-- lowest 3 customers by orders placed

SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM eda_gold.fact_sales AS f
LEFT JOIN eda_gold.dim_customers AS c
ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders ASC
LIMIT 3