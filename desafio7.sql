CREATE VIEW perfil_artistas AS
SELECT
AR.nome_artista AS `artista`,
AL.titulo_album AS `album`,
(SELECT COUNT(artista_id) FROM SpotifyClone.seguindo_artistas
WHERE artista_id = AR.artista_id
group by nome_artista) AS `seguidores`
FROM SpotifyClone.artista AR
INNER JOIN SpotifyClone.album AL
ON AR.artista_id = AL.artista_id
ORDER BY `seguidores` DESC, `artista`, `album`;
