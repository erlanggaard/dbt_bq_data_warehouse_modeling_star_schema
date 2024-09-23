{{ config(materialized='table') }}

-- Table dim fulfilment
With t_data AS (
    SELECT DISTINCT
    Fulfilment AS fulfilment,
    `fulfilled-by` AS fulfilled_by
    FROM `data-engineering-435704.data_sample.amazon_sale_report`
)

-- surrogate key (id)
SELECT
    {{ dbt_utils.generate_surrogate_key([
        'fulfilment',
        'fulfilled_by'
    ]) }} AS fulfilment_id, *
FROM t_data