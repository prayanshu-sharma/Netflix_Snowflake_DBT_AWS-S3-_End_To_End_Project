--count shows category(short,log and medium) on basis of duration mintures

{{
    config(
        materialized='incremental',
        unique_key='show_id'
    )
}}


SELECT
    show_id,
    title,
    type,
    release_year,
    duration_minutes,
    CASE 
        WHEN duration_minutes < 60 THEN 'Short category'
        WHEN duration_minutes BETWEEN 60 AND 120 THEN 'Medium category'
        WHEN duration_minutes > 120 THEN 'Long category'
        ELSE NULL 
    END AS show_category
FROM {{ ref('bronze_titles') }}