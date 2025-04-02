-- DQL Atualizar e Pesquisar.

-- CRUD Iserir, Atualizar, Deletar e Pesquisar.

-- Mostrando todas as tabelas
SHOW TABLES;

-- Consultas estatísticas sobre os ruídos
SELECT AVG(nivel) AS media_nivel FROM ruidos;
SELECT COUNT(nivel) AS total_registros FROM ruidos;
SELECT SUM(nivel) AS soma_nivel FROM ruidos;
SELECT MIN(nivel) AS menor_nivel FROM ruidos;
SELECT MAX(nivel) AS maior_nivel FROM ruidos;

-- Utilizando like
SELECT * FROM ruidos WHERE horario LIKE '%17%';
SELECT nivel FROM ruidos WHERE horario LIKE '%17%';

-- Atualização
UPDATE ruidos
SET nivel  = 85
WHERE id = 1;

SELECT * FROM ruidos;

-- Deletando
DELETE FROM ruidos WHERE id = 5;