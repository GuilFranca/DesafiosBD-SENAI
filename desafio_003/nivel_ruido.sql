CREATE DATABASE IF NOT EXISTS dbpesquisa;
USE dbpesquisa;

CREATE TABLE IF NOT EXISTS ruidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nivel INT NOT NULL,
    horario TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS cruzamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS niveis_medios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ruido_id INT NOT NULL,
    cruzamento_id INT NOT NULL,
    CONSTRAINT fk_ruido_id FOREIGN KEY (ruido_id) REFERENCES ruidos(id) ON DELETE CASCADE,
    CONSTRAINT fk_cruzamento_id FOREIGN KEY (cruzamento_id) REFERENCES cruzamentos(id) ON DELETE CASCADE
);

INSERT INTO ruidos (nivel, horario) VALUES
(85, '12:24'),
(92, '12:45'),
(95, '13:00'),
(98, '13:30'),
(101, '14:00'),
(103, '14:15'),
(107, '14:30'),
(110, '15:00'),
(114, '15:15'),
(117, '15:30'),
(120, '16:00'),
(120, '16:15'),
(122, '16:30'),
(125, '17:00'),
(127, '17:15'),
(112, '17:30');

-- Consultas estatísticas sobre os ruídos
SELECT AVG(nivel) AS media_nivel FROM ruidos;
SELECT COUNT(nivel) AS total_registros FROM ruidos;
SELECT SUM(nivel) AS soma_nivel FROM ruidos;
SELECT MIN(nivel) AS menor_nivel FROM ruidos;
SELECT MAX(nivel) AS maior_nivel FROM ruidos;