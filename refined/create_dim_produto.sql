CREATE OR REPLACE TABLE `analytics-dev.refined.dim_produto` AS
SELECT
    ROW_NUMBER() OVER (ORDER BY p.id) AS id_produto,  -- surrogate key
    p.id AS id_produto_origem,                        -- natural key
    p.nome AS nome_produto,
    dm.id_marca,                                      -- surrogate da marca
    dc.id_categoria                                   -- surrogate da categoria
FROM `analytics-dev.trusted.produto` p

LEFT JOIN `analytics-dev.refined.dim_marca` dm
    ON p.id_marca = dm.id_marca_origem

LEFT JOIN `analytics-dev.refined.dim_categoria` dc
    ON TRIM(UPPER(p.categoria)) = dc.categoria;
