SHOW FUNCTION STATUS WHERE Db = 'lojaderoupas';

-- função 1
DELIMITER $$
CREATE FUNCTION fn_total_gasto_cliente(p_idCliente INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE v_total DECIMAL(12,2);

  SELECT IFNULL(SUM(iv.quantidade * iv.precoUnitario - iv.desconto), 0)
  INTO v_total
  FROM itemVenda iv
  JOIN Venda v ON iv.idVendas = v.idVendas
  WHERE v.idCliente = p_idCliente;

  RETURN v_total;
END $$
DELIMITER ;

-- Função 2

DELIMITER $$
CREATE FUNCTION fn_qtd_produtos_promocao_ativas()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE v_count INT;

  SELECT COUNT(DISTINCT pp.idProduto)
  INTO v_count
  FROM PromocaoProduto pp
  JOIN Promocao pr ON pp.idPromocao = pr.idPromocao
  WHERE CURDATE() <= pr.dataFim;

  RETURN IFNULL(v_count, 0);
END $$
DELIMITER ;


-- função 3

DELIMITER $$
CREATE FUNCTION fn_total_itens_ultimas_7_vendas_funcionario(p_idFuncionario INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE v_soma INT;

  SELECT IFNULL(SUM(iv.quantidade), 0)
  INTO v_soma
  FROM (
    SELECT v.idVendas
    FROM Venda v
    WHERE v.idFuncionario = p_idFuncionario
    ORDER BY v.dataVenda DESC, v.idVendas DESC
    LIMIT 7
  ) AS ultimas_vendas
  JOIN itemVenda iv ON iv.idVendas = ultimas_vendas.idVendas;

  RETURN v_soma;
END $$
DELIMITER ;


-- função 4
DELIMITER $$
CREATE FUNCTION fn_estoque_produto(p_idProduto INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE v_quant INT;

  SELECT e.quantidade INTO v_quant
  FROM Estoque e
  WHERE e.idProduto = p_idProduto
  ORDER BY e.dataEntrada DESC, e.idEstoque DESC
  LIMIT 1;

  RETURN IFNULL(v_quant, 0);
END $$
DELIMITER ;

-- função 5
DELIMITER $$
CREATE FUNCTION fn_total_vendas_status(p_status VARCHAR(45))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE v_total INT;

  SELECT COUNT(*) INTO v_total
  FROM Venda
  WHERE statusEntrega = p_status;

  RETURN v_total;
END $$
DELIMITER ;

-- função 6
DELIMITER $$
CREATE FUNCTION fn_categoria_com_mais_produtos()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE v_id INT;

  SELECT p.idCategoria
  INTO v_id
  FROM Produtos p
  GROUP BY p.idCategoria
  ORDER BY COUNT(*) DESC
  LIMIT 1;

  RETURN v_id;
END $$
DELIMITER ;




