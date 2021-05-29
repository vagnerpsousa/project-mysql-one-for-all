DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(50))
BEGIN
SELECT
nome_artista AS `artista`,
titulo_album AS `album`
FROM SpotifyClone.artista AR
INNER JOIN SpotifyClone.album AL
ON AR.artista_id = AL.artista_id
WHERE AR.nome_artista = 'Walter Phoenix'
ORDER BY nome;
END $$
DELIMITER ;
