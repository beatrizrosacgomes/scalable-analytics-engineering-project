CREATE OR REPLACE TABLE `analytics-dev.refined.dim_data` AS
SELECT DISTINCT
    CAST(FORMAT_DATE('%Y%m%d', data) AS INT64) AS id_data,
    data,
    ano,
    mes,
    dia,
    FORMAT_DATE('%Y%m', data) AS ano_mes,
    FORMAT_DATE('%Y-%m', data) AS ano_mes_formatado
FROM `analytics-dev.trusted.data`;
