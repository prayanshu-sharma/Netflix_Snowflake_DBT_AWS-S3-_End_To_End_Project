{{ config(materialized='table',schema='bronze') }}


select *
from {{ source('staging', 'netflix_titles') }}