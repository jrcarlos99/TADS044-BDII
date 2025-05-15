-- Atualiza o nome de uma categoria
UPDATE Categoria SET nomeCategoria = 'Roupas Formais' WHERE idCategorias = 3;

-- Muda a descrição de uma marca
UPDATE Marca SET descricao = 'Estilo esportivo e streetwear' WHERE idMarca = 10;

-- Atualiza o preço de um produto
UPDATE Produtos SET preco = 65.90 WHERE idProduto = 1;

-- Altera o estoque de um produto
UPDATE Estoque SET quantidade = 45 WHERE idProduto = 1;

-- Atualiza o status de uma venda
UPDATE Venda SET statusEntrega = 'Entregue' WHERE idVendas = 3;

-- Corrige o e-mail de um cliente
UPDATE Cliente SET email = 'mariana.lima@novoemail.com' WHERE idCliente = 2;

-- Troca o cargo de um funcionário
UPDATE Funcionario SET cargo = 'Supervisor' WHERE idFuncionarios = 3;

-- Atualiza o desconto em um item de venda
UPDATE itemVenda SET desconto = 20.00 WHERE iditemVenda = 3;

-- Altera o valor pago em uma venda
UPDATE FormaPag SET valorPago = 210.00 WHERE idVendas = 6;

-- Atualiza a data final de uma promoção
UPDATE Promocao SET dataFim = '2025-01-25' WHERE idPromocao = 1;

-- Remove cliente associado à venda excluída
DELETE FROM Cliente WHERE idCliente = 15;

-- Deleta uma promoção (relacionamento já foi removido)
DELETE FROM Promocao WHERE idPromocao = 15;

-- Deleta um item de venda
DELETE FROM itemVenda WHERE iditemVenda = 15;

-- Remove a venda
DELETE FROM Venda WHERE idVendas = 15;

-- Remove produto do estoque
DELETE FROM Estoque WHERE idProduto = 15;

-- Remove produto do relacionamento com fornecedor
DELETE FROM ProdutoFornecedor WHERE idProduto = 15;

-- Remove o produto
DELETE FROM Produtos WHERE idProduto = 15;

-- Remove uma forma de pagamento
DELETE FROM FormaPag WHERE idVendas = 15;

-- Deleta um relacionamento de promoção com produto
DELETE FROM PromocaoProduto WHERE idPromocao = 15 AND idProduto = 15;

-- Remove funcionário associado à venda excluída
DELETE FROM Funcionario WHERE idFuncionarios = 15;
