
-- -----------------------------------------------------
-- Schema e-commerce
-- -----------------------------------------------------

-- Cria o esquema do banco de dados "e-commerce" se ele não existir
CREATE SCHEMA IF NOT EXISTS `e-commerce`;

-- Define o esquema "e-commerce" como o esquema padrão a ser usado
USE `e-commerce` ;

-- -----------------------------------------------------
-- Tabela `e-commerce`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `Endereço` VARCHAR(45) NULL DEFAULT NULL,
  `Tipo` ENUM('PF', 'PJ') NOT NULL,
  `CPF` VARCHAR(45) NULL DEFAULT NULL,
  `CNPJ` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
);


-- -----------------------------------------------------
-- Tabela `e-commerce`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`fornecedor` (
  `idFornecedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL DEFAULT NULL,
  `CNPJ` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`)
);


-- -----------------------------------------------------
-- Tabela `e-commerce`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`produto` (
  `idProduto` INT NOT NULL,
  `Categoria` VARCHAR(45) NULL DEFAULT NULL,
  `Descrição` VARCHAR(45) NULL DEFAULT NULL,
  `Valor` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
);


-- -----------------------------------------------------
-- Tabela `e-commerce`.`disponibilizando um produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`disponibilizando um produto` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`),
  INDEX `fk_Fornecedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Fornecedor_has_Produto_Fornecedor_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `e-commerce`.`fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `e-commerce`.`produto` (`idProduto`)
);


-- -----------------------------------------------------
-- Tabela `e-commerce`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`pedido` (
  `idPedido` INT NOT NULL,
  `Status do pedido` VARCHAR(45) NULL DEFAULT NULL,
  `Descrição` VARCHAR(45) NULL DEFAULT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Frete` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_idCliente`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `e-commerce`.`cliente` (`idCliente`)
);

-- -----------------------------------------------------
-- Tabela `e-commerce`.`entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`entrega` (
  `idEntrega` INT NOT NULL,
  `Status` VARCHAR(45) NULL DEFAULT NULL,
  `Código de Rastreio` VARCHAR(45) NULL DEFAULT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idEntrega`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`),
  INDEX `fk_Entrega_Pedido1_idx` (`Pedido_idPedido` ASC, `Pedido_Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Entrega_Pedido1`
    FOREIGN KEY (`Pedido_idPedido` , `Pedido_Cliente_idCliente`)
    REFERENCES `e-commerce`.`pedido` (`idPedido` , `Cliente_idCliente`)
);


-- -----------------------------------------------------
-- Tabela `e-commerce`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`estoque` (
  `idEstoque` INT NOT NULL,
  `Local` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idEstoque`)
);

-- -----------------------------------------------------
-- Tabela `e-commerce`.`pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`pagamento` (
  `idPagamento` INT NOT NULL,
  `Tipo` VARCHAR(45) NULL DEFAULT NULL,
  `Número do Cartão` VARCHAR(45) NULL DEFAULT NULL,
  `Validade do Cartão` VARCHAR(45) NULL DEFAULT NULL,
  `Código de Segurança` VARCHAR(45) NULL DEFAULT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idPagamento`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`),
  INDEX `fk_Pagamento_Pedido1_idx` (`Pedido_idPedido` ASC, `Pedido_Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamento_Pedido1`
    FOREIGN KEY (`Pedido_idPedido` , `Pedido_Cliente_idCliente`)
    REFERENCES `e-commerce`.`pedido` (`idPedido` , `Cliente_idCliente`)
);


-- -----------------------------------------------------
-- Tabela `e-commerce`.`produto_tem_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`produto_tem_estoque` (
  `Produto_idProduto` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  `Quantidade` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Estoque_idEstoque`),
  INDEX `fk_Produto_has_Estoque_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
  INDEX `fk_Produto_has_Estoque_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `e-commerce`.`estoque` (`idEstoque`),
  CONSTRAINT `fk_Produto_has_Estoque_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `e-commerce`.`produto` (`idProduto`)
);


-- -----------------------------------------------------
-- Tabela `e-commerce`.`terceiro - vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`terceiro - vendedor` (
  `idTerceiro - Vendedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL DEFAULT NULL,
  `Local` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idTerceiro - Vendedor`)
);


-- -----------------------------------------------------
-- Tabela `e-commerce`.`produtos por vendedor (terceiro)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`produtos por vendedor (terceiro)` (
  `Terceiro - Vendedor_idTerceiro - Vendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`, `Produto_idProduto`),
  INDEX `fk_Terceiro_Vendedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Terceiro_Vendedor_has_Produto_Terceiro_Vendedor1_idx` (`Terceiro - Vendedor_idTerceiro - Vendedor` ASC) VISIBLE,
  CONSTRAINT `fk_Terceiro_Vendedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `e-commerce`.`produto` (`idProduto`),
  CONSTRAINT `fk_Terceiro_Vendedor_has_Produto_Terceiro_Vendedor1`
    FOREIGN KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`)
    REFERENCES `e-commerce`.`terceiro - vendedor` (`idTerceiro - Vendedor`)
);


-- -----------------------------------------------------
-- Tabela `e-commerce`.`relação de produto/pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`relação de produto/pedido` (
  `Produto_idProduto` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Quantidade` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `e-commerce`.`pedido` (`idPedido`),
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `e-commerce`.`produto` (`idProduto`)
);
