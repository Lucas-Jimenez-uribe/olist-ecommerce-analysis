# 📊 Análisis de E-commerce Olist

**Análisis completo de más de 100,000 órdenes de un marketplace brasileño**

Proyecto de Data Analysis que identifica patrones clave en logística, categorías de productos y satisfacción del cliente usando SQL, Python y visualizaciones.

---

## 🎯 Resumen Ejecutivo

Este proyecto analiza el dataset público de **Olist** (marketplace brasileño) con:
- **1.5M+ registros** en 9 tablas relacionales
- **5 preguntas de negocio** respondidas con SQL
- **Insights accionables** para decisiones estratégicas
- **Correlaciones descubiertas** entre logística y satisfacción

**Tiempo de análisis:** ~2 semanas  
**Stack:** PostgreSQL + Python (Pandas, Matplotlib, Seaborn)  
**Objetivo:** Demostrar capacidades como Data Analyst Junior

---

## 🔍 Preguntas Respondidas & Insights

### 1️⃣ ¿Cuáles son las categorías con más ingresos?

```sql
SELECT product_category_name, SUM(price) AS ingresos_totales
FROM products JOIN order_items USING(product_id)
GROUP BY product_category_name
ORDER BY ingresos_totales DESC
```

**Insight:**
- 🏆 **Belleza lidera con 1.2M en ingresos** (9.6K vendas, precio promedio: R$130)
- Top 5 categorías representan ~40% del total
- Productos de belleza tienen alto ticket promedio y demanda consistente

**Recomendación:** Enfocar marketing y promotiones en belleza; investigar por qué otras categorías no escalan.

---

### 2️⃣ ¿Cuál es el tiempo de entrega por estado?

```sql
SELECT customer_state, 
       ROUND(AVG(EXTRACT(DAY FROM (delivered_date - purchase_date))), 2) 
       AS promedio_dias_entrega
FROM orders JOIN customers USING(customer_id)
GROUP BY customer_state
ORDER BY promedio_dias_entrega ASC
```

**Insight:**
- 📍 **São Paulo: 8.30 días** (hub logístico principal, eficiente)
- 📍 **Estados del norte (AC, PB, PI): 18-20 días** (lejanos, problema logístico)
- Correlación clara: mientras más norte → más días

**Recomendación:** Abrir centros de distribución en el norte/nordeste; ajustar promesas de entrega por región.

---

### 3️⃣ ¿Qué estados tienen más clientes y órdenes?

```sql
SELECT customer_state, 
       COUNT(DISTINCT customer_id) AS clientes_unicos,
       COUNT(order_id) AS ordenes
FROM orders JOIN customers USING(customer_id)
GROUP BY customer_state
ORDER BY ordenes DESC
```

**Insight:**
- 👥 **São Paulo domina: 41.7K clientes = 41.7K órdenes (ratio 1:1)**
- **PROBLEMA CRÍTICO:** Cada cliente compra UNA SOLA VEZ
- No hay repetición de compra / retención de clientes

**Recomendación:** **URGENTE** - Implementar programas de loyalty, investigar por qué no hay retención. Potencial de 2-3x crecimiento.

---

### 4️⃣ ¿Hay correlación entre entrega y calificación?

```sql
SELECT review_score,
       COUNT(*) AS num_reviews,
       ROUND(AVG(EXTRACT(DAY FROM (delivered_date - purchase_date))), 2) 
       AS promedio_dias_entrega
FROM orders JOIN order_reviews USING(order_id)
GROUP BY review_score
ORDER BY review_score ASC
```

**Insight - CORRELACIÓN PERFECTA:**
| Rating | Días Promedio |
|--------|---------------|
| ⭐ (1) | 20.89 días |
| ⭐⭐ (2) | 16.19 días |
| ⭐⭐⭐ (3) | 13.79 días |
| ⭐⭐⭐⭐ (4) | 11.84 días |
| ⭐⭐⭐⭐⭐ (5) | 10.21 días |

**Patrón:** Cada estrella menos = ~2 días adicionales de espera  
**Diferencia total:** 10.68 días entre cliente insatisfecho y satisfecho

**Recomendación:** 🚨 **LA VELOCIDAD DE ENTREGA ES EL PRINCIPAL FACTOR DE SATISFACCIÓN**  
ROI prioritario: invertir en mejorar logística (no publicidad).

---

### 5️⃣ ¿Hay estacionalidad en las ventas?

```sql
SELECT DATE_TRUNC('month', order_purchase_timestamp) AS mes,
       COUNT(DISTINCT order_id) AS ordenes,
       SUM(price) AS ingresos_totales
FROM orders JOIN order_items USING(order_id)
GROUP BY mes
ORDER BY mes ASC
```

**Insight:**
- 📈 **Pico máximo:** Abril-Mayo 2018 (~996K en ingresos)
- 📉 **Pico mínimo:** Octubre 2017 (~664K en ingresos)
- Tendencia: Crecimiento sostenido del 2017 al 2018

**NO hay estacionalidad fuerte por festividades**  
Crecimiento sugiere expansión del negocio en periodo.

**Recomendación:** Preparar inventario para mantener pico abril-mayo; investigar qué sucedió en octubre 2017.

---

## 📁 Estructura del Proyecto

```
olist-ecommerce-analysis/
│
├── README.md                          # Este archivo
├── requirements.txt                   # Dependencias Python
├── .gitignore
│
├── sql/                               # 📊 Consultas SQL documentadas
│   ├── 01_schema.sql                  # Crear tablas (9 tablas)
│   ├── 02_q1_categorias_ingresos.sql
│   ├── 03_q2_entrega_por_estado.sql
│   ├── 04_q3_clientes_ordenes.sql
│   ├── 05_q4_entrega_vs_rating.sql
│   └── 06_q5_estacionalidad_ventas.sql
│
├── notebooks/                         # 📓 Análisis en Python
│   └── analisis_completo.ipynb       # (Próximamente)
│
├── data/                             # 📦 Datos
│   ├── raw/                          # CSVs originales de Kaggle
│   │   ├── customers.csv
│   │   ├── orders.csv
│   │   ├── products.csv
│   │   └── ... (6 archivos más)
│   │
│   └── processed/                    # CSVs limpios (después de Python)
│
├── visualizations/                   # 📈 Gráficas generadas
│   ├── 01_categorias_ingresos.png
│   ├── 02_entrega_por_estado.png
│   ├── 03_clientes_ordenes.png
│   ├── 04_entrega_vs_rating.png
│   └── 05_estacionalidad_ventas.png
│
└── reports/                          # 📄 Reportes finales
    └── ANALISIS_COMPLETO.md          # (Próximamente)
```

---

## 🛠️ Stack Técnico

| Tecnología | Uso |
|-----------|-----|
| **PostgreSQL** | Base de datos relacional, almacenamiento y consultas SQL |
| **pgAdmin** | Interfaz gráfica para PostgreSQL |
| **Python 3.9+** | Procesamiento y visualización de datos |
| **Pandas** | Manipulación y limpieza de datos |
| **Matplotlib & Seaborn** | Visualizaciones profesionales |
| **Jupyter/Google Colab** | Ambiente de análisis interactivo |
| **Git & GitHub** | Control de versiones y portafolio |

---

## 🚀 Cómo Reproducir el Análisis

### Requisitos previos
- PostgreSQL instalado
- Python 3.9+
- Git

### Paso 1: Clonar el repositorio
```bash
git clone https://github.com/tu_usuario/olist-ecommerce-analysis.git
cd olist-ecommerce-analysis
```

### Paso 2: Instalar dependencias Python
```bash
pip install -r requirements.txt
```

### Paso 3: Descargar el dataset
1. Ve a Kaggle: [Olist E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
2. Descarga todos los CSVs
3. Coloca en `data/raw/`

### Paso 4: Crear la base de datos
```bash
# Conectar a PostgreSQL
psql -U tu_usuario -d tu_base_datos

# Ejecutar script de schema
\i sql/01_schema.sql
```

### Paso 5: Importar los datos
```bash
# En pgAdmin:
# Clic derecho en cada tabla → Import/Export Data → Import
# Seleccionar CSV correspondiente, marcar "Header", FORMAT csv
```

### Paso 6: Ejecutar análisis
```bash
# Ejecutar cada consulta SQL en pgAdmin o psql
psql -U tu_usuario -d tu_base_datos -f sql/02_q1_categorias_ingresos.sql
psql -U tu_usuario -d tu_base_datos -f sql/03_q2_entrega_por_estado.sql
# ... (repetir para las otras)
```

### Paso 7: Visualizaciones (Próximamente)
```bash
# Abrir Google Colab o Jupyter
jupyter notebook notebooks/analisis_completo.ipynb
```

---

## 💡 Key Insights (Resumen)

### ✅ Lo que funciona bien
- **Categoría Belleza:** Revenue engine consistente, alto ticket promedio
- **Logística en São Paulo:** Eficiente (8.3 días), hub principal bien funcionando
- **Crecimiento:** Tendencia ascendente del 2017 al 2018

### ⚠️ Oportunidades críticas
- **Retención de clientes:** 0% repetición de compra en algunos estados
- **Velocidad de entrega en norte/nordeste:** 2x más lento que São Paulo
- **Satisfacción del cliente:** Directamente correlacionada con velocidad de entrega

### 🎯 Recomendaciones prioritarias
1. **URGENTE:** Implementar programa de loyalty para retención
2. **Logística:** Invertir en centros de distribución regional
3. **Marketing:** Enfocar en belleza + investigar por qué otras categorías no escalan

---

## 📊 Metodología

### Proceso de análisis (4 pasos)
1. **Entender la pregunta:** ¿Qué quiero saber?
2. **Identificar datos:** ¿De dónde vienen? ¿Qué tablas?
3. **Construir consulta:** JOINs, agregaciones, filtros
4. **Interpretar resultados:** ¿Qué significa? ¿Acción recomendada?

### Limpieza de datos
- Eliminación de duplicados en reseñas (`order_reviews`)
- Manejo de caracteres especiales en comentarios
- Exclusión de órdenes sin entregar para cálculos de logística

---

## 📈 Habilidades Demostrables

Este proyecto demuestra:
- ✅ **SQL avanzado:** JOINs complejos, agregaciones, funciones de fecha
- ✅ **Pensamiento analítico:** De pregunta → insight → acción
- ✅ **Storytelling con datos:** Comunicar resultados en contexto de negocio
- ✅ **Limpieza y procesamiento:** Manejar datos reales con problemas
- ✅ **Versionamiento:** Git, GitHub, buenas prácticas de código
- ✅ **Visualización:** Crear gráficas que comunican

---

## 📞 Contacto
 
**GitHub:**   Lucas-Jimenez-uribe  
**Email:** uribelucas06@gmail.com

---

## 📝 Licencia

Este proyecto usa el dataset público de Olist disponible en Kaggle bajo [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/).

---

## 🙏 Agradecimientos

- Dataset: [Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- Mentoría en SQL: Curso de José Portilla (Udemy)
- Formación Data Science: Programa ONE (Oracle + Alura)

---

**Última actualización:** Agosto 2026  
**Estado:** En desarrollo (visualizaciones pendientes)
