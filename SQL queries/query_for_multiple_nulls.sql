SELECT COUNT(crash_date IS NULL) AS crash_date_nulls,
COUNT(crash_date IS NULL) AS crash_time_nulls,
COUNT(borough IS NULL) AS borough_nulls,
COUNT(latitude IS NULL) AS latitude_nulls,
COUNT(longitude IS NULL) AS longitude_nulls,
COUNT(contributing_factor_vehicle_1 IS NULL) AS factor1_nulls,
COUNT(number_of_persons_injured IS NULL) AS persons_injured_nulls,
COUNT(number_of_persons_killed IS NULL) AS persons_killed_nulls,
COUNT(number_of_pedestrians_injured IS NULL) AS pedestrian_injured_nulls,
COUNT(number_of_pedestrians_killed IS NULL) AS pedestrian_killed_nulls
FROM collision
WHERE NULL IN(1,2,3,4,5,6,7,8,9,10 IS NULL);