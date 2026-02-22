-- incomplete dataset ?
SELECT MAX(purchase_at)
FROM public.orders;

--no-- 

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(total_item_amount) AS total_revenue
FROM public.view_sales_report
WHERE sale_date >= '2018-09-01'
  AND sale_date < '2018-10-01';

SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM public.orders
WHERE purchase_at >= '2018-09-01'
  AND purchase_at < '2018-10-01';



SELECT
    COUNT(DISTINCT order_id) AS delivered_orders
FROM public.orders
WHERE purchase_at >= '2018-09-01'
  AND purchase_at < '2018-10-01'
  AND order_status = 'delivered';


SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(i.price + i.freight_value) AS total_revenue
FROM public.orders o
JOIN public.order_items i
    ON o.order_id = i.order_id
WHERE o.purchase_at >= '2018-09-01'
  AND o.purchase_at < '2018-10-01';