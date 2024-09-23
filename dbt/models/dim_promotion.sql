{{ config(materialized='table') }}

With t_data AS (
    SELECT 
        DISTINCT `promotion-ids` as promotion

    FROM `data_sample.amazon_sale_report`
)

SELECT
  {{ dbt_utils.generate_surrogate_key([
        'promotion'
    ]) }} AS promotion_id, *

FROM t_data
