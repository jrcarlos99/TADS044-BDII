-- Teste 1: 
SELECT 
  c.idCliente,
  c.nomeCliente AS 'Nome',
  fn_total_gasto_cliente(c.idCliente) AS totalGasto
FROM Cliente c
WHERE c.idCliente = 2;

-- Teste 2:
SELECT fn_qtd_produtos_promocao_ativas() AS produtosEmPromocaoAtiva;

-- Teste 3
SELECT 
  f.idFuncionarios,
  f.nome AS nomeFuncionario,
  fn_total_itens_ultimas_7_vendas_funcionario(f.idFuncionarios) AS 'Itens Vendidos nas Ultimas 7 Vendas'
FROM funcionario f
WHERE f.idFuncionarios = 1;

-- Teste 4: 
SELECT 
  p.idProduto,
  p.nomeProduto AS 'Nome do Produto',
  fn_estoque_produto(p.idProduto) AS 'Estoque Atual'
FROM Produtos p
WHERE p.idProduto = 5;

-- Teste 5:
SELECT 
  'Pendente' AS statusConsultado,
  fn_total_vendas_status('Pendente') AS 'Total de Vendas com esse status';

-- Teste 6:
SELECT 
  c.idCategorias,
  c.nomeCategoria AS 'Nome da Categoria'
FROM categoria c
WHERE c.idCategorias = fn_categoria_com_mais_produtos();
