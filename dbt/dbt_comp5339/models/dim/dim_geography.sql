{{ config(
      materialized = 'table',
      unique_key = 'geography_key'
) }}

SELECT
    id as geography_key, cityname as city_name, countryname as country_name, regionname
FROM
      {{ ref('geography') }}
