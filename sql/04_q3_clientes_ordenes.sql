-- =============================================
-- PREGUNTA 3: ¿Qué tan bien retiene clientes el negocio?
-- =============================================
-- OBJETIVO:
--   Medir qué porcentaje de clientes reales (customer_unique_id)
--   realiza más de una compra, para evaluar la salud de la 
--   retención del negocio

-- NOTA METODOLÓGICA:
--   El análisis inicial (clientes/órdenes por estado) mostró un 
--   ratio de 1:1 en TODOS los estados sin excepción, lo cual no 
--   revela variación geográfica. Se replanteó el análisis a nivel 
--   de cliente individual para medir retención real a nivel nacional.

-- INSIGHT ENCONTRADO - HALLAZGO CRÍTICO:
--   96.88% de los clientes (93,099) compró UNA SOLA VEZ
--   Solo 3.12% de los clientes (2,997) volvió a comprar
--   
--   Esto NO es un problema regional, es un problema estructural
--   del negocio a nivel nacional

-- RECOMENDACIÓN (PRIORITARIA):
--   La adquisición de clientes está funcionando, pero la retención
--   es prácticamente inexistente
--   Investigar causas: ¿experiencia post-compra? ¿falta de incentivos
--   de recompra? ¿catálogo limitado para necesidades recurrentes?
--   Cualquier estrategia de crecimiento debe priorizar retención 
--   sobre adquisición: el costo de conseguir un cliente nuevo es 
--   mayor que el de hacer que uno existente vuelva a comprar

WITH compras_por_cliente AS (
    SELECT 
        customer_unique_id,
        COUNT(o.order_id) AS num_compras
    FROM customers c
    INNER JOIN orders o
      ON c.customer_id = o.customer_id
    GROUP BY customer_unique_id
)

SELECT 
    CASE 
        WHEN num_compras = 1 THEN 'Compra única'
        ELSE '2+ compras'
    END AS tipo_cliente,
    COUNT(*) AS num_clientes,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS porcentaje
FROM compras_por_cliente
GROUP BY tipo_cliente;
