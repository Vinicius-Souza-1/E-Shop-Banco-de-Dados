USE portfolio_eshop;
-- PARTE 3 - DADOS ADAPTADOS PARA DEMONSTRACAO
-- Execute os dados uma unica vez.
INSERT INTO Clientes
    (id, nome, email, senha, endereco, telefone)
VALUES
    (1, 'Pessoa Exemplo 1', 'cliente1@example.com', 'NAO_E_CREDENCIAL',
     'Endereco demonstrativo', '00000000000'),
    (2, 'Pessoa Exemplo 2', 'cliente2@example.com', 'NAO_E_CREDENCIAL',
     'Endereco demonstrativo', '00000000000');

INSERT INTO Funcionarios
    (id, nome, cargo, salario, data_contratacao)
VALUES
    (1, 'Pessoa Exemplo 5', 'Gerente', 4500.00, '2022-01-15'),
    (2, 'Pessoa Exemplo 6', 'Vendedor', 2500.00, '2021-10-01');

INSERT INTO Produtos
    (id, nome, descricao, preco, quantidade_estoque)
VALUES
    (1, 'Smartphone XYZ',
     'Smartphone com tela de 6.5", 128GB de armazenamento e câmera de 48MP',
     1500.00, 25),
    (2, 'Fone de Ouvido Bluetooth',
     'Fone de ouvido bluetooth com cancelamento de ruído',
     300.00, 50);

INSERT INTO Pedidos
    (id, id_cliente, id_funcionario, data_pedido, status)
VALUES
    (1, 1, 1, '2023-03-25', 'Entregue'),
    (2, 2, 2, '2023-03-28', 'Em andamento');

INSERT INTO ItensPedidos
    (id_pedido, id_produto, quantidade, preco_unitario)
VALUES
    (1, 1, 1, 1500.00),
    (1, 2, 2, 300.00),
    (2, 2, 1, 300.00);

-- PARTE 4 - NOVOS CONJUNTOS DE DADOS
START TRANSACTION;

INSERT INTO Clientes
    (id, nome, email, senha, endereco, telefone)
VALUES
    (3, 'Pessoa Exemplo 3', 'cliente3@example.com', 'NAO_E_CREDENCIAL',
     'Endereco demonstrativo', '00000000000'),
    (4, 'Pessoa Exemplo 4', 'cliente4@example.com', 'NAO_E_CREDENCIAL',
     'Endereco demonstrativo', '00000000000');

INSERT INTO Funcionarios
    (id, nome, cargo, salario, data_contratacao)
VALUES
    (3, 'Pessoa Exemplo 7', 'Vendedora', 3500.00, '2022-12-10'),
    (4, 'Pessoa Exemplo 8', 'Gerente', 6800.00, '2020-02-10');

INSERT INTO Produtos
    (id, nome, descricao, preco, quantidade_estoque)
VALUES
    (3, 'Notebook Dell',
     'Notebook com 16GB de memória e SSD de 512GB',
     3700.00, 12),
    (4, 'Mouse Anatômico Sem Fio',
     'Mouse sem fio com bateria recarregável via conexão USB',
     650.00, 20),
    (5, 'Teclado Mecânico Gamer',
     'Teclado mecânico com iluminação RGB e teclas multimídia',
     320.00, 15);

INSERT INTO Pedidos
    (id, id_cliente, id_funcionario, data_pedido, status)
VALUES
    (3, 3, 3, '2026-09-19', 'Em andamento'),
    (4, 4, 4, '2025-05-18', 'Entregue');

INSERT INTO ItensPedidos
    (id_pedido, id_produto, quantidade, preco_unitario)
VALUES
    (3, 3, 5, 3700.00),
    (3, 4, 2, 650.00),
    (4, 4, 3, 650.00),
    (4, 5, 2, 320.00);

COMMIT;

