{{ config(materialized='table') }}

WITH t_data as (
    SELECT DISTINCT
    `Sales Channel ` AS sales_channel,
    `ship-service-level` AS ship_service_level
  
    FROM `data_sample.amazon_sale_report`)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'sales_channel',
        'ship_service_level'
    ]) }} AS sales_channel_id, *
    
FROM t_data