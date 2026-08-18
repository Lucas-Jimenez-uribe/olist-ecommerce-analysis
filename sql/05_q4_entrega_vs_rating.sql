-- =============================================
-- PREGUNTA 4: ¿Cuál es la relación entre tiempo de entrega y calificación del cliente?
-- =============================================
-- OBJETIVO:
--   Validar si la velocidad de entrega afecta la satisfacción del cliente
--   Encontrar el factor crítico en NPS/ratings

-- INSIGHT ENCONTRADO - CORRELACIÓN PERFECTA:
--   1 estrella: 20.89 días promedio
--   2 estrellas: 16.19 días promedio
--   3 estrellas: 13.79 días promedio
--   4 estrellas: 11.84 días promedio
--   5 estrellas: 10.21 días promedio
--   
--   PATRÓN: Cada estrella menos = ~2 días adicionales de espera
--   Diferencia total: 10.68 días entre cliente insatisfecho y satisfecho

-- RECOMENDACIÓN (CRÍTICA):
--   La velocidad de entrega es el principal driver de satisfacción
--   Mejorar tiempos en 2-3 días = incremento significativo en ratings
--   ROI prioritario: invertir en logística > publicidad

SELECT 
    or.review_score,
    COUNT(*) AS num_reviews,
    ROUND(AVG(EXTRACT(DAY FROM (o.order_delivered_customer_date - o.order_purchase_timestamp))), 2) AS promedio_dias_entrega
FROM orders o
INNER JOIN order_reviews or
  ON o.order_id = or.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY or.review_score
ORDER BY or.review_score ASC;
