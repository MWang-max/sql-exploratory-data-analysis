-- date of first and last order

SELECT
    MIN(t.order_date) AS first_order_date,
    MAX(t.order_date) AS last_order_date,
    DATEDIFF(MIN(t.order_date), MAX(t.order_date)) AS order_range_days
FROM (
    SELECT
    * 
    FROM eda_gold.fact_sales
    WHERE NOT order_date = 0000-00-00
)t

-- youngest and oldest customer

SELECT
    MIN(t.birthdate) AS oldest_birthdate,
    MAX(t.birthdate) AS youngest_birthdate
FROM (
    SELECT
    * 
    FROM eda_gold.dim_customers
    WHERE NOT birthdate = 0000-00-00
)t