-- teste 1
CALL sp_ResumoFuncionario(2);

-- teste 2
CALL sp_CadastrarProduto(
    'Camiseta Azul',
    79.90,
    'Camiseta básica de algodão',
    'M',
    'Azul',
    2,
    3,
    50
);

-- teste 3
CALL sp_AtualizarEstoqueProduto(5, 120);

-- teste 4
CALL sp_RemoverVendaCompleta(10);

-- teste 5 
CALL sp_BuscarProdutosPorCategoria('Infantil');

-- teste 6 
CALL sp_ResumoPromocoesProduto(3);



