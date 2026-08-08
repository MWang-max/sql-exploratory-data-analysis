-- explore objects

SELECT
*
FROM information_schema.TABLES

-- explore columns (tables)

SELECT
*
FROM information_schema.COLUMNS
WHERE TABLE_NAME = 'dim_customers'

SELECT
*
FROM information_schema.COLUMNS
WHERE TABLE_NAME = 'dim_products'

SELECT
*
FROM information_schema.COLUMNS
WHERE TABLE_NAME = 'fact_sales'