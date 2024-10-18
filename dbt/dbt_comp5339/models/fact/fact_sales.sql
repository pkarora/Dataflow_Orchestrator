{{ config(
    materialized = 'table',
    unique_key = ['customer_key', 'product_key', 'channel_key', 'bought_date_key', 'geography_key']
) }}

SELECT
    customer_key,
    product_key,
    channel_key,
    bought_date_key,
    geography_key,
    total_amount,
    qty,
    product_price,
    commissionpaid,
    commissionpct,
    loaded_timestamp
FROM
    {{ ref('staging_transactions') }}
