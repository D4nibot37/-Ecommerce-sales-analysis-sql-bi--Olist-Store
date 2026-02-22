
-- Verificar duplicados en ordenes 
SELECT order_id, COUNT(*)
FROM staging.stg_orders
GROUP BY order_id
HAVING COUNT(*) > 1;


-- Verificar nulos o vacíos en fechas clave
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN order_purchase_timestamp IS NULL OR order_purchase_timestamp = '' THEN 1 ELSE 0 END) AS missing_purchase_date,
    SUM(CASE WHEN order_delivered_customer_date IS NULL OR order_delivered_customer_date = '' THEN 1 ELSE 0 END) AS missing_delivery_date
FROM staging.stg_orders;

-- Valores Numéricos (Precios y Fletes)
SELECT price
FROM staging.stg_order_items
WHERE price !~ '^[0-9]+(\.[0-9]+)?$'; -- Busca precios que NO sean numéricos (regex simple)

-- Qué buscar: ¿Hay pedidos hechos por un cliente (customer_id) que NO existe en la tabla de clientes?

SELECT o.order_id, o.customer_id
FROM staging.stg_orders o
LEFT JOIN staging.stg_customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
-- Si esto devuelve filas, perderás esos pedidos al hacer un INNER JOIN.


-- Verificar el estatus de las órdenes que no tienen fecha de entrega
SELECT 
    order_status, 
    COUNT(*) as cantidad
FROM staging.stg_orders
WHERE order_delivered_customer_date IS NULL 
   OR order_delivered_customer_date = ''
GROUP BY order_status
ORDER BY cantidad DESC;