-- COUNT OF LISTED IN CATEGORY ON BASIS SHOW_ID

{{
    config(
        materialized='incremental',
        unique_key='listed_in'
    )
}}


SELECT 
    LISTED_IN,
    COUNT(show_id) AS show_count
FROM {{ ref('bronze_category') }}
GROUP BY LISTED_IN
