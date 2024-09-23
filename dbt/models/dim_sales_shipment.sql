{{ config(materialized='table') }}

WITH t_data as (
    SELECT DISTINCT
    `Courier Status` AS courier_status,
    `ship-city` AS ship_city,
    `ship-state` AS ship_state,
    `ship-postal-code` AS ship_postal_code,
    `ship-country` AS ship_country

    FROM `data-engineering-435704.data_sample.amazon_sale_report`
)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'courier_status',
        'ship_city',
        'ship_state',
        'ship_postal_code',
        'ship_country'
    ]) }} AS sales_shipment_id, *

FROM t_data