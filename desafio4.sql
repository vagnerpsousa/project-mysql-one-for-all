CREATE VIEW top_3_artistas AS
SELECT
	A.nome_artista AS 'artista',
	COUNT(*) AS 'seguidores'
FROM SpotifyClone.artista A 
INNER JOIN SpotifyClone.seguindo_artistas SA
ON A.artista_id = SA.artista_id
GROUP BY A.nome_artista
ORDER BY `seguidores` DESC, A.nome_artista
LIMIT 3;
