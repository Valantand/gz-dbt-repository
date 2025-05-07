WITH sales AS (
    SELECT
        orders_id,
        product_id,
        quantity,
        revenue
    FROM {{ ref('stg_raw_gz_sales') }}
),

product AS (
    SELECT
        products_id,
        purchase_price
    FROM {{ ref('stg_raw_gz_product') }}
)

SELECT
    s.orders_id,
    s.product_id,
    s.quantity,
    s.revenue,
    p.purchase_price,
    -- Calcul du coût d'achat total
    s.quantity * p.purchase_price AS purchase_cost,
    -- Calcul de la marge
    s.revenue - (s.quantity * p.purchase_price) AS margin
FROM sales s
LEFT JOIN product p
    ON s.product_id = p.products_id
