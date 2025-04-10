-- DDL criação de tabelas
CREATE DATABASE IF NOT EXISTS db_precificacao
CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

USE db_precificacao;

-- DROP DATABASE db_precificacao;

-- Tabela de produtos
CREATE TABLE IF NOT EXISTS tb_produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco_custo DECIMAL(10,2) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    valor_entrega DECIMAL(10,2) NOT NULL,
    porcentagem_ifood DECIMAL(5,2) NOT NULL
);

-- Tabela de combos
CREATE TABLE IF NOT EXISTS tb_combo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de relacionamento: produtos do combo
CREATE TABLE IF NOT EXISTS tb_combo_produto (
    id_combo INT,
    id_produto INT,
    PRIMARY KEY (id_combo, id_produto),
    FOREIGN KEY (id_combo) REFERENCES tb_combo(id),
    FOREIGN KEY (id_produto) REFERENCES tb_produto(id)
);

-- DML inserindo dados
-- Inserindo produtos
INSERT INTO tb_produto (nome, preco_custo, preco_venda, valor_entrega, porcentagem_ifood) VALUES
('Sanduíche de Frango', 8.50, 18.00, 5.00, 20.00),
('Lanche de Carne', 10.00, 22.00, 5.00, 25.00),
('Suco Natural', 4.00, 10.00, 3.00, 15.00);

-- Inserindo um combo com 2 produtos
INSERT INTO tb_combo (nome) VALUES ('Combo Frango + Suco');

-- Relacionando produtos com o combo
INSERT INTO tb_combo_produto (id_combo, id_produto) VALUES
(1, 1), -- Sanduíche de Frango
(1, 3); -- Suco Natural


-- DQL consulta de dados
SELECT 
    nome,
    preco_venda,
    porcentagem_ifood,
    ROUND((porcentagem_ifood / 100) * preco_venda, 2) AS valor_ifood
FROM 
    tb_produto;

-- Detalhes dos combos (produtos incluídos e valores):
SELECT 
    c.nome AS nome_combo,
    p.nome AS produto,
    p.preco_venda
FROM 
    tb_combo c
JOIN 
    tb_combo_produto cp ON c.id = cp.id_combo
JOIN 
    tb_produto p ON cp.id_produto = p.id;
