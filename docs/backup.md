# Backup e restauração

Procedimento de estudo. Execute os comandos CMD no terminal do Windows, e os comandos SQL no Workbench. Os programas mysql e mysqldump precisam estar disponíveis no terminal.

```sql
-- PARTE 11 - BACKUP E RESTAURACAO
-- IMPORTANTE: esta parte possui comandos para dois locais diferentes.
-- Leia as instrucoes antes de copiar ou executar.

-- 11.1 BACKUP COMPLETO
-- Execute o comando abaixo no Prompt de Comando (CMD) do Windows.
-- Nao execute este comando no editor SQL do MySQL Workbench.
-- Ele cria o arquivo backup_loja.sql na pasta aberta no CMD.
-- Digite a senha do usuario root quando ela for solicitada.
--
-- mysqldump -u root -p --port=3306 --single-transaction --routines --triggers --events portfolio_eshop > backup_loja.sql

-- 11.2 CRIACAO DO BANCO PARA TESTAR A RESTAURACAO
-- O comando abaixo e SQL e deve ser executado no MySQL Workbench.
-- Remova os dois hifens das duas linhas, execute uma vez e depois comente novamente.
--
-- CREATE DATABASE IF NOT EXISTS portfolio_eshop_restaurada
--     CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 11.3 RESTAURACAO DO BACKUP
-- Depois de criar portfolio_eshop_restaurada, execute o comando abaixo no CMD do Windows.
-- O CMD deve estar aberto na pasta em que backup_loja.sql foi salvo.
-- Digite a senha do usuario root quando ela for solicitada.
--
-- mysql -u root -p --port=3306 portfolio_eshop_restaurada < backup_loja.sql

-- 11.4 CONFERENCIA DA RESTAURACAO
-- Depois da restauracao, execute as consultas abaixo no MySQL Workbench.
-- Elas permanecem comentadas para nao mudar automaticamente o banco em uso.
--
-- USE portfolio_eshop_restaurada;
-- SHOW TABLES;
-- SELECT 'Clientes' AS tabela, COUNT(*) AS quantidade FROM Clientes
-- UNION ALL SELECT 'Funcionarios', COUNT(*) FROM Funcionarios
-- UNION ALL SELECT 'Produtos', COUNT(*) FROM Produtos
-- UNION ALL SELECT 'Pedidos', COUNT(*) FROM Pedidos
-- UNION ALL SELECT 'ItensPedidos', COUNT(*) FROM ItensPedidos;
--
-- Resultado esperado: Clientes 4, Funcionarios 4, Produtos 5,
-- Pedidos 4 e ItensPedidos 7.
-- Para voltar ao banco principal depois do teste, execute: USE portfolio_eshop;


```

Os arquivos de backup ficam apenas no computador e não devem ser publicados. Depois de restaurar, confira as contagens e os dados. Usuários e roles não são incluídos pelo backup de um único banco.
