UPDATE serv2
SET sched = TO_DATE(sched,'mmyyyy');

ALTER TABLE serv2
ALTER COLUMN sched TYPE VARCHAR USING (sched::VARCHAR);

SELECT *
FROM serv2;

SELECT DISTINCT branch, service
FROM serv2;

UPDATE serv2
SET branch = 'Beta'
WHERE branch = 'Eta' AND service = 'Restaurant';

UPDATE serv2
SET service = 'Restaurant'
WHERE branch = 'Eta' AND service = 'Restorant';

UPDATE serv2
SET service = 'Convenience Store'
WHERE service = 'Conviinience Store';

SELECT *
FROM serv2
WHERE NOT (serv2 IS NOT NULL);

UPDATE serv2
SET gross_profit = 164-161
WHERE record = 288;

UPDATE serv2
SET gross_profit = 200-192
WHERE record = 342;

UPDATE serv2
SET gross_profit = 203-199
WHERE record = 405;

ALTER TABLE serv2
ADD COLUMN bran_serv varchar;

UPDATE serv2
SET bran_serv = LOWER(branch) || '-' || UPPER(service);

SELECT bran_serv, revenue, cos, gross_profit
FROM serv2
GROUP BY bran_serv, revenue, cos, gross_profit
HAVING COUNT(*)>1;

SELECT record, branch, service, revenue, cos, gross_profit,
(gross_profit - AVG(gross_profit) over ()) / stddev(gross_profit) over () as zscore
FROM serv2;

SELECT * 
FROM
(SELECT record, bran_serv, revenue, cos, gross_profit,
(gross_profit - AVG(gross_profit) over ()) / stddev(gross_profit) over () as zscore
FROM serv2) AS outliers
WHERE zscore > 2.576
OR zscore <-2.576;

UPDATE serv2
SET gross_profit = 200-180
WHERE record = 364;

UPDATE serv2
SET gross_profit = 324-110
WHERE record = 412;

UPDATE serv2
SET gross_profit = 488-88
WHERE record = 330;