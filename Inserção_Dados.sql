USE `e-commerce`;

INSERT INTO cliente (`idCliente`, `Nome`, `Endereço`, `Tipo`, `CPF`, `CNPJ`) VALUES
(1, 'João Silva', 'Rua A, 123', 'PF', '12345678901', NULL),
(2, 'Maria Oliveira', 'Avenida B, 126', 'PF', '98765432109', NULL),
(3, 'Empresa A', 'Rua C, 129', 'PJ', NULL, '12345678000190'),
(4, 'Pedro Santos', 'Travessa D, 131', 'PF', '11223344556', NULL),
(5, 'Ana Souza', 'Praça E, 146', 'PF', '66554433221', NULL),
(6, 'Empresa B', 'Largo F, 148', 'PJ', NULL, '98765432000180'),
(7, 'Carlos Pereira', 'Rua G, 179', 'PF', '45678901234', NULL),
(8, 'Laura Rodrigues', 'Avenida H, 187', 'PF', '43210987654', NULL),
(9, 'Empresa C', 'Rua I, 228', 'PJ', NULL, '56789012000170'),
(10, 'Rafael Almeida', 'Travessa J, 244', 'PF', '78901234567', NULL);


INSERT INTO fornecedor (`idFornecedor`, `Razão Social`, `CNPJ`) VALUES
(1, 'Fornecedor A', '12345678000190'),
(2, 'Fornecedor B', '98765432000180'),
(3, 'Fornecedor C', '56789012000170'),
(4, 'Fornecedor D', '11223344000160'),
(5, 'Fornecedor E', '66554433000150'),
(6, 'Fornecedor F', '45678901000140'),
(7, 'Fornecedor G', '43210987000130'),
(8, 'Fornecedor H', '78901234000120'),
(9, 'Fornecedor I', '90123456000110'),
(10, 'Fornecedor J', '34567890000100'),
(11, 'Fornecedor K', '23456789000199'),
(12, 'Fornecedor L', '87654321000188'),
(13, 'Fornecedor M', '67890123000177'),
(14, 'Fornecedor N', '54321098000166'),
(15, 'Fornecedor O', '10987654000155');


INSERT INTO pedido (`idPedido`, `Status do pedido`, `Descrição`, `Cliente_idCliente`, `Frete`) VALUES
(1, 'Em processamento', 'Pedido de eletrônicos', 1, 15.00),
(2, 'Enviado', 'Pedido de roupas', 2, 10.00),
(3, 'Entregue', 'Pedido de livros', 3, 5.00),
(4, 'Cancelado', 'Pedido de brinquedos', 4, 0.00),
(5, 'Em processamento', 'Pedido de alimentos', 5, 20.00),
(6, 'Enviado', 'Pedido de móveis', 6, 30.00),
(7, 'Entregue', 'Pedido de ferramentas', 7, 12.00),
(8, 'Cancelado', 'Pedido de cosméticos', 8, 0.00),
(9, 'Em processamento', 'Pedido de decoração', 9, 18.00),
(10, 'Enviado', 'Pedido de joias', 10, 25.00);


INSERT INTO entrega (`idEntrega`, `Status`, `Código de Rastreio`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`) VALUES
(1, 'Em trânsito', 'BR123456789BR', 1, 1),
(2, 'Entregue', 'BR987654321BR', 2, 2),
(3, 'Extraviado', 'BR112233445BR', 3, 3),
(4, 'Cancelada', NULL, 4, 4),
(5, 'Em trânsito', 'BR665544332BR', 5, 5),
(6, 'Entregue', 'BR456789012BR', 6, 6),
(7, 'Em trânsito', 'BR432109876BR', 7, 7),
(8, 'Cancelada', NULL, 8, 8),
(9, 'Em trânsito', 'BR789012345BR', 9, 9),
(10, 'Entregue', 'BR901234567BR', 10, 10);


INSERT INTO produto (`idProduto`, `Categoria`, `Descrição`, `Valor`) VALUES
(1, 'Eletrônicos', 'Smartphone XYZ', '1200.00'),
(2, 'Roupas', 'Camiseta Algodão', '35.00'),
(3, 'Livros', 'Aventuras na Selva', '25.00'),
(4, 'Brinquedos', 'Carrinho de Controle Remoto', '80.00'),
(5, 'Alimentos', 'Pacote de Café 500g', '15.00'),
(6, 'Móveis', 'Sofá Retrátil 3 Lugares', '1800.00'),
(7, 'Ferramentas', 'Jogo de Chaves de Fenda', '45.00'),
(8, 'Cosméticos', 'Creme Hidratante Facial', '28.00'),
(9, 'Decoração', 'Vaso de Cerâmica', '60.00'),
(10, 'Joias', 'Colar de Prata', '350.00'),
(11, 'Eletrônicos', 'Notebook ABC', '2500.00'),
(12, 'Roupas', 'Calça Jeans', '70.00');


INSERT INTO pagamento (`idPagamento`, `Tipo`, `Número do Cartão`, `Validade do Cartão`, `Código de Segurança`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`) VALUES
(1, 'Cartão de Crédito', '1234567890123456', '12/24', '123', 1, 1),
(2, 'Boleto Bancário', NULL, NULL, NULL, 2, 2),
(3, 'PIX', NULL, NULL, NULL, 3, 3),
(4, 'Cartão de Débito', '9876543210987654', '11/25', '456', 4, 4),
(5, 'Cartão de Crédito', '1122334455667788', '01/26', '789', 5, 5),
(6, 'Transferência Bancária', NULL, NULL, NULL, 6, 6),
(7, 'Cartão de Crédito', '6655443322119900', '02/27', '012', 7, 7),
(8, 'PIX', NULL, NULL, NULL, 8, 8),
(9, 'Cartão de Débito', '4567890123456789', '03/28', '345', 9, 9),
(10, 'Boleto Bancário', NULL, NULL, NULL, 10, 10),
(11, 'Cartão de Crédito', '4321098765432109', '04/29', '678', 1, 1),
(12, 'Transferência Bancária', NULL, NULL, NULL, 2, 2);


INSERT INTO estoque (`idEstoque`, `Local`) VALUES
(1, 'Armazém Central, Rua A, 100'),
(2, 'Filial Norte, Avenida B, 200'),
(3, 'Filial Sul, Rua C, 300'),
(4, 'Armazém Oeste, Avenida D, 400'),
(5, 'Armazém Leste, Rua E, 500'),
(6, 'Centro de Distribuição 1, Avenida F, 600'),
(7, 'Centro de Distribuição 2, Rua G, 700'),
(8, 'Loja Principal, Avenida H, 800'),
(9, 'Loja Online, Rua I, 900'),
(10, 'Armazém Secundário, Avenida J, 1000'),
(11, 'Filial Centro, Rua K, 1100'),
(12, 'Filial Leste, Avenida L, 1200'),
(13, 'Armazém Norte, Rua M, 1300'),
(14, 'Armazém Sul, Avenida N, 1400'),
(15, 'Centro de Distribuição 3, Rua O, 1500'),
(16, 'Centro de Distribuição 4, Avenida P, 1600'),
(17, 'Loja Secundária, Rua Q, 1700'),
(18, 'Loja Terceirizada 1, Avenida R, 1800'),
(19, 'Loja Terceirizada 2, Rua S, 1900'),
(20, 'Armazém Remoto, Avenida T, 2000');


INSERT INTO `terceiro - vendedor` (`idTerceiro - Vendedor`, `Razão Social`, `Local`) VALUES
(1, 'Vendedor A', 'Rua X, 10'),
(2, 'Vendedor B', 'Avenida Y, 20'),
(3, 'Vendedor C', 'Travessa Z, 30'),
(4, 'Vendedor D', 'Praça W, 40'),
(5, 'Vendedor E', 'Rua V, 50'),
(6, 'Vendedor F', 'Avenida U, 60'),
(7, 'Vendedor G', 'Travessa T, 70'),
(8, 'Vendedor H', 'Praça S, 80');


INSERT INTO `produto_tem_estoque` (`Produto_idProduto`, `Estoque_idEstoque`, `Quantidade`) VALUES
(1, 1, 100), -- Smartphone XYZ no Armazém Central
(2, 2, 500), -- Camiseta Algodão na Filial Norte
(3, 3, 200), -- Aventuras na Selva na Filial Sul
(4, 4, 150), -- Carrinho de Controle Remoto no Armazém Oeste
(5, 5, 300), -- Pacote de Café 500g no Armazém Leste
(6, 6, 50),  -- Sofá Retrátil 3 Lugares no Centro de Distribuição 1
(7, 7, 250), -- Jogo de Chaves de Fenda no Centro de Distribuição 2
(8, 8, 400), -- Creme Hidratante Facial na Loja Principal
(9, 9, 180), -- Vaso de Cerâmica na Loja Online
(10, 10, 80); -- Colar de Prata no Armazém Secundário


INSERT INTO `disponibilizando um produto` (`Fornecedor_idFornecedor`, `Produto_idProduto`) VALUES
(1, 1),  -- Fornecedor A disponibiliza Smartphone XYZ
(2, 2),  -- Fornecedor B disponibiliza Camiseta Algodão
(3, 3),  -- Fornecedor C disponibiliza Aventuras na Selva
(4, 4),  -- Fornecedor D disponibiliza Carrinho de Controle Remoto
(5, 5),  -- Fornecedor E disponibiliza Pacote de Café 500g
(6, 6),  -- Fornecedor F disponibiliza Sofá Retrátil 3 Lugares
(7, 7),  -- Fornecedor G disponibiliza Jogo de Chaves de Fenda
(8, 8),  -- Fornecedor H disponibiliza Creme Hidratante Facial
(9, 9),  -- Fornecedor I disponibiliza Vaso de Cerâmica
(10, 10); -- Fornecedor J disponibiliza Colar de Prata


INSERT INTO `relação de produto/pedido` (`Produto_idProduto`, `Pedido_idPedido`, `Quantidade`) VALUES
(1, 1, '2'),  -- Smartphone XYZ no Pedido 1 (2 unidades)
(2, 2, '5'),  -- Camiseta Algodão no Pedido 2 (5 unidades)
(3, 3, '1'),  -- Aventuras na Selva no Pedido 3 (1 unidade)
(4, 4, '3'),  -- Carrinho de Controle Remoto no Pedido 4 (3 unidades)
(5, 5, '10'), -- Pacote de Café 500g no Pedido 5 (10 unidades)
(6, 6, '1'),  -- Sofá Retrátil 3 Lugares no Pedido 6 (1 unidade)
(7, 7, '2'),  -- Jogo de Chaves de Fenda no Pedido 7 (2 unidades)
(8, 8, '4'),  -- Creme Hidratante Facial no Pedido 8 (4 unidades)
(9, 9, '1'),  -- Vaso de Cerâmica no Pedido 9 (1 unidade)
(10, 10, '1'); -- Colar de Prata no Pedido 10 (1 unidade)


INSERT INTO `produtos por vendedor (terceiro)` (`Terceiro - Vendedor_idTerceiro - Vendedor`, `Produto_idProduto`, `Quantidade`) VALUES
(1, 1, 50),   -- Vendedor A vende 50 unidades de Smartphone XYZ
(2, 2, 200),  -- Vendedor B vende 200 unidades de Camiseta Algodão
(3, 3, 100),  -- Vendedor C vende 100 unidades de Aventuras na Selva
(4, 4, 75),   -- Vendedor D vende 75 unidades de Carrinho de Controle Remoto
(5, 5, 150),  -- Vendedor E vende 150 unidades de Pacote de Café 500g
(6, 6, 25),   -- Vendedor F vende 25 unidades de Sofá Retrátil 3 Lugares
(7, 7, 125),  -- Vendedor G vende 125 unidades de Jogo de Chaves de Fenda
(8, 8, 200),  -- Vendedor H vende 200 unidades de Creme Hidratante Facial
(1, 9, 90),   -- Vendedor A vende 90 unidades de Vaso de Cerâmica
(2, 10, 40);  -- Vendedor B vende 40 unidades de Colar de Prata
