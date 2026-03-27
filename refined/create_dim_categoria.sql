CREATE TABLE `analytics-dev.refined.dim_categoria` AS
SELECT
    ROW_NUMBER() OVER(ORDER BY categoria) AS id_categoria,
    categoria
FROM (
    SELECT DISTINCT
        categoria
    FROM `analytics-dev.trusted.produto`
    WHERE categoria IS NOT NULL
);
