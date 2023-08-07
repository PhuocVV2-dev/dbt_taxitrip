/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/


-- Populate fact table
fact_trip AS (

    SELECT
        md5(concat(s.vendorid, s.tpep_pickup_datetime)) as trip_id,
        t.taxi_id,
        d.pickup_date_id,
        d.dropoff_date_id,
        s.passenger_count,
        s.trip_distance,
        s.total_amount
    FROM {{ref("stg_yellow__taxi_trip_data")}} s
    INNER JOIN dim_taxi t on s.vendorid = t.vendorid
    INNER JOIN dim_date d on s.tpep_pickup_datetime = d.pickup_date
    INNER JOIN dim_location l on s.pulocationid = l.pulocationid and s.dolocationid = l.dolocationid

)
