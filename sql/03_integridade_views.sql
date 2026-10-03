USE portfolio_eshop;
-- PARTE 6 - MELHORIAS DE INTEGRIDADE E CONSISTENCIA
-- ATENCAO: execute esta parte somente uma vez no banco atual.
ALTER TABLE Clientes
    ADD CONSTRAINT chk_cliente_email
        CHECK (email LIKE '%_@_%._%'),
    ADD CONSTRAINT chk_cliente_telefone
        CHECK (telefone IS NULL OR telefone REGEXP '^[0-9]{10,15}$');

ALTER TABLE Funcionarios
    ADD CONSTRAINT chk_funcionario_salario
        CHECK (salario > 0);

ALTER TABLE Produtos
    ADD CONSTRAINT chk_produto_preco
        CHECK (preco > 0),
    ADD CONSTRAINT chk_produto_estoque
        CHECK (quantidade_estoque >= 0);

ALTER TABLE Pedidos
    ADD CONSTRAINT chk_pedido_status
        CHECK (status IN (
            'Aguardando pagamento',
            'Pago',
            'Em andamento',
            'Enviado',
            'Entregue',
            'Cancelado'
        ));

ALTER TABLE ItensPedidos
    ADD CONSTRAINT chk_item_quantidade
        CHECK (quantidade > 0),
    ADD CONSTRAINT chk_item_preco
        CHECK (preco_unitario > 0);

-- Conferencia dos indices criados pelas chaves primarias e estrangeiras.
SHOW INDEX FROM Pedidos;
SHOW INDEX FROM ItensPedidos;

-- PARTE 7 - VIEWS PARA ACESSO SEGURO
CREATE OR REPLACE VIEW vw_produtos_disponiveis AS
SELECT id, nome, descricao, preco, quantidade_estoque
FROM Produtos
WHERE quantidade_estoque > 0;

CREATE OR REPLACE VIEW vw_clientes_atendimento AS
SELECT id, nome, email, endereco, telefone
FROM Clientes;

