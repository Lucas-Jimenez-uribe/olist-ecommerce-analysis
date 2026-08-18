-- =============================================
-- PREGUNTA 1: ¿Cuáles son las categorías que más ingresos generan?
-- =============================================
-- OBJETIVO: 
--   Identificar las categorías de productos que generan mayor revenue
--   para enfocar estrategias de marketing e inventario

-- INSIGHT ENCONTRADO:
--   Belleza lidera con 1.2M en ingresos (9.6K vendas, precio promedio: 130.16)
--   Las top 5 categorías representan ~40% del total

-- NEGOCIO:
--   - Productos de belleza tienen alto ticket promedio
--   - Demanda consistente sin depender de estacionalidad

SELECT 
    p.product_category_name AS categoria,
    COUNT(oi.order_item_id) AS num_ventas,
    SUM(oi.price) AS ingresos_totales,
    ROUND(AVG(oi.price), 2) AS precio_promedio
FROM products p
INNER JOIN order_items oi
  ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY ingresos_totales DESC
LIMIT 20;
