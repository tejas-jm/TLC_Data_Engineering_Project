CREATE OR REPLACE TABLE `tlc-data-analytics-project.tlc_dataset.tbl_analytics` AS (
SELECT 
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
pass.passenger_count,
trip.trip_distance,
rate.rate_code_name,
pick.pickup_latitude,
pick.pickup_longitude,
dropoff.dropoff_latitude,
dropoff.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount

FROM

`tlc-data-analytics-project.tlc_dataset.fact_table` f
JOIN `tlc-data-analytics-project.tlc_dataset.datetime_dim` d ON f.datetime_id = d.datetime_id
JOIN `tlc-data-analytics-project.tlc_dataset.passenger_count_dim` pass ON pass.passenger_count_id = f.passenger_count_id
JOIN `tlc-data-analytics-project.tlc_dataset.trip_distance_dim` trip ON f.trip_distance_id = trip.trip_distance_id
JOIN `tlc-data-analytics-project.tlc_dataset.pickup_location_dim` pick ON f.pickup_location_id = pick.pickup_location_id
JOIN `tlc-data-analytics-project.tlc_dataset.payment_type_dim` pay ON f.payment_type_id = pay.payment_type_id
JOIN `tlc-data-analytics-project.tlc_dataset.dropoff_location_dim` dropoff ON f.dropoff_location_id = dropoff.dropoff_location_id
JOIN `tlc-data-analytics-project.tlc_dataset.rate_code_dim` rate ON f.rate_code_id = rate.rate_code_id)
;