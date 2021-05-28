CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(valor_plano), 2) AS 'faturamento_minimo',
ROUND(MAX(valor_plano), 2) AS 'faturamento_maximo',
ROUND(SUM(valor_plano)/(SELECT COUNT(*) FROM SpotifyClone.usuario), 2) AS 'faturamento_medio',
ROUND(SUM(valor_plano), 2) AS 'faturamento_total'
FROM SpotifyClone.plano;
