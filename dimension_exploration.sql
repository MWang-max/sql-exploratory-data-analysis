-- all countries that customers come from

SELECT DISTINCT
    country
FROM eda_gold.dim_customers

-- product range

SELECT DISTINCT
    category, 
    subcategory,
    product_name
FROM eda_gold.dim_products
ORDER BY 1, 2, 3