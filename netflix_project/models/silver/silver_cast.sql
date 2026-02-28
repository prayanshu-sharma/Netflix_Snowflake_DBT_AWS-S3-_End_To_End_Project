--Count of cast by show id
{{
    config(
        materialized='incremental',
        unique_key='show_id'
    )
}}

SELECT 
    show_id,
    COUNT("CAST") AS cast_count
FROM {{ ref('bronze_cast') }}

GROUP BY show_id