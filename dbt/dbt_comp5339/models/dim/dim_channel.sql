{{
config(
    materialized = 'table',
    unique_key = 'channel_key'
)
}}

select  
    channel_id as channel_key, 
    channel_id as original_channel_id, 
    channel_name
from {{ref('staging_channels')}}
