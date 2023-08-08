{{ config(materialized='table') }}


SELECT DISTINCT
    vendorid,
    md5(vendorid) AS taxi_id
FROM {{ ref('stg_yellow__taxi_trip_data') }}
