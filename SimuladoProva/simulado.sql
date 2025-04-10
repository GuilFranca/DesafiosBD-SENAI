CREATE DATABASE IF NOT EXISTS db_schooltracker
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

-- DROP DATABASE db_schooltracker;

CREATE TABLE IF NOT EXISTS tb_escolaridade (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_aluno (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (255) NOT NULL,
    email VARCHAR (255) UNIQUE NOT NULL,
    telefone VARCHAR (20) NOT NULL,
    data_nascimento DATE NOT NULL,
    hobbies TEXT NOT NULL,
    pontos_melhoria TEXT NULL,
    ra INTEGER UNIQUE NOT NULL,
    id_escolaridade INTEGER NOT NULL,
CONSTRAINT fk_escolaridade_id FOREIGN KEY (id_escolaridade)
REFERENCES tb_escolaridade(id)
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_diariobordo (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    datahora DATETIME NOT NULL,
    texto TEXT NOT NULL,
    fk_aluno_id INTEGER,
    FOREIGN KEY (fk_aluno_id) REFERENCES tb_aluno(id) ON DELETE CASCADE
)AUTO_INCREMENT=1;

INSERT INTO tb_escolaridade (nome) VALUES
('Ensino Fundamental'),
('Ensino Médio'),
('Ensino Técnico'),
('Ensino Superior');

INSERT INTO tb_aluno ( nome, email, telefone, data_nascimento, hobbies, pontos_melhoria, ra, id_escolaridade ) VALUES
('Ana Souza', 'ana.souza@email.com', '+55 11 91234-5678', '2005-06-12', 'leitura, filmes', 'Melhorou na escrita', 1001, 1),
('Bruno Lima', 'bruno.lima@email.com', '+55 11 99876-5432', '2003-03-25', 'futebol, games', 'Participação em sala', 1002, 2),
('Carla Mendes', 'carla.mendes@email.com', '+55 21 98765-4321', '2004-09-30', 'dança, música', 'Trabalho em equipe', 1003, 3),
('Daniel Rocha', 'daniel.rocha@email.com', '+55 31 97654-3210', '2002-12-18', 'corrida, xadrez', NULL, 1004, 4),
('Eduarda Pires', 'eduarda.pires@email.com', '+55 41 96543-2109', '2001-02-10', 'desenho, leitura', 'Organização melhorou', 1005, 2),
('Felipe Costa', 'felipe.costa@email.com', '+55 51 95432-1098', '2000-07-22', 'natação, robótica', NULL, 1006, 3),
('Gabriela Nunes', 'gabriela.nunes@email.com', '+55 61 94321-0987', '2005-11-05', 'pintura, filmes', 'Mais comunicativa', 1007, 1),
('Henrique Silva', 'henrique.silva@email.com', '+55 71 93210-9876', '2003-04-08', 'programação, séries', NULL, 1008, 4),
('Isabela Martins', 'isabela.martins@email.com', '+55 81 92109-8765', '2002-08-15', 'viagens, culinária', 'Redação evoluiu', 1009, 2),
('João Pedro', 'joao.pedro@email.com', '+55 91 91098-7654', '2001-01-03', 'basquete, leitura', 'Melhor foco em aula', 1010, 3);

-- Pesquise a escolaridade
SELECT * FROM tb_escolaridade;

SELECT 
    tb_aluno.nome AS aluno, 
    tb_escolaridade.nome AS escolaridade
FROM 
    tb_aluno
INNER JOIN 
    tb_escolaridade ON tb_aluno.id_escolaridade = tb_escolaridade.id;
    
SELECT COUNT(*) FROM tb_aluno;
SELECT a.nome as aluno, e.nome as escolaridade
FROM tb_aluno as a
INNER JOIN tb_escolaridade as e
WHERE a.id_escolaridade = e.id; -- fk = pk
