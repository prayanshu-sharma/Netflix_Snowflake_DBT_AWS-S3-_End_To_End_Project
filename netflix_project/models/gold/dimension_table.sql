{{ config(materialized='table') }}

SELECT 
    SHOW_ID,
    TYPE,
    TITLE,
    RATING,
    DESCRIPTION,
    DATE_ADDED,
    "CAST",
    LISTED_IN,
    COUNTRY,
    DIRECTOR
FROM {{ ref('obt') }}