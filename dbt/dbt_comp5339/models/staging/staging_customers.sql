WITH 

customers_main AS (

    SELECT 
    
    customer_id, 
    first_name, 
    last_name, 
    email 
    
    
    FROM {{ref('src_customers')}}

),

customers_xml AS (


    SELECT 
    customer_first_name, 
    customer_last_name, 
    customer_email,
    reseller_id,
    transaction_id
    
    FROM {{source('preprocessed','resellerxmlextracted')}}
), 

customers AS (



select reseller_id, transaction_id as customer_id, customer_first_name, customer_last_name, customer_email  from customers_xml

union

select 0 as reseller_id, customer_id, first_name, last_name, email  from customers_main
)

select 

  {{ dbt_utils.generate_surrogate_key([
      'c.reseller_id',
      'customer_id']
  ) }} as customer_key,
 
 customer_first_name, 
 customer_last_name, 
 customer_email, 
 s.sales_agent_key

from customers c
left join {{ref('dim_salesagent')}} s on c.reseller_id = s.original_reseller_id