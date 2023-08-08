{{ config(materialized='table') }}

SELECT DISTINCT
    pulocationid AS pickup_loc,
    dolocationid AS dropoff_loc,

    md5(pulocationid) AS pickup_loc_id,
    md5(dolocationid) AS dropoff_loc_id

FROM {{ ref("stg_yellow__taxi_trip_data") }}
