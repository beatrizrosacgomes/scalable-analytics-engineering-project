CREATE OR REPLACE TABLE `analytics-dev.refined.dim_marca` AS
SELECT
    ROW_NUMBER() OVER (ORDER BY id) AS id_marca,   -- surrogate key
    id AS id_marca_origem,                         -- natural key
    nome AS nome_marca
FROM `analytics-dev.trusted.marca`;
