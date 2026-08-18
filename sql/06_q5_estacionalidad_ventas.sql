-- =============================================
-- PREGUNTA 5: ¿Cuál es el patrón de ventas mensual? ¿Hay estacionalidad?
-- =============================================
-- OBJETIVO:
--   Identificar patrones temporales en ventas
--   Detectar meses altos/bajos para planificación de inventario
--   Proyectar demanda futura

-- INSIGHT ENCONTRADO:
--   Pico máximo: Abril-Mayo 2018 (~996K en ingresos)
--   Pico mínimo: Octubre 2017 (~664K en ingresos)
--   Tendencia: Crecimiento del 2017 al 2018
--   
--   NO hay estacionalidad fuerte por festividades (datos son 2017-2018)
--   Crecimiento sostenido sugiere expansión del negocio

-- RECOMENDACIÓN:
--   Preparar inventario para mantener crecimiento de abril-mayo
--   Investigar qué sucedió en octubre 2017 (posible problema logístico)
--   Proyectar demanda basada en trend ascendente

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS mes,
    COUNT(DISTINCT o.order_id) AS num_ordenes,
    COUNT(DISTINCT o.customer_id) AS clientes_unicos,
    ROUND(SUM(oi.price), 2) AS ingresos_totales,
    ROUND(AVG(oi.price), 2) AS ticket_promedio
FROM orders o
INNER JOIN order_items oi
  ON o.order_id = oi.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY mes ASC;
