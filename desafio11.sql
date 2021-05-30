CREATE VIEW cancoes_premium AS
SELECT
C.titulo_cancao AS `nome`,
COUNT(HR.usuario_id) AS `reproducoes`
FROM SpotifyClone.cancao C
INNER JOIN SpotifyClone.historico_reproducoes HR
ON C.cancao_id = HR.cancao_id
INNER JOIN SpotifyClone.usuario U
ON U.usuario_id = HR.usuario_id
INNER JOIN SpotifyClone.plano P
ON U.plano_id = P.plano_id
WHERE P.nome_plano IN('familiar', 'universitario')
GROUP BY `nome`
ORDER BY `nome`;
