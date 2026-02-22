
-- Order Items

CREATE TABLE public.order_items AS
SELECT 
    order_id,
    CAST(order_item_id AS INT) as item_sequence, -- Es la secuencia dentro de la orden
    product_id,
    seller_id,
    TO_TIMESTAMP(shipping_limit_date, 'YYYY-MM-DD HH24:MI:SS') as shipping_limit_at,
    CAST(price AS NUMERIC(10,2)) as price,
    CAST(freight_value AS NUMERIC(10,2)) as freight_value
FROM staging.stg_order_items;


-- Products

CREATE TABLE public.products AS
SELECT 
    p.product_id,
    COALESCE(t.product_category_name_english, 'others') as category_name,
    CAST(NULLIF(p.product_name_lenght, '') AS INT) as name_length,
    CAST(NULLIF(p.product_description_lenght, '') AS INT) as description_length,
    CAST(NULLIF(p.product_photos_qty, '') AS INT) as photos_qty,
    CAST(NULLIF(p.product_weight_g, '') AS FLOAT) as weight_g,
    CAST(NULLIF(p.product_length_cm, '') AS FLOAT) as length_cm,
    CAST(NULLIF(p.product_height_cm, '') AS FLOAT) as height_cm,
    CAST(NULLIF(p.product_width_cm, '') AS FLOAT) as width_cm
FROM staging.stg_products p
LEFT JOIN staging.stg_product_category_translation t 
    ON p.product_category_name = t.product_category_name;



CREATE TABLE public.customers AS
SELECT 
    TRIM(customer_id) AS customer_id,
    TRIM(customer_unique_id) AS customer_unique_id,
    CAST(customer_zip_code_prefix AS INTEGER) AS zip_code_prefix,
    INITCAP(TRIM(customer_city)) AS city, -- INITCAP pone la primera letra en mayúscula
    UPPER(TRIM(customer_state)) AS state
FROM staging.stg_customers;

-- Asumiendo que creaste staging.stg_sellers similar a customers


CREATE TABLE public.sellers AS
SELECT 
    TRIM(seller_id) AS seller_id,
    CAST(seller_zip_code_prefix AS INTEGER) AS zip_code_prefix,
    INITCAP(TRIM(seller_city)) AS city,
    UPPER(TRIM(seller_state)) AS state
FROM staging.stg_sellers;


CREATE TABLE public.orders AS
SELECT 
    order_id,
    customer_id,
    order_status,
    TO_TIMESTAMP(NULLIF(order_purchase_timestamp, ''), 'YYYY-MM-DD HH24:MI:SS') AS purchase_at,
    TO_TIMESTAMP(NULLIF(order_approved_at, ''), 'YYYY-MM-DD HH24:MI:SS') AS approved_at,
    TO_TIMESTAMP(NULLIF(order_delivered_customer_date, ''), 'YYYY-MM-DD HH24:MI:SS') AS delivered_at,
    TO_TIMESTAMP(NULLIF(order_estimated_delivery_date, ''), 'YYYY-MM-DD HH24:MI:SS') AS estimated_delivery_at
FROM staging.stg_orders;