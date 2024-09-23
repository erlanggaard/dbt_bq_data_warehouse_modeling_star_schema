{{ config(materialized='table') }}

SELECT 
    index,
    `Order ID` AS order_id,
    Date AS date,
    Status AS status,

    {{ dbt_utils.generate_surrogate_key([
        '`promotion-ids`'
    ]) }} AS promotion_id,

    {{ dbt_utils.generate_surrogate_key([
        '`Sales Channel `',
        '`ship-service-level`'
    ]) }} AS sales_channel_id,

    {{ dbt_utils.generate_surrogate_key([
        '`Courier Status`',
        '`ship-city`',
        '`ship-state`',
        '`ship-postal-code`',
        '`ship-country`'
    ]) }} AS sales_shipment_id,

    Qty as qty,
    Amount as amount

FROM `data-engineering-435704.data_sample.amazon_sale_report`