{{ config(
      materialized = 'table',
      unique_key = 'geographykey'
) }}

SELECT
      id,cityname,countryname,regionname
FROM
      {{ ref('geography') }}
