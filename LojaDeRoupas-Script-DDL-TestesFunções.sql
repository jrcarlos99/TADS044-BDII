-- teste 1
SELECT fn_total_gasto_cliente(1) AS totalGastoCliente1;

-- teste 2
SELECT fn_qtd_produtos_promocao_atual() AS produtosEmPromocaoHoje;

-- teste 3
SELECT fn_ultimas_vendas_funcionario(3, 7) AS itensVendidosUltimos7Dias;

-- teste 4
SELECT fn_estoque_produto(5) AS estoqueProduto5;

-- teste 5
SELECT fn_total_vendas_status('Pendente') AS totalVendasPendentes;

-- teste 6
SELECT fn_categoria_com_mais_produtos() AS categoriaMaisProdutos;

