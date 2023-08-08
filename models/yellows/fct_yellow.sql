/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/


-- Populate fact table
{{ config(materialized='table') }}

WITH dim_taxi AS (
    SELECT * FROM {{ ref("dim_taxi") }}
),

dim_location AS (
    SELECT * FROM {{ ref("dim_location") }}
),

dim_date AS (
    SELECT * FROM {{ ref("dim_date") }}
)

SELECT
    t.taxi_id,
    d.pickup_date_id,
    d.dropoff_date_id,
    s.passenger_count,
    s.trip_distance,
    s.total_amount,
    md5(concat(s.vendorid, s.tpep_pickup_datetime)) AS trip_id
FROM {{ ref("stg_yellow__taxi_trip_data") }} AS s
INNER JOIN dim_taxi AS t ON s.vendorid = t.vendorid
INNER JOIN dim_date AS d ON s.tpep_pickup_datetime = d.pickup_date
INNER JOIN
    dim_location AS l
    ON s.pulocationid = l.pickup_loc AND s.dolocationid = l.dropoff_loc
