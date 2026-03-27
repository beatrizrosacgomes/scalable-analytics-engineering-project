CREATE OR REPLACE VIEW 
`analytics-dev.refined.vw_top10_produtos_mensal_regiao` AS

WITH base AS (
    SELECT
        t.ano,
        t.mes,
        r.nome_estado,
        p.id_produto,
        p.nome_produto,
        SUM(f.qtd_produto) AS quantidade_vendida,
        SUM(f.valor_total_liquido) AS receita_total
    FROM `analytics-dev.refined.fato_vendas` f
    JOIN `analytics-dev.refined.dim_produto` p
        ON f.id_produto = p.id_produto
    JOIN `analytics-dev.refined.dim_data` t
        ON f.id_data = t.id_data
    JOIN `analytics-dev.refined.dim_regiao` r
        ON f.id_regiao = r.id_regiao
    WHERE f.flg_cancelado != 'S'
    GROUP BY
        t.ano,
        t.mes,
        r.nome_estado,
        p.id_produto,
        p.nome_produto
),

ranking AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY ano, mes, nome_estado
            ORDER BY quantidade_vendida DESC,
                     receita_total DESC,
                     id_produto
        ) AS ranking_produto
    FROM base
)

SELECT *
FROM ranking
WHERE ranking_produto <= 10;
