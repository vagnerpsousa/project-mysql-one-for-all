CREATE VIEW top_2_hits_do_momento AS
SELECT
C.titulo_cancao AS 'cancao',
COUNT(*) AS 'reproducoes'
FROM SpotifyClone.cancao C
INNER JOIN SpotifyClone.historico_reproducoes HR
ON C.cancao_id = HR.cancao_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
