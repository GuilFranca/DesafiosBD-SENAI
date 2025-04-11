CREATE DATABASE if not exists db_EntregasProdutos
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE db_EntregasProdutos;

-- DROP DATABASE db_EntregasProdutos;

-- DDL Criação de tabelas
CREATE TABLE produto(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(50),
    custo_producao FLOAT NOT NULL,
    preco_venda FLOAT NOT NULL,
    porcentagem_ifood INT NOT NULL,
    valor_ifood FLOAT NOT NULL,
    margem_lucro INT NOT NULL
);

CREATE TABLE pedido(
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    valor FLOAT NOT NULL,
    endereco TEXT NOT NULL,
    nome_cliente VARCHAR(50),
    CPF char(11)
);

CREATE TABLE Pedido_Produto(
	id INT PRIMARY KEY AUTO_INCREMENT,
    produto_id INT NOT NULL,
    pedido_id INT NOT NULL,
    
    CONSTRAINT fk_produto_id FOREIGN KEY (produto_id) REFERENCES produto(id),
    CONSTRAINT fk_pedido_id FOREIGN KEY (pedido_id) REFERENCES pedido(id)
);

CREATE TABLE entrega(
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_entrega DATE NOT NULL,
    valor_entrega FLOAT NOT NULL,
    pedido_id INT NOT NULL,
    
    CONSTRAINT fk_pedido_entrega_id FOREIGN KEY (pedido_id) REFERENCES pedido(id)
);

-- DML Inserindo ou deletando elementos da tabela
INSERT INTO produto (nome, custo_producao, preco_venda, porcentagem_ifood, valor_ifood, margem_lucro) VALUES
('Sanduíche de Frango', 10, 14.29, 15, 2.14, 30),
('Lanche de Carne', 12, 17.14, 20, 3.43, 30),
('Suco Natural', 4, 5.71, 10, 0.57, 30),
('Combo', 26, 42.85, 15, 2.14, 30);

INSERT INTO pedido (data_pedido, valor, endereco, nome_cliente, CPF) VALUES
('2025-04-11', 20, 'Rua poggers 123, avenida Irineu', 'Jobersvaldo', '2345678123');

INSERT INTO Pedido_Produto (produto_id, pedido_id) VALUES
(1, 1),
(2, 1);

INSERT INTO entrega (data_entrega, valor_entrega, pedido_id) VALUES
('2025-04-11', 5, 1);

-- DQL Pesuisando as tabelas
SELECT * FROM produto;

SELECT * FROM pedido;

SELECT * FROM Pedido_Produto;

SELECT * FROM entrega;

SELECT
	pedido.id AS pedido_id,
    pedido.nome_cliente,
    produto.nome AS produto_nome,
    produto.preco_venda
FROM pedido
INNER JOIN Pedido_Produto ON pedido.id = Pedido_Produto.pedido_id
INNER JOIN produto ON produto.id = Pedido_Produto.produto_id;
