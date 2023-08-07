 SELECT distinct
        md5(tpep_pickup_datetime) as pickup_date_id,
        tpep_dropoff_datetime as pickup_date,

        md5(tpep_dropoff_datetime) as dropoff_date_id,
        tpep_dropoff_datetime as dropoff_date

    FROM {{ref("stg_yellow__taxi_trip_data")}}