DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE artista(
	artista_id INT PRIMARY KEY AUTO_INCREMENT,
	nome_artista VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

INSERT INTO artista (nome_artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

CREATE TABLE plano(
	plano_id INT PRIMARY KEY AUTO_INCREMENT,
	nome_plano VARCHAR(50) NOT NULL,
	valor_plano INT NOT NULL
) ENGINE=InnoDB;

INSERT INTO plano (nome_plano, valor_plano)
VALUES
	('gratuito', 0),
	('familiar', 7.99),
	('universitário', 5.99);

CREATE TABLE album(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
	titulo_album VARCHAR(50) NOT NULL,
	artista_id INT NOT NULL,
	FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) ENGINE=InnoDB;

INSERT INTO album (titulo_album, artista_id)
VALUES
	('Envious', 1),
	('Exuberant', 1),
	('Hallowed Steam', 2),
	('Incandescent', 3),
	('Temporary Culture',4);
	
CREATE TABLE cancao(
	cancao_id INT PRIMARY KEY AUTO_INCREMENT,
	titulo_cancao VARCHAR(50) NOT NULL,
	album_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES album (album_id)
) ENGINE=InnoDB;

INSERT INTO cancao (titulo_cancao, album_id)
VALUES
	('Soul For Us', 1),
	('Reflections Of Magic', 1),
	('Dance With Her Own', 1),
	('Troubles Of My Inner Fire', 2),
	('Time Fireworks', 2),
	('Magic Circus', 3),
	('Honey, So Do I', 3),
	("Sweetie, Let's Go Wild", 3),
	('She Knows', 3),
	('Fantasy For Me', 4),
	('Celebration Of More', 4),
	('Rock His Everything', 4),
	('Home Forever', 4),
	('Diamond Power', 4),
	("Honey, Let's Be Silly", 4),
	('Thang Of Thunder', 5),
	('Words Of Her Life', 5),
	('Without My Streets', 5);

CREATE TABLE usuario(
	usuario_id INT PRIMARY KEY AUTO_INCREMENT,
	nome_usuario VARCHAR(50) NOT NULL,
	idade INT NOT NULL,
	plano_id INT NOT NULL,
	FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
) ENGINE=InnoDB;

INSERT INTO usuario (nome_usuario, idade, plano_id)
VALUES
	('Thati', 23, 1),
	('Cintia',35, 2),
	('Bill', 20, 3),
	('Roger', 45, 1);

CREATE TABLE historico_reproducoes(
	usuario_id INT,
	cancao_id INT,
	CONSTRAINT PRIMARY KEY(usuario_id, cancao_id),
	FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
	FOREIGN KEY (cancao_id) REFERENCES cancao (cancao_id)
) ENGINE=InnoDB;

INSERT INTO historico_reproducoes(usuario_id, cancao_id)
VALUES
	(1,1), (1,6), (1,14), (1,16),
	(2,13), (2, 17), (2, 2), (2, 15),
	(3, 4), (3, 16), (3, 6),
	(4, 3), (4, 18), (4, 11);

CREATE TABLE seguindo_artistas(
	usuario_id INT,
	artista_id INT,
	CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
	FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
	FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) ENGINE=InnoDB;

INSERT INTO seguindo_artistas(usuario_id, artista_id)
VALUES
	(1, 1), (1, 3), (1, 4),
    (2, 1), (2, 3),
    (3, 1), (3, 2),
    (4, 4);
