-- =============================================
-- SCHEMA: Brazilian E-Commerce (Olist Dataset)
-- =============================================
-- Script para crear la estructura de tablas
-- Ejecutar en este orden exacto

-- 1. CUSTOMERS
CREATE TABLE customers (
    customer_id             VARCHAR(32) PRIMARY KEY,
    customer_unique_id      VARCHAR(32) NOT NULL,
    customer_zip_code_prefix VARCHAR(5),
    customer_city           VARCHAR(100),
    customer_state          VARCHAR(2)
);

-- 2. GEOLOCATION
CREATE TABLE geolocation (
    geolocation_zip_code_prefix VARCHAR(5),
    geolocation_lat             DECIMAL(18, 15),
    geolocation_lng             DECIMAL(18, 15),
    geolocation_city            VARCHAR(100),
    geolocation_state           VARCHAR(2)
);

-- 3. ORDERS
CREATE TABLE orders (
    order_id                        VARCHAR(32) PRIMARY KEY,
    customer_id                     VARCHAR(32) NOT NULL,
    order_status                    VARCHAR(20),
    order_purchase_timestamp        TIMESTAMP,
    order_approved_at               TIMESTAMP,
    order_delivered_carrier_date    TIMESTAMP,
    order_delivered_customer_date   TIMESTAMP,
    order_estimated_delivery_date   TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. ORDER_ITEMS
CREATE TABLE order_items (
    order_id             VARCHAR(32) NOT NULL,
    order_item_id        INTEGER NOT NULL,
    product_id           VARCHAR(32),
    seller_id            VARCHAR(32),
    shipping_limit_date  TIMESTAMP,
    price                DECIMAL(10, 2),
    freight_value        DECIMAL(10, 2),
    PRIMARY KEY (order_id, order_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 5. ORDER_PAYMENTS
CREATE TABLE order_payments (
    order_id              VARCHAR(32) NOT NULL,
    payment_sequential    INTEGER NOT NULL,
    payment_type          VARCHAR(30),
    payment_installments  INTEGER,
    payment_value         DECIMAL(10, 2),
    PRIMARY KEY (order_id, payment_sequential),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 6. ORDER_REVIEWS
CREATE TABLE order_reviews (
    review_id               VARCHAR(32) PRIMARY KEY,
    order_id                VARCHAR(32) NOT NULL,
    review_score            SMALLINT CHECK (review_score BETWEEN 1 AND 5),
    review_comment_title    VARCHAR(255),
    review_comment_message  TEXT,
    review_creation_date    TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 7. SELLERS
CREATE TABLE sellers (
    seller_id               VARCHAR(32) PRIMARY KEY,
    seller_zip_code_prefix  VARCHAR(5),
    seller_city             VARCHAR(100),
    seller_state            VARCHAR(2)
);

-- 8. PRODUCTS
CREATE TABLE products (
    product_id                  VARCHAR(32) PRIMARY KEY,
    product_category_name       VARCHAR(100),
    product_name_lenght         INTEGER,
    product_description_lenght  INTEGER,
    product_photos_qty          INTEGER,
    product_weight_g            INTEGER,
    product_length_cm           INTEGER,
    product_height_cm           INTEGER,
    product_width_cm            INTEGER
);

-- 9. PRODUCT_CATEGORY_NAME_TRANSLATION
CREATE TABLE product_category_name_translation (
    product_category_name         VARCHAR(100) PRIMARY KEY,
    product_category_name_english VARCHAR(100)
);
