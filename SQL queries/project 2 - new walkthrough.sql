

SELECT COUNT (*)
FROM collision;

ALTER TABLE collision
ADD CONSTRAINT collision_id PRIMARY KEY (collision_id);

--1--check spelling--
    --Borough--
    SELECT DISTINCT (borough)
    FROM collision;
    --Result: No mispelled words--

    --Contributing Factor vehicle 1--
    SELECT DISTINCT(contributing_factor_vehicle_1)
    FROM collision
    --Result: One misspelled, 1 null, 1 unspecified--

        --clean data--
        UPDATE collision
        SET contributing_factor_vehicle_1='Illness'
        WHERE contributing_factor_vehicle_1='Illnes'

        --remove null--
        DELETE FROM collision
        WHERE contributing_factor_vehicle_1 IS NULL

        --remove unspecified--
        DELETE FROM collision
        WHERE contributing_factor_vehicle_1 = 'Unspecified'
   
    --I only checked these two columns because
    --they're the only columns that I'll be using
    --for my analysis with TEXT type


--2--check nulls--
    --crash date--
    SELECT crash_date
    FROM collision
    WHERE (crash_date IS NULL);
    --Result: No nulls--

    --crash time--
    SELECT crash_time
    FROM collision
    WHERE crash_time IS NULL;
    --Result: No nulls--

    --borough--
    SELECT borough
    FROM collision
    WHERE (borough IS NULL)
    Limit 1000;
    --Result: Nulls found (I limited it to 100 
    --since the data is so large that it caused 
    --VSC to crash)
    
        --clean data--
        DELETE FROM collision
        WHERE (borough IS NULL);
        --Result: Nulls cleared--

    --latitude--
    SELECT COUNT(latitude IS NULL)
    FROM collision
    WHERE (latitude IS NULL);
    --Result: 20,069 Nulls found--

         --clean data--
        DELETE FROM collision
        WHERE (latitude IS NULL);
        --Result: 20,069 Nulls cleared--
    
    --longitude--
    SELECT COUNT(longitude IS NULL)
    FROM collision
    WHERE (longitude IS NULL);
    --Result: No nulls--


--check nulls--
SELECT *
FROM collision
WHERE (collision IS NULL);
--Result: No more nulls for the 
--columns needed for analysis

--check duplicates--
SELECT COUNT(DISTINCT collision_id)
FROM collision
--Result: No duplicates--

--3--check outliers--
SELECT *
FROM
(SELECT
number_of_persons_injured,
number_of_pedestrians_injured,
number_of_cyclist_injured,
number_of_motorist_injured,
(number_of_persons_injured - AVG(number_of_persons_injured) over ()) / stddev(number_of_persons_injured) over () as zscore
FROM collision) AS outliers
WHERE zscore > 2.576
OR zscore <-2.576;
--Result: They were some results but they're true values--

SELECT *
FROM 
(SELECT 
number_of_persons_killed,
number_of_pedestrians_killed,
number_of_cyclist_killed,
number_of_motorist_killed,
(number_of_persons_killed - AVG(number_of_persons_killed) over ()) / stddev(number_of_persons_killed) over () as zscore
FROM collision) AS outliers
WHERE zscore > 2.576
OR zscore <-2.576;
--Result: They were some results but they're true values--
