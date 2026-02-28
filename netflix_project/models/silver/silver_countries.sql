--COUNTRYWISE SHOW

{{config(materialized='incremental',unique_key='country')}}



SELECT 
    COUNTRY,
    COUNT(show_id) AS show_count
FROM {{ ref('bronze_countries') }}
GROUP BY COUNTRY