SELECT VendorID, SUM(fare_amount) FROM `tlc-data-analytics-project.tlc_dataset.fact_table` 
GROUP BY VendorID;

SELECT b.payment_type_name, AVG(a.tip_amount) FROM `tlc-data-analytics-project.tlc_dataset.fact_table` a
JOIN `tlc-data-analytics-project.tlc_dataset.payment_type_dim` b
ON a.payment_type_id = b.payment_type_id
GROUP BY b.payment_type_name;

-- Find the top 10 pickup locations based on the number of trips
SELECT pickup_location_id, COUNT(pickup_location_id) as frequency
FROM `tlc-data-analytics-project.tlc_dataset.fact_table` 
GROUP BY pickup_location_id
ORDER BY frequency DESC
LIMIT 10;

-- Find the total number of trips by passenger count
SELECT b.passenger_count_id, COUNT(b.passenger_count) FROM `tlc-data-analytics-project.tlc_dataset.fact_table` a
JOIN `tlc-data-analytics-project.tlc_dataset.passenger_count_dim` b
ON a.passenger_count_id = b.passenger_count_id
GROUP BY b.passenger_count_id;

-- Find the average fare amount by hour of the day - PICK_HOUR 
SELECT b.pick_hour, AVG(a.fare_amount) FROM `tlc-data-analytics-project.tlc_dataset.fact_table` a
JOIN `tlc-data-analytics-project.tlc_dataset.datetime_dim` b
ON a.datetime_id = b.datetime_id
GROUP BY b.pick_hour
ORDER BY b.pick_hour ASC;

-- Find the average fare amount by hour of the day - DROP_HOUR 
SELECT b.drop_hour, AVG(a.fare_amount) FROM `tlc-data-analytics-project.tlc_dataset.fact_table` a
JOIN `tlc-data-analytics-project.tlc_dataset.datetime_dim` b
ON a.datetime_id = b.datetime_id
GROUP BY b.drop_hour
ORDER BY b.drop_hour ASC;