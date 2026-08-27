# Análisis Completo: E-commerce Olist

## Introducción

Este reporte conecta los 5 hallazgos del análisis SQL/Python en una sola narrativa de negocio. Individualmente, cada consulta responde una pregunta puntual. Juntas, cuentan la historia de **dónde está el negocio hoy, y qué lo está frenando para crecer**.

---

## La historia completa, en tres actos

### Acto 1: El negocio sabe vender, pero en un solo lugar fuerte

El negocio genera ingresos sólidos y concentrados: **belleza y salud lidera con 1.2M en ingresos**, seguido de cerca por relojes/regalos y cama/mesa/baño. Las top 5 categorías representan cerca del 40% del total — hay un motor de ingresos claro, no disperso.

Geográficamente, **São Paulo es el hub que funciona**: entregas en 8.3 días promedio, el mejor tiempo de todo el país, y concentra la mayor cantidad de clientes y órdenes. El negocio tiene una base sólida ahí.

**Pero esa fortaleza no está replicada en el resto del país.**

---

### Acto 2: Dos problemas que se alimentan entre sí

Aquí es donde los hallazgos se conectan de forma más reveladora.

**Problema A — Logística desigual.** Los estados del norte y nordeste (AC, PB, PI, RR) tardan entre 18 y 29 días en promedio — más del doble que São Paulo. No es un caso aislado, es un patrón geográfico consistente: mientras más lejos del hub logístico, peor la experiencia.

**Problema B — Casi nadie repite compra.** El 96.88% de los clientes en todo el país compró una sola vez. Este no es un problema regional — se repite prácticamente igual en todos los estados.

**La conexión entre ambos:** el análisis de correlación (Pregunta 4) muestra que la velocidad de entrega es el factor más fuerte asociado a la calificación del cliente — de 20.9 días promedio para clientes de 1 estrella, a 10.2 días para los de 5 estrellas. Es razonable pensar que **la mala experiencia logística en zonas alejadas del país es una de las causas de que esos clientes nunca vuelvan a comprar.** No se puede afirmar causalidad directa con estos datos, pero la relación entre ambos hallazgos es demasiado consistente para ignorarla.

En otras palabras: el negocio no solo tiene un problema de retención — probablemente tiene un problema de retención **causado en parte por logística**, y ese problema es más agudo mientras más lejos está el cliente de São Paulo.

---

### Acto 3: El negocio está creciendo a pesar de esto

A pesar de los dos problemas anteriores, la Pregunta 5 muestra algo alentador: **el volumen de órdenes e ingresos creció de forma sostenida** entre octubre 2016 y agosto 2018, con un pico notable en noviembre de 2017.

Esto sugiere que el crecimiento actual viene principalmente de **adquisición de nuevos clientes**, no de retención — lo cual es consistente con el hallazgo del 96.88%. El negocio está creciendo "a pesar de sí mismo": cada mes trae nuevos compradores, pero casi ninguno se queda.

**Esto es una oportunidad, no solo un problema.** Si el negocio ya sabe atraer clientes de forma consistente, y el principal obstáculo para la retención es identificable (logística lenta fuera de São Paulo), resolver ese cuello de botella podría traducirse directamente en crecimiento — sin necesidad de invertir más en adquisición.

---

## Recomendaciones priorizadas

| Prioridad | Acción | Justificación |
|-----------|--------|----------------|
| 🔴 Alta | Invertir en logística para el norte/nordeste (centros de distribución regionales) | Ataca la causa más probable de la baja retención y las peores calificaciones |
| 🔴 Alta | Diseñar un programa de retención/loyalty | El 96.88% de clientes de compra única representa la mayor oportunidad de crecimiento sin adquirir un solo cliente nuevo |
| 🟡 Media | Investigar qué impulsó el pico de noviembre 2017 | Podría revelar una estrategia replicable (promoción, temporada, campaña) |
| 🟡 Media | Profundizar en por qué categorías fuera del top 5 no escalan | Belleza funciona; entender si es un problema de oferta, precio o visibilidad en otras categorías |

---

## Limitaciones del análisis

- El análisis de correlación entre entrega y calificación (Pregunta 4) muestra una **asociación fuerte, no una relación causal comprobada** — otros factores (calidad del producto, atención al cliente) también podrían influir en las calificaciones.
- No se tuvo acceso a datos de costos operativos, por lo que las recomendaciones de inversión en logística son direccionales, no un cálculo de ROI exacto.
- Los datos cubren un periodo específico (oct 2016 - ago 2018); patrones más recientes podrían haber cambiado.

---

## Conclusión

Este negocio tiene un motor de adquisición que funciona, un producto ganador (belleza), y una operación eficiente en su hub principal. Su mayor freno no es la demanda — es la **experiencia post-compra fuera de São Paulo**, que probablemente está costando la retención de casi todos los clientes que gana. Resolver la logística regional no es solo un tema operativo: es, según estos datos, la palanca más directa hacia el crecimiento sostenible del negocio.
