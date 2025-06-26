-- Trigger 1 DE VALOR MÍNIMO DE PRODUTO

INSERT INTO produtos (nomeProduto, preco, descricao, tamanho, cor, idCategoria, idMarcas)
VALUES ('Camiseta Promoção', 0.50, 'Camiseta básica', 'M', 'Branca', 1, 1);

SELECT idProduto, nomeProduto, preco FROM produtos ORDER BY idProduto DESC LIMIT 1;


INSERT INTO produtos (nomeProduto, preco, descricao, tamanho, cor, idCategoria, idMarcas)
VALUES ('Calça Jeans', 150.00, 'Calça jeans masculina', '42', 'Azul', 1, 1);

SELECT idProduto, nomeProduto, preco FROM produtos ORDER BY idProduto DESC LIMIT 1;


-- Trigger 2 Atualização de Estoque

insert into venda (dataVenda, idFuncionario, idCliente)
values (curdate(), 1, 1);


insert into venda (dataVenda, statusEntrega, idFuncionario, idCliente)
values (curdate(), 'entregue', 1, 1);

select idVendas, dataVenda, statusEntrega from venda order by idVendas desc limit 2;


-- Trigger 3 Formatação de Email


INSERT INTO cliente (nomeCliente, enderecoCliente, email, telefone)
VALUES ('Cliente Teste', 'Rua Exemplo, 123', '  TESTE@EMAIL.COM  ', '11999999999');


SELECT idCliente, nomeCliente, email FROM cliente ORDER BY idCliente DESC LIMIT 1;


INSERT INTO cliente (nomeCliente, enderecoCliente, email, telefone)
VALUES ('Cliente Teste 2', 'Rua Exemplo, 456', 'teste2@email.com', '11999999998');


SELECT idCliente, nomeCliente, email FROM cliente ORDER BY idCliente DESC LIMIT 1;


-- Trigger 4 Data da Venda

INSERT INTO venda (idVendas, idFuncionario, idCliente)
VALUES (980, 1, 1) AS new
ON DUPLICATE KEY UPDATE 
    idFuncionario = new.idFuncionario, 
    idCliente = new.idCliente;

SELECT idVendas, dataVenda FROM venda WHERE idVendas = 980;


INSERT INTO venda (idVendas, dataVenda, idFuncionario, idCliente)
VALUES (997, '2023-12-25', 1, 1) AS new
ON DUPLICATE KEY UPDATE 
    dataVenda = new.dataVenda,
    idFuncionario = new.idFuncionario,
    idCliente = new.idCliente;


SELECT idVendas, dataVenda FROM venda WHERE idVendas = 997;

-- Trigger 5 Registro de Alteração de Preço


INSERT INTO produtos (idProduto, nomeProduto, preco, descricao, tamanho, cor, idCategoria, idMarcas)
VALUES (998, 'Produto Teste Preço', 100.00, 'Produto para teste de preço', 'U', 'Verde', 1, 1);

SELECT * FROM log_alteracao_preco WHERE idProduto = 998;


UPDATE produtos SET preco = 120.00 WHERE idProduto = 998;


SELECT * FROM log_alteracao_preco WHERE idProduto = 998;


-- Trigger 6 Verificação de Desconto

INSERT INTO venda (idVendas, dataVenda, idFuncionario, idCliente) 
VALUES (993, CURDATE(), 1, 1) AS new_venda
ON DUPLICATE KEY UPDATE 
    dataVenda = new_venda.dataVenda,
    idFuncionario = new_venda.idFuncionario,
    idCliente = new_venda.idCliente;

INSERT INTO itemvenda (iditemVenda, quantidade, precoUnitario, desconto, idProduto, idVendas)
VALUES (993, 1, 100.00, 60.00, 1, 996);

SELECT iditemVenda, precoUnitario, desconto FROM itemvenda WHERE iditemVenda = 993;

INSERT INTO itemvenda (iditemVenda, quantidade, precoUnitario, desconto, idProduto, idVendas)
VALUES (991, 1, 100.00, 30.00, 1, 996);


SELECT iditemVenda, precoUnitario, desconto FROM itemvenda WHERE iditemVenda = 991;



