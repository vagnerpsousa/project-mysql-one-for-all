CREATE VIEW historico_reproducao_usuarios AS
SELECT U.nome_usuario AS 'usuario', C.titulo_cancao AS 'nome'
FROM SpotifyClone.usuario U INNER JOIN SpotifyClone.historico_reproducoes HR
ON U.usuario_id = HR.usuario_id INNER JOIN SpotifyClone.cancao C
ON C.cancao_id = HR.cancao_id
ORDER BY U.nome_usuario, C.titulo_cancao;
