-- procedure 1 
DELIMITER $$
CREATE PROCEDURE sp_ResumoFuncionario(IN funcionarioId INT)
BEGIN
    SELECT * FROM Funcionario WHERE idFuncionarios = funcionarioId;
    
    SELECT COUNT(*) AS total_vendas 
    FROM Venda 
    WHERE idFuncionario = funcionarioId;
    
    SELECT SUM(iv.quantidade) AS total_itens 
    FROM Venda v
    JOIN itemVenda iv ON v.idVendas = iv.idVendas
    WHERE v.idFuncionario = funcionarioId;
    
    SELECT cargo 
    FROM Funcionario 
    WHERE idFuncionarios = funcionarioId;
END $$
DELIMITER ;

-- procedure 2
DELIMITER $$
CREATE PROCEDURE sp_CadastrarProduto(
    IN nome VARCHAR(45),
    IN preco DECIMAL(10,2),
    IN descricao VARCHAR(45),
    IN tamanho VARCHAR(45),
    IN cor VARCHAR(45),
    IN idCategoria INT,
    IN idMarca INT,
    IN quantidadeEstoque INT
)
BEGIN
    INSERT INTO Produtos (nomeProduto, preco, descricao, tamanho, cor, idCategoria, idMarcas)
    VALUES (nome, preco, descricao, tamanho, cor, idCategoria, idMarca);

    SET @idNovoProduto = LAST_INSERT_ID();

    INSERT INTO Estoque (quantidade, dataEntrada, idProduto)
    VALUES (quantidadeEstoque, CURDATE(), @idNovoProduto);

    SELECT * FROM Produtos WHERE idProduto = @idNovoProduto;
    
    SELECT * FROM Estoque WHERE idProduto = @idNovoProduto;
END $$
DELIMITER ;

-- procedure 3
DELIMITER $$
CREATE PROCEDURE sp_AtualizarEstoqueProduto(
    IN produtoId INT,
    IN novaQuantidade INT
)
BEGIN
    UPDATE Estoque 
    SET quantidade = novaQuantidade, dataEntrada = CURDATE() 
    WHERE idProduto = produtoId;

    SELECT * FROM Estoque WHERE idProduto = produtoId;

    SELECT nomeProduto, preco 
    FROM Produtos 
    WHERE idProduto = produtoId;

    SELECT descricao 
    FROM Produtos 
    WHERE idProduto = produtoId;
END $$
DELIMITER ;

-- procedure 4
DELIMITER $$
CREATE PROCEDURE sp_RemoverVendaCompleta(IN vendaId INT)
BEGIN
    DELETE FROM Promocao WHERE iditemVenda IN (
        SELECT iditemVenda FROM itemVenda WHERE idVendas = vendaId
    );

    DELETE FROM itemVenda WHERE idVendas = vendaId;

    DELETE FROM FormaPag WHERE idVendas = vendaId;

    DELETE FROM Venda WHERE idVendas = vendaId;

    SELECT 'Venda e dependências removidas com sucesso' AS status;
END $$
DELIMITER ;



-- procedure 5
DELIMITER $$
CREATE PROCEDURE sp_BuscarProdutosPorCategoria(IN nomeCat VARCHAR(75))
BEGIN
    SELECT p.idProduto, p.nomeProduto, p.preco, p.cor, c.nomeCategoria
    FROM Produtos p
    JOIN Categoria c ON p.idCategoria = c.idCategorias
    WHERE c.nomeCategoria = nomeCat;

    SELECT COUNT(*) AS total_produtos 
    FROM Produtos p
    JOIN Categoria c ON p.idCategoria = c.idCategorias
    WHERE c.nomeCategoria = nomeCat;

    SELECT DISTINCT m.nome AS marca 
    FROM Produtos p
    JOIN Marca m ON p.idMarcas = m.idMarca
    JOIN Categoria c ON p.idCategoria = c.idCategorias
    WHERE c.nomeCategoria = nomeCat;

    SELECT descricao 
    FROM Categoria 
    WHERE nomeCategoria = nomeCat;
END $$
DELIMITER ;

-- procedure 6
DELIMITER $$
CREATE PROCEDURE sp_ResumoPromocoesProduto(IN produtoId INT)
BEGIN
    SELECT pr.nome, pr.descricao, pr.dataInicio, pr.dataFim, pr.descontoPercentual
    FROM Promocao pr
    JOIN itemVenda iv ON pr.iditemVenda = iv.iditemVenda
    WHERE iv.idProduto = produtoId;

    SELECT COUNT(*) AS total_promocoes 
    FROM Promocao pr
    JOIN itemVenda iv ON pr.iditemVenda = iv.iditemVenda
    WHERE iv.idProduto = produtoId;

    SELECT nomeProduto, preco 
    FROM Produtos 
    WHERE idProduto = produtoId;

    SELECT dataEntrada, quantidade 
    FROM Estoque 
    WHERE idProduto = produtoId;
END $$
DELIMITER ;
