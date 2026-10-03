-- Execute somente em um ambiente de estudos vazio.
-- PARTE 1 - CRIACAO DO BANCO
CREATE DATABASE portfolio_eshop
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE portfolio_eshop;

-- Confere a porta utilizada pela conexao atual.
SHOW VARIABLES LIKE 'port';

-- PARTE 2 - ESTRUTURA INICIAL SOLICITADA
CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(15)
) ENGINE = InnoDB;

CREATE TABLE Funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    data_contratacao DATE NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_pedido DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    CONSTRAINT fk_pedidos_clientes
        FOREIGN KEY (id_cliente) REFERENCES Clientes (id),
    CONSTRAINT fk_pedidos_funcionarios
        FOREIGN KEY (id_funcionario) REFERENCES Funcionarios (id)
) ENGINE = InnoDB;

CREATE TABLE ItensPedidos (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    CONSTRAINT fk_itens_pedidos
        FOREIGN KEY (id_pedido) REFERENCES Pedidos (id),
    CONSTRAINT fk_itens_produtos
        FOREIGN KEY (id_produto) REFERENCES Produtos (id)
) ENGINE = InnoDB;

