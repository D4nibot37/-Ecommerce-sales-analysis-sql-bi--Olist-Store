-- =================================================================
-- PROJECT: Olist E-Commerce End-to-End Data Pipeline
-- ARCHITECTURE: Staging -> Production -> Analytics View
-- PHASE: 1. STAGING (Raw Data Ingestion)
-- PURPOSE: Load raw CSV data as VARCHAR to ensure 100% import success
-- =================================================================



-- Creamos con tipo TEXT para evitar errores de importación
CREATE TABLE staging.stg_customers (
    customer_id TEXT,
    customer_unique_id TEXT,
    customer_zip_code_prefix TEXT,
    customer_city TEXT,
    customer_state TEXT
);

CREATE TABLE staging.stg_orders (
    order_id TEXT,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TEXT,
    order_approved_at TEXT,
    order_delivered_carrier_date TEXT,
    order_delivered_customer_date TEXT,
    order_estimated_delivery_date TEXT
);

CREATE TABLE staging.stg_order_items (
    order_id TEXT,
    order_item_id TEXT,
    product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TEXT,
    price TEXT,
    freight_value TEXT
);

-- Creamos la tabla de traducción en el esquema staging
-- DROP TABLE IF EXISTS staging.stg_product_category_translation;

CREATE TABLE staging.stg_product_category_translation (
    product_category_name TEXT,
    product_category_name_english TEXT
);


create table staging.stg_products (
	"product_id"	TEXT,
	"product_category_name"	TEXT,
	"product_name_lenght"	TEXT,
	"product_description_lenght"	TEXT,
	"product_photos_qty"	TEXT,
	"product_weight_g"	TEXT,
	"product_length_cm"	TEXT,
	"product_height_cm"	TEXT,
	"product_width_cm"	TEXT
);


CREATE TABLE staging.stg_sellers (
	"seller_id"	TEXT,
	"seller_zip_code_prefix"	TEXT,
	"seller_city"	TEXT,
	"seller_state"	TEXT
);