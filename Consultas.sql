-- Consultas SQL para o banco de dados e-commerce

USE `e-commerce`;

-- 1. Recuperações Simples com SELECT Statement

-- Selecionar todos os clientes
SELECT * FROM `cliente`;

-- Selecionar apenas o nome e CPF dos clientes
SELECT Nome, CPF FROM `cliente`;

-- Selecionar todos os produtos com suas categorias e valores
SELECT Categoria, Descrição, Valor FROM `produto`;

-- 2. Filtros com WHERE Statement

-- Selecionar clientes com CPF específico
SELECT * FROM `cliente` WHERE CPF = '12345678901';

-- Selecionar pedidos com status "Enviado"
SELECT * FROM `pedido` WHERE `Status do pedido` = 'Enviado';

-- Selecionar produtos com valor acima de 100 reais
SELECT * FROM `produto` WHERE Valor > '100.00';

-- 3. Crie Expressões para Gerar Atributos Derivados

-- Criar um atributo derivado que concatena o nome e o endereço do cliente
SELECT Nome, Endereço, CONCAT(Nome, ', ', Endereço) AS Nome_Endereço FROM `cliente`;

-- Calcular o valor total dos produtos fornecidos por cada fornecedor.
SELECT f.`Razão Social`, SUM(p.Valor * ps.Quantidade) AS Valor_Total_Produtos
FROM `fornecedor` f
JOIN `disponibilizando um produto` dp ON f.idFornecedor = dp.Fornecedor_idFornecedor
JOIN `produto` p ON dp.Produto_idProduto = p.idProduto
JOIN `produtos por vendedor (terceiro)` ps ON p.idProduto = ps.Produto_idProduto
GROUP BY f.`Razão Social`;


-- 4. Defina Ordenações dos Dados com ORDER BY

-- Ordenar clientes por nome em ordem alfabética
SELECT * FROM `cliente` ORDER BY Nome;

-- Ordenar produtos por valor em ordem decrescente
SELECT * FROM `produto` ORDER BY Valor DESC;

-- consulta para ordenar os pedidos pelo status do pedido e, em seguida, pelo cliente
SELECT * FROM `pedido` ORDER BY `Status do pedido`, Cliente_idCliente;

-- 5. Condições de Filtros aos Grupos – HAVING Statement

-- Selecionar categorias de produtos com valor médio acima de 50 reais
SELECT Categoria, AVG(Valor) AS Valor_Medio
FROM `e-commerce`.`produto`
GROUP BY Categoria
HAVING AVG(Valor) > '50.00';

-- Consulta para selecionar os estoques que possuem uma quantidade total de produtos acima de um determinado valor
SELECT e.idEstoque, e.Local, SUM(pe.Quantidade) AS Quantidade_Total
FROM `estoque` e
JOIN `produto_tem_estoque` pe ON e.idEstoque = pe.Estoque_idEstoque
GROUP BY e.idEstoque, e.Local
HAVING SUM(pe.Quantidade) > 200; -- Filtra estoques com mais de 200 produtos

-- 6. Crie Junções Entre Tabelas para Fornecer uma Perspectiva Mais Complexa dos Dados

-- Listar clientes e seus pedidos
SELECT c.Nome, p.idPedido, p.`Status do pedido`
FROM `cliente` c
JOIN `pedido` p ON c.idCliente = p.Cliente_idCliente;

-- Listar produtos e seus fornecedores
SELECT pr.Descrição, f.`Razão Social`
FROM `produto` pr
JOIN `disponibilizando um produto` dp ON pr.idProduto = dp.Produto_idProduto
JOIN `fornecedor` f ON dp.Fornecedor_idFornecedor = f.idFornecedor;

-- Listar pedidos, clientes e entregas
SELECT p.idPedido, c.Nome, e.`Código de Rastreio`
FROM `pedido` p
JOIN `cliente` c ON p.Cliente_idCliente = c.idCliente
JOIN `entrega` e ON p.idPedido = e.Pedido_idPedido AND p.Cliente_idCliente = e.Pedido_Cliente_idCliente;
