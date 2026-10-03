USE portfolio_eshop;
-- PARTE 5 - VERIFICACAO DA INTEGRIDADE ATUAL
-- Estas consultas devem retornar zero registros quando os dados estao corretos.
SELECT * FROM Produtos
WHERE preco <= 0 OR quantidade_estoque < 0;

SELECT * FROM Funcionarios
WHERE salario <= 0;

SELECT * FROM ItensPedidos
WHERE quantidade <= 0 OR preco_unitario <= 0;

SELECT * FROM Pedidos
WHERE id_cliente IS NULL OR id_funcionario IS NULL;

SELECT email, COUNT(*) AS quantidade
FROM Clientes
GROUP BY email
HAVING COUNT(*) > 1;

SELECT p.id AS pedido_sem_item
FROM Pedidos AS p
LEFT JOIN ItensPedidos AS ip ON ip.id_pedido = p.id
WHERE ip.id_pedido IS NULL;

SELECT DISTINCT status
FROM Pedidos
ORDER BY status;

-- PARTE 9 - CONFERENCIA FINAL DOS DADOS
SELECT 'Clientes' AS tabela, COUNT(*) AS quantidade
FROM Clientes
UNION ALL
SELECT 'Funcionarios', COUNT(*) FROM Funcionarios
UNION ALL
SELECT 'Produtos', COUNT(*) FROM Produtos
UNION ALL
SELECT 'Pedidos', COUNT(*) FROM Pedidos
UNION ALL
SELECT 'ItensPedidos', COUNT(*) FROM ItensPedidos;

SELECT
    p.id AS numero_pedido,
    c.nome AS cliente,
    f.nome AS funcionario,
    pr.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    p.status
FROM Pedidos AS p
INNER JOIN Clientes AS c
    ON c.id = p.id_cliente
INNER JOIN Funcionarios AS f
    ON f.id = p.id_funcionario
INNER JOIN ItensPedidos AS ip
    ON ip.id_pedido = p.id
INNER JOIN Produtos AS pr
    ON pr.id = ip.id_produto
ORDER BY p.id, pr.nome;

-- PARTE 10 - TESTES DAS CONSTRAINTS
-- Os comandos abaixo devem gerar erro. Por isso permanecem comentados.
-- Execute um teste por vez e tire uma captura da mensagem apresentada.

-- Teste de preco negativo:
-- INSERT INTO Produtos
--     (nome, descricao, preco, quantidade_estoque)
-- VALUES ('Produto inválido', 'Teste', -50.00, 10);

-- Teste de estoque negativo:
-- INSERT INTO Produtos
--     (nome, descricao, preco, quantidade_estoque)
-- VALUES ('Produto inválido', 'Teste', 100.00, -5);

-- Teste de quantidade igual a zero:
-- INSERT INTO ItensPedidos
--     (id_pedido, id_produto, quantidade, preco_unitario)
-- VALUES (1, 3, 0, 3700.00);

-- Teste de status invalido:
-- UPDATE Pedidos
-- SET status = 'Finalizado incorretamente'
-- WHERE id = 1;

