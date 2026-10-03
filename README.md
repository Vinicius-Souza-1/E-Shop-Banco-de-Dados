# E-Shop — banco de dados de uma loja

Projeto acadêmico de ADS organizado para o portfólio de Vinicius Itamar de Souza. Demonstra cadastro de clientes, funcionários, produtos, pedidos e itens de pedido, com dados fictícios.

## O que o projeto contém
- Cinco tabelas relacionadas por chaves estrangeiras.
- Regras CHECK para valores, quantidades e situação dos pedidos.
- Consultas com JOIN, views e exemplos de permissões por perfil.
- Procedimento de backup e restauração.

## Como executar no MySQL 8.4
Use uma conexão de estudos no MySQL Workbench. Abra cada arquivo em File > Open SQL Script e execute nesta ordem, uma única vez:

| Ordem | Arquivo | Finalidade |
|---|---|---|
| 1 | `sql/01_estrutura.sql` | Criar o banco isolado `portfolio_eshop` e as tabelas. |
| 2 | `sql/02_dados_ficticios.sql` | Inserir os registros demonstrativos. |
| 3 | `sql/03_integridade_views.sql` | Aplicar regras de integridade e criar views. |
| 4 | `sql/04_consultas.sql` | Consultar os dados e conferir resultados. |

Se ocorrer erro, pare e revise a mensagem antes do próximo arquivo. Se o banco já existir, use outro ambiente vazio; estes scripts não apagam seu trabalho anterior. Os testes de erro intencional no arquivo 04 permanecem comentados: selecione e execute um por vez, somente no ambiente de estudos.

O arquivo `05_permissoes_exemplo.sql` é opcional e está todo comentado. Para experimentar, faça uma cópia `permissoes.local.sql`, defina suas próprias senhas e execute com uma conta autorizada a criar usuários e roles. Não publique essa cópia. O backup está explicado em `docs/backup.md`.

## Resultados esperados
Clientes: 4; funcionários: 4; produtos: 5; pedidos: 4; itens de pedido: 7. As consultas de inconsistências devem retornar zero registros. Os testes inválidos devem ser recusados pelas constraints.

## Limites do estudo
Não há aplicação web nem mecanismo de autenticação de clientes. A coluna `senha` foi preservada para representar o esquema acadêmico, mas contém apenas `NAO_E_CREDENCIAL`, sem funcionalidade de login. O perfil de funcionário reproduz o exercício e inclui leitura da tabela Funcionarios; a separação dos dados salariais é uma melhoria futura. O controle automático de estoque também não está implementado.

## Preparação para o portfólio
Baseado em `E-Shop_Entrega_Final(2).sql`. Dados pessoais foram substituídos por exemplos. Usuários e senhas foram retirados da execução automática. O AUTO_INCREMENT foi levado à criação das tabelas para evitar alterar chaves já referenciadas. Os arquivos foram separados por etapa e receberam um banco de estudos próprio. Revisão estática realizada; execução em servidor MySQL ainda não realizada nesta preparação.
