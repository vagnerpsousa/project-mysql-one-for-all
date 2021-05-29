DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
	BEFORE DELETE ON usuario
    FOR EACH ROW
BEGIN
	DELETE FROM SpotifyClone.historico_reproducoes
    WHERE usuario_id = OLD.usuario_id;
    DELETE FROM SpotifyClone.seguindo_artistas
    WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
