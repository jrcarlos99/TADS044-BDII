
-- Trigger 1: Valor Mínimo em Produto

DELIMITER $$
CREATE TRIGGER before_insert_produto_valor_minimo
BEFORE INSERT ON produtos
FOR EACH ROW
BEGIN
    IF NEW.preco < 1.00 THEN
        SET NEW.preco = 1.00;
    END IF;
END$$
DELIMITER ;

-- Triger 2: Validação do status da entrega 

DELIMITER $$
CREATE TRIGGER before_insert_venda_definir_status
BEFORE INSERT ON venda
FOR EACH ROW
BEGIN
	IF NEW.statusEntrega is null or trim(NEW.statusEntrega) = '' THEN
    SET NEW.statusEntrega = 'Pendente';
    END IF;
END$$
DELIMITER ;

-- Triger 3: Formatação de E-mail

DELIMITER $$
CREATE TRIGGER before_insert_cliente_formata_email
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
    SET NEW.email = LOWER(TRIM(NEW.email));
END$$
DELIMITER ;

-- Trigger 4: Data de Venda 

DELIMITER $$
CREATE TRIGGER before_insert_venda_data_atual
BEFORE INSERT ON venda
FOR EACH ROW
BEGIN
    IF NEW.dataVenda IS NULL THEN
        SET NEW.dataVenda = CURDATE();
    END IF;
END$$
DELIMITER ;

-- Trigger 5: Registro de Alteração de Preço

CREATE TABLE IF NOT EXISTS log_alteracao_preco (
    idLog INT AUTO_INCREMENT PRIMARY KEY,
    idProduto INT,
    precoAntigo DECIMAL(10,2),
    precoNovo DECIMAL(10,2),
    dataAlteracao DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER after_update_produto_log_preco
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF OLD.preco != NEW.preco THEN
        INSERT INTO log_alteracao_preco (idProduto, precoAntigo, precoNovo)
        VALUES (NEW.idProduto, OLD.preco, NEW.preco);
    END IF;
END$$
DELIMITER ;


-- Trigger 6: Validação de Desconto

DELIMITER $$
CREATE TRIGGER before_insert_itemvenda_verifica_desconto
BEFORE INSERT ON itemvenda
FOR EACH ROW
BEGIN
    IF NEW.desconto > (NEW.precoUnitario * 0.5) THEN
        SET NEW.desconto = NEW.precoUnitario * 0.5;
    END IF;
END$$
DELIMITER ;

