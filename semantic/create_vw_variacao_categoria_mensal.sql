CREATE OR REPLACE VIEW 
`analytics-dev.refined.vw_variacao_categoria_mensal` AS

WITH base AS (
    SELECT
        t.ano,
        t.mes,
        c.categoria,
        SUM(f.valor_total_bruto) AS receita_liquida
    FROM `analytics-dev.refined.fato_vendas` f
    JOIN `analytics-dev.refined.dim_data` t
        ON f.id_data = t.id_data
    JOIN `analytics-dev.refined.dim_produto` p
        ON f.id_produto = p.id_produto
    JOIN `analytics-dev.refined.dim_categoria` c
        ON p.id_categoria = c.id_categoria
    WHERE f.flg_cancelado != 'S'
    GROUP BY
        t.ano,
        t.mes,
        c.categoria
),

variacao AS (
    SELECT
        *,
        LAG(receita_liquida) OVER (
            PARTITION BY categoria
            ORDER BY ano, mes
        ) AS receita_mes_anterior
    FROM base
)

SELECT
    ano,
    mes,
    categoria,
    receita_liquida,
    receita_mes_anterior,
    SAFE_DIVIDE(
        receita_liquida - receita_mes_anterior,
        receita_mes_anterior
    ) AS variacao_percentual
FROM variacao;
