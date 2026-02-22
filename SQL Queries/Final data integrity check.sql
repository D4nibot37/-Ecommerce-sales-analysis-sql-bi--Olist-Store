SELECT 
    COUNT(*) AS total_filas_productos,
    COUNT(DISTINCT order_id) AS total_pedidos,
    SUM(total_item_amount) AS revenue_total
FROM public.view_sales_report;

SELECT 
    SUM(total_item_amount) AS revenue_prueba
FROM public.view_sales_report
WHERE category_name = 'bed_bath_table' 
  AND sale_year = 2018;

  SELECT SUM(price + freight_value)
FROM public.order_items;

SELECT SUM(total_item_amount)
FROM public.view_sales_report;

SELECT COUNT(*) FROM public.order_items;
SELECT COUNT(*) FROM public.orders;

SELECT COUNT(*) FROM public.view_sales_report;

SELECT SUM(price + freight_value)
FROM public.order_items;

SELECT COUNT(*)
FROM public.view_sales_report
WHERE item IS NULL;

