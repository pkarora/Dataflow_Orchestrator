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
    SUM(amount) as total_amount,
    COUNT(transaction_id) as total_transactions
FROM
    {{ ref('staging_transactions') }}
GROUP BY
    customer_key,
    product_key,
    channel_key,
    bought_date_key,
    geography_key
