-- COUNT OF DIRECTORS SHOW-WISE

{{ config(materialized='incremental',unique_key='director') }}



SELECT 
    DIRECTOR,
    COUNT(show_id) AS show_count
FROM {{ ref('bronze_directors') }}
GROUP BY DIRECTOR