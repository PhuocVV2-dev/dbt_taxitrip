SELECT distinct
    md5(vendor_id) as taxi_id,
    vendor_id
from {{ ref('stg_yellow__taxi_trip_data') }}

