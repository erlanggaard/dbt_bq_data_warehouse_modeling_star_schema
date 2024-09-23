{{ config(materialized='table') }}

-- Dim Product
With t_data AS (
    SELECT DISTINCT
        Style as style,
        SKU as sku,
        Category as category,
        Size as size
    FROM `data-engineering-435704.data_sample.amazon_sale_report`
)

-- surrogate key (id)
SELECT
    {{ dbt_utils.generate_surrogate_key([
        'sku'
    ]) }} AS product_id, *
FROM t_data