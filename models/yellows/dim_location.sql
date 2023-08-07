 SELECT distinct
        md5(pulocationid) as pickup_loc_id,
        pulocationid as pickup_loc,

        md5(dolocationid) as dropoff_loc_id,
        dolocationid as dropoff_loc

    FROM {{ref("stg_yellow__taxi_trip_data")}}