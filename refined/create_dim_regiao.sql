CREATE OR REPLACE TABLE `analytics-dev.refined.dim_regiao` AS
SELECT
    ROW_NUMBER() OVER (ORDER BY uf ASC) AS id_regiao,
    uf,
    
    CASE uf
        WHEN 'AC' THEN 'ACRE'
        WHEN 'AL' THEN 'ALAGOAS'
        WHEN 'AP' THEN 'AMAPA'
        WHEN 'AM' THEN 'AMAZONAS'
        WHEN 'BA' THEN 'BAHIA'
        WHEN 'CE' THEN 'CEARA'
        WHEN 'DF' THEN 'DISTRITO FEDERAL'
        WHEN 'ES' THEN 'ESPIRITO SANTO'
        WHEN 'GO' THEN 'GOIAS'
        WHEN 'MA' THEN 'MARANHAO'
        WHEN 'MT' THEN 'MATO GROSSO'
        WHEN 'MS' THEN 'MATO GROSSO DO SUL'
        WHEN 'MG' THEN 'MINAS GERAIS'
        WHEN 'PA' THEN 'PARA'
        WHEN 'PB' THEN 'PARAIBA'
        WHEN 'PR' THEN 'PARANA'
        WHEN 'PE' THEN 'PERNAMBUCO'
        WHEN 'PI' THEN 'PIAUI'
        WHEN 'RJ' THEN 'RIO DE JANEIRO'
        WHEN 'RN' THEN 'RIO GRANDE DO NORTE'
        WHEN 'RS' THEN 'RIO GRANDE DO SUL'
        WHEN 'RO' THEN 'RONDONIA'
        WHEN 'RR' THEN 'RORAIMA'
        WHEN 'SC' THEN 'SANTA CATARINA'
        WHEN 'SP' THEN 'SAO PAULO'
        WHEN 'SE' THEN 'SERGIPE'
        WHEN 'TO' THEN 'TOCANTINS'
        ELSE 'NAO IDENTIFICADO'
    END AS nome_estado,

    CASE 
        WHEN uf IN ('SP','RJ','MG','ES') THEN 'SUDESTE'
        WHEN uf IN ('PR','SC','RS') THEN 'SUL'
        WHEN uf IN ('GO','MT','MS','DF') THEN 'CENTRO-OESTE'
        WHEN uf IN ('BA','PE','CE','MA','PB','RN','AL','PI','SE') THEN 'NORDESTE'
        WHEN uf IN ('AM','PA','AC','RO','RR','AP','TO') THEN 'NORTE'
        ELSE 'NAO IDENTIFICADO'
    END AS regiao_macro

FROM (
    SELECT DISTINCT
        TRIM(UPPER(sgl_uf_entrega)) AS uf
    FROM `analytics-dev.trusted.pedido`
    WHERE sgl_uf_entrega IS NOT NULL
);
