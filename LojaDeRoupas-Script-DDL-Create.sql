-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LojaDeRoupas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LojaDeRoupas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LojaDeRoupas` DEFAULT CHARACTER SET utf8 ;
USE `LojaDecategoriaRoupas` ;

-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`Categoria` (
  `idCategorias` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  `nomeCategoria` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`idCategorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`Marca` (
  `idMarca` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(75) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idMarca`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`Produtos` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `tamanho` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `idCategoria` INT NOT NULL,
  `idMarcas` INT NOT NULL,
  PRIMARY KEY (`idProduto`, `idCategoria`, `idMarcas`),
  INDEX `fk_Produtos_Categorias1_idx` (`idCategoria` ASC) VISIBLE,
  INDEX `fk_Produtos_Marca1_idx` (`idMarcas` ASC) VISIBLE,
  CONSTRAINT `fk_Produtos_Categorias1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `LojaDeRoupas`.`Categoria` (`idCategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produtos_Marca1`
    FOREIGN KEY (`idMarcas`)
    REFERENCES `LojaDeRoupas`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT UNSIGNED NOT NULL,
  `dataEntrada` DATE NOT NULL,
  `dataSaida` DATE NULL,
  `idProduto` INT NOT NULL,
  PRIMARY KEY (`idEstoque`, `idProduto`),
  INDEX `fk_Estoque_Produtos1_idx` (`idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Estoque_Produtos1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `LojaDeRoupas`.`Produtos` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`Fornecedor` (
  `CNPJ` INT NOT NULL,
  `nomeFornecedor` VARCHAR(100) NOT NULL,
  `telefoneFornecedor` VARCHAR(15) NULL,
  `emailFornecedor` VARCHAR(100) NULL,
  PRIMARY KEY (`CNPJ`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`Funcionario` (
  `idFuncionarios` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15) NULL,
  `cargo` VARCHAR(65) NOT NULL,
  `nome` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`idFuncionarios`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(75) NOT NULL,
  `enderecoCliente` VARCHAR(255) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15) NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`Venda` (
  `idVendas` INT NOT NULL AUTO_INCREMENT,
  `dataVenda` DATE NOT NULL,
  `statusEntrega` VARCHAR(45) NOT NULL,
  `idFuncionario` INT NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idVendas`, `idFuncionario`, `idCliente`),
  INDEX `fk_Vendas_Funcionários1_idx` (`idFuncionario` ASC) VISIBLE,
  INDEX `fk_Vendas_Clientes1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Vendas_Funcionários1`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `LojaDeRoupas`.`Funcionario` (`idFuncionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendas_Clientes1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `LojaDeRoupas`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`itemVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`itemVenda` (
  `iditemVenda` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT UNSIGNED NOT NULL,
  `precoUnitario` DECIMAL(10,2) UNSIGNED NOT NULL,
  `desconto` DECIMAL(10,2) UNSIGNED NOT NULL,
  `idProduto` INT NOT NULL,
  `idVendas` INT NOT NULL,
  PRIMARY KEY (`iditemVenda`, `idProduto`, `idVendas`),
  INDEX `fk_itemVenda_Produtos1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_itemVenda_Venda1_idx` (`idVendas` ASC) VISIBLE,
  CONSTRAINT `fk_itemVenda_Produtos1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `LojaDeRoupas`.`Produtos` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemVenda_Venda1`
    FOREIGN KEY (`idVendas`)
    REFERENCES `LojaDeRoupas`.`Venda` (`idVendas`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`Promocao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`Promocao` (
  `idPromocao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NOT NULL,
  `descontoPercentual` DECIMAL(5,2) UNSIGNED NOT NULL,
  `iditemVenda` INT NOT NULL,
  PRIMARY KEY (`idPromocao`, `iditemVenda`),
  INDEX `fk_Promocao_itemVenda1_idx` (`iditemVenda` ASC) VISIBLE,
  CONSTRAINT `fk_Promocao_itemVenda1`
    FOREIGN KEY (`iditemVenda`)
    REFERENCES `LojaDeRoupas`.`itemVenda` (`iditemVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`ForrmaPag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`ForrmaPag` (
  `idForrmaPag` INT NOT NULL AUTO_INCREMENT,
  `parcela` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `valorPago` DECIMAL(10,2) UNSIGNED NOT NULL,
  `idVendas` INT NOT NULL,
  PRIMARY KEY (`idForrmaPag`, `idVendas`),
  INDEX `fk_ForrmaPag_Vendas1_idx` (`idVendas` ASC) VISIBLE,
  CONSTRAINT `fk_ForrmaPag_Vendas1`
    FOREIGN KEY (`idVendas`)
    REFERENCES `LojaDeRoupas`.`Venda` (`idVendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`ProdutoFornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`ProdutoFornecedor` (
  `idProduto` INT NOT NULL,
  `CNPJ` INT NOT NULL,
  PRIMARY KEY (`idProduto`, `CNPJ`),
  INDEX `fk_Produtos_has_Fornecedores_Produtos1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_Produtos_tem_Fornecedore_Fornecedor1_idx` (`CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_Produtos_has_Fornecedores_Produtos1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `LojaDeRoupas`.`Produtos` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produtos_tem_Fornecedore_Fornecedor1`
    FOREIGN KEY (`CNPJ`)
    REFERENCES `LojaDeRoupas`.`Fornecedor` (`CNPJ`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaDeRoupas`.`PromocaoProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojaDeRoupas`.`PromocaoProduto` (
  `idPromocao` INT NOT NULL,
  `idProduto` INT NOT NULL,
  PRIMARY KEY (`idPromocao`, `idProduto`),
  INDEX `fk_Promocao_has_Produtos_Produtos1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_Promocao_has_Produtos_Promocao1_idx` (`idPromocao` ASC) VISIBLE,
  CONSTRAINT `fk_Promocao_has_Produtos_Promocao1`
    FOREIGN KEY (`idPromocao`)
    REFERENCES `LojaDeRoupas`.`Promocao` (`idPromocao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Promocao_has_Produtos_Produtos1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `LojaDeRoupas`.`Produtos` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
