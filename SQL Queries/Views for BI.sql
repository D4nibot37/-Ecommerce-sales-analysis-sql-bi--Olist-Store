CREATE OR REPLACE VIEW public.view_sales_report AS
SELECT 
    -- 1. Tiempo (Dimension Temporal)
    o.purchase_at::DATE AS sale_date,
    EXTRACT(YEAR FROM o.purchase_at) AS sale_year,
    EXTRACT(MONTH FROM o.purchase_at) AS sale_month,
    
    -- 2. Identificadores (Claves para Joins y conteos)
    o.order_id,
    c.customer_id,
    c.customer_unique_id,
    i.product_id, -- <--- ¡Añadido! Crítico para el Top Productos
    i.seller_id,
    
    -- 3. Dimensiones de Análisis (Atributos)
    o.order_status, -- Crítico para filtrar solo ventas 'delivered'
    p.category_name,
    c.city AS customer_city,
    c.state AS customer_state,
    s.city AS seller_city,
    s.state AS seller_state,
    
    -- 4. Métricas Financieras (Hechos)
    i.price AS item_revenue,
    i.freight_value AS shipping_cost,
    (i.price + i.freight_value) AS total_item_amount

FROM public.order_items i
-- La orden y el ítem deben existir sí o sí (JOIN)
JOIN public.orders o ON i.order_id = o.order_id
-- Los detalles pueden faltar por error de carga, usamos LEFT JOIN para no perder la venta del reporte
LEFT JOIN public.customers c ON o.customer_id = c.customer_id
LEFT JOIN public.products p ON i.product_id = p.product_id
LEFT JOIN public.sellers s ON i.seller_id = s.seller_id;