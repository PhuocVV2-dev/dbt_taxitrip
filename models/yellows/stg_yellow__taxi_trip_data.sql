
{{ config(materialized='incremental') }}
-- Source table


with source_data as (

    select * from public.yellow_taxi_trip 

)
-- Staging table
    select
        vendorid,
        tpep_pickup_datetime,
        tpep_dropoff_datetime,
        passenger_count,
        trip_distance,
        dolocationid,
        pulocationid,
        total_amount
    from source_data