{{ config(materialized='table') }}

SELECT
    index,
    `Order ID` AS order_id,
    Date AS date,
    Status AS status,
    {{ dbt_utils.generate_surrogate_key([
            'SKU'
        ]) }} AS product_id,
        
    {{ dbt_utils.generate_surrogate_key([
            'Fulfilment',
            '`fulfilled-by`'
        ]) }} AS fulfilment_id,
    Qty AS qty,
    Amount AS amount

FROM `data-engineering-435704.data_sample.amazon_sale_report`