-- =============================================
-- PREGUNTA 3: ¿Qué estados de Brasil tienen más clientes y más ventas?
-- =============================================
-- OBJETIVO:
--   Medir penetración de mercado por estado
--   Identificar oportunidades de crecimiento regional

-- INSIGHT ENCONTRADO:
--   SP domina: 41.7K clientes únicos = 41.7K órdenes (ratio 1:1)
--   PROBLEMA: Cada cliente en SP compra UNA SOLA VEZ
--   No hay retención de clientes, solo adquisición

-- RECOMENDACIÓN:
--   Invertir en estrategias de retención/loyalty
--   Analizar por qué los clientes no repiten compra
--   Potencial de 2-3x crecimiento si mejora repetición

SELECT 
    c.customer_state,
    COUNT(DISTINCT c.customer_id) AS num_clientes_unicos,
    COUNT(o.order_id) AS num_ordenes,
    ROUND(COUNT(o.order_id)::NUMERIC / COUNT(DISTINCT c.customer_id), 2) AS ordenes_por_cliente
FROM orders o
INNER JOIN customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY num_ordenes DESC;
