{{
config(
    materialized = 'table',
    unique_key = 'product_key'
)
}}

select  
    product_id as product_key, 
    product_id, 
    product_name, 
    geography_key, 
    product_price

from {{ref('staging_product')}}
