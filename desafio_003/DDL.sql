-- DDL Criação de tabela

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