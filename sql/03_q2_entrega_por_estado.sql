-- =============================================
-- PREGUNTA 2: ¿Cuál es el tiempo promedio de entrega (en días) por estado?
-- =============================================
-- OBJETIVO:
--   Evaluar la eficiencia logística en cada estado
--   Identificar cuellos de botella geográficos

-- INSIGHT ENCONTRADO:
--   São Paulo (SP) tiene el mejor desempeño: 8.30 días (hub logístico principal)
--   Estados lejanos (AC, PB, PI) promedian 18-20 días
--   Correlación clara: mientras más norte, más días de entrega

-- RECOMENDACIÓN:
--   Considerar centros de distribución en el norte/nordeste
--   Ajustar promesas de entrega por región

SELECT 
    c.customer_state,
    COUNT(*) AS num_ordenes,
    ROUND(AVG(EXTRACT(DAY FROM (o.order_delivered_customer_date - o.order_purchase_timestamp))), 2) AS promedio_dias_entrega
FROM orders o
INNER JOIN customers c
  ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY promedio_dias_entrega ASC;
