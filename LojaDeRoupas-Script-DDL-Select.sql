select * from funcionario; 

select idFuncionarios 'Identificador', nome 'Nome', telefone 'Contato', cargo
	from funcionario;
  
  
 -- Mostrando a quantidade total de vendas feita pelos funcionários e exibindo as que estão com status de Entregue
 
SELECT f.idFuncionarios, f.Nome,  SUM(iv.quantidade) AS total_itens_vendidos,  v.dataVenda, v.statusEntrega FROM Funcionario f 
JOIN Venda v ON f.idFuncionarios = v.idFuncionario
JOIN itemVenda iv ON v.idVendas = iv.idVendas
where v.statusEntrega = 'Entregue'
GROUP BY f.idFuncionarios, f.nome, v.idVendas, v.dataVenda, v.statusEntrega
ORDER BY total_itens_vendidos desc;


-- Quantos pedidos estão em Pendência ordenado pelo funcionario que tem mais vendas com status "pendente"

SELECT f.idFuncionarios, f.Nome,  max(iv.quantidade) AS total_itens_vendidos,  v.dataVenda, v.statusEntrega FROM Funcionario f 
JOIN Venda v ON f.idFuncionarios = v.idFuncionario
JOIN itemVenda iv ON v.idVendas = iv.idVendas
where v.statusEntrega = 'Pendente'
GROUP BY f.idFuncionarios, f.nome, v.idVendas, v.dataVenda, v.statusEntrega
ORDER BY total_itens_vendidos desc;

select c.nomeCategoria as 'Categoria', count(p.idProduto) as 'Total de Produtos' from Categoria c
left join Produtos p on c.idCategorias = p.idCategoria
group by c.idCategorias, c.nomeCategoria
order by count(p.idProduto) desc;

-- Soma de vendas por funcionário e o número total de vendas entregues

SELECT f.nome AS nome_funcionario, COUNT(DISTINCT v.idVendas) AS total_vendas_entregues, SUM(iv.quantidade) AS total_itens_vendidos_entregues FROM LojaDeRoupas.Funcionario f
JOIN LojaDeRoupas.Venda v ON f.idFuncionarios = v.idFuncionario
JOIN LojaDeRoupas.itemVenda iv ON v.idVendas = iv.idVendas
WHERE  v.statusEntrega = 'Entregue'
GROUP BY
    f.idFuncionarios, f.nome
ORDER BY
    total_vendas_entregues DESC;

-- Quantos produtos tem a cor preta/preto

select  nomeProduto, cor, categoria.descricao from produtos
join categoria on idProduto = idCategorias
where cor like 'Pret%'
;

-- Seleciona os produtos que custam mais de 59.90 reais da cor Preta

select nomeProduto 'Nome', preco 'Preço', cor 'Cor' from produtos
join categoria on idProduto = idCategorias
where preco >= 59.90 and cor like 'pret%';


-- Quantos produtos existem em cada categoria

select c.nomeCategoria as 'Categoria', count(p.idProduto) as 'Total de Produtos' from Categoria c
left join Produtos p ON c.idCategorias = p.idCategoria
group by c.idCategorias, c.nomeCategoria
order by count(p.idProduto) desc
;

-- Quantos produtos pertencem a categoria Casual

select  p.nomeProduto as 'Produto', c.nomeCategoria as 'Categoria' from Produtos p
join categoria c on p.idCategoria = c.idCategorias
where p.idCategoria = 1
;



-- Quantos produtos são de uma determinada marca

select m.nome as 'Marca', count(p.idProduto) as 'Total de Produtos' from marca m
join produtos p on m.idMarca = p.idMarcas
group by m.idMarca, m.nome
order by count(p.idProduto) desc
;

-- Quais são as marcas com mais produtos
select m.nome as 'Marca', count(p.idProduto) as 'Total de Produtos' from Marca m
join Produtos p on m.idMarca = p.idMarcas
group by m.idMarca, m.nome
order by count(p.idProduto)desc
;
    
    -- Quantidade de estoque de um produto específico
    
select est.quantidade 'Quantidade em Estoque', p.nomeProduto as 'Nome do Produto' from estoque est
join produtos p on est.idEstoque = p.idProduto
where p.nomeProduto = 'Blazer Masculino'
group by est.quantidade, p.nomeProduto
;    

-- Quais produtos têm estoque abaixo de um certo nível?

SELECT p.nomeProduto as 'Produto', e.quantidade as 'Quantidade em Estoque' from Produtos p
JOIN Estoque e on p.idProduto = e.idProduto
where e.quantidade < 15
order by e.quantidade ;


-- Quais produtos estão em alguma promoção

SELECT p.nomeProduto as 'Produto', pr.nome as 'Nome da Promoção', pr.descontoPercentual as 'Desconto (%)', pr.dataInicio as 'Inicio da Promoção', pr.dataFim as 'Fim da Promoção' 
from Produtos p 
join promocaoproduto pp on p.idProduto = pp.idProduto
join promocao pr on pp.idPromocao = pr.idPromocao;

-- Quais produtos em promoção têm um desconto acima de 15%?

select p.nomeProduto as 'Produto', pr.nome as 'Nome da Promoção', pr.descontoPercentual as 'Desconto (%)' 
from Produtos p 
join promocaoproduto pp on p.idProduto = pp.idProduto
join promocao pr on pp.idPromocao = pr.idPromocao
where pr.descontoPercentual >= 15.00
;

-- Qual cliente realizou o maior número de compras

select c.idCliente, c.nomeCliente as 'Nome do Cliente', count(v.idVendas) as 'Total de Compras' from cliente c 
left join venda v on c.idCliente = v.idCliente
group by c.idCliente, c.nomeCliente
order by count(v.idVendas) desc
;

-- Qual funcionário realizou o maior número de vendas

select f.idFuncionarios, f.nome as 'Nome do Funcionário', count(v.idVendas) as 'Total de Vendas' from funcionario f 
inner join venda v on idFuncionarios = idFuncionario
group by f.idFuncionarios, f.nome
order by count(v.idVendas) desc
LIMIT 1;

-- Quais formas de pagamento foram usadas em determinadas vendas

select fp.tipo as 'Tipo de Pagamento', fp.parcela as 'Parcelamento', fp.valorPago as 'Valor Pago', v.idVendas as 'ID da Venda', v.dataVenda as 'Data da Venda' from formapag fp
join venda v on fp.idVendas = v.idVendas
where v.idVendas = 1
;

-- Qual forma de pagamento mais utilizado

select fp.tipo as 'Tipo de Pagamento', count(v.idVendas) as 'Número de Vendas' from formapag fp
join venda v on fp.idVendas = v.idVendas
group by fp.tipo
order by count(v.idVendas) desc
limit 1
;

-- Quais fornecedores fornecem um determinado produto?

select f.cnpj as 'CNPJ do Fornecedor', f.nomeFornecedor as 'Nome do Fornecedor', p.nomeProduto as 'Nome do Produto' from produtofornecedor pf
join fornecedor f on pf.CNPJ = f.cnpj
join produtos p on pf.idProduto = p.idProduto
where p.idProduto = 1
;
-- Qual o valor total gasto por um determinado cliente?

SELECT c.idCliente, c.nomeCliente as 'Nome do Cliente', sum(iv.quantidade * iv.precoUnitario) as 'Total Gasto' from Cliente c
join venda v on c.idCliente = v.idCliente
join itemvenda iv on v.idVendas = iv.idVendas
where c.idCliente = 1
group by c.idCliente, c.nomeCliente
;


CREATE VIEW FuncionariosDetalhados as 
select idFuncionarios AS 'Identificador', nome as 'Nome', telefone as 'Contato',  cargo
from funcionario;

drop view if exists VendasEntreguesPorFuncionario;
CREATE VIEW VendasEntreguesPorFuncionario as 
select f.idFuncionarios, f.nome, coalesce(sum(iv.quantidade), 0)  as total_itens_vendidos, v.dataVenda, v.statusEntrega 
from funcionario f
join venda v on f.idFuncionarios = v.idFuncionario
join itemVenda iv on v.idVendas = iv.idVendas
where v.statusEntrega = 'Entregue'
group by f.idFuncionarios, f.nome, v.dataVenda, v.statusEntrega;


CREATE VIEW VendasPendentesPorFuncionario as 
select f.idFuncionarios as id_funcionario, f.Nome as nome, coalesce(max(iv.quantidade), 0) as total_itens_vendidos, count(distinct  v.dataVenda) as total_vendas_pendentes
from funcionario f
left join venda v on f.idFuncionarios = v.idFuncionario and v.statusEntrega = 'Pendente'
left join itemvenda iv on v.idVendas = iv.idVendas
group by f.idFuncionarios, f.nome, v.idVendas, v.dataVenda, v.statusEntrega;


CREATE VIEW ContagemProdutosPorCategoria as
select c.idCategorias as id_categoria, c.nomeCategoria as 'Categoria', count(p.idProduto) as 'Total de Produtos'
from categoria c 
left join produtos p on c.idCategorias = p.idCategoria
group by c.idCategorias, c.nomeCategoria;


CREATE VIEW ProdutosPretosMaisCaros as 
select p.idProduto as id_produto, nomeProduto as 'Nome', preco as 'Preço', cor as 'Cor'
from produtos p
where preco >= 59.90 and lower(p.cor) like 'pret%';


CREATE VIEW ProdutosPorCategoriaCasual as 
select  p.idProduto as id_produto, p.nomeProduto as 'Produto', c.nomeCategoria as 'Categorias', c.idCategorias as id_categoria
from produtos p
join categoria c on p.idCategoria = c.idCategorias
where p.idCategoria = 1;


CREATE VIEW ContagemProdutosPorMarca as 
select m.idMarca as id_marca, m.nome as 'Marca', count(p.idProduto) as 'Total de Produtos'
from marca m
left join produtos p on m.idMarca = p.idMarcas
group by m.idMarca, m.nome;


CREATE VIEW ProdutosComEstoqueBaixo as 
select p.idProduto as id_produto, p.nomeProduto as 'Produto', e.quantidade as 'Quantidade em Estoque'
from produtos p 
join estoque e on p.idProduto = e.idProduto
where e.quantidade < 15;


CREATE VIEW ProdutosEmPromocaoComDescontoElevado as 
select p.idProduto as id_produto, p.nomeProduto as 'Produto', pr.idPromocao as id_promocao, pr.nome as 'Nome da Promoção', pr.descontoPercentual as 'Desconto (%)'
from produtos p 
join promocaoproduto pp on p.idProduto = pp.idProduto
join promocao pr on pp.idPromocao = pr.idPromocao
where pr.descontoPercentual >= 15.00;


CREATE VIEW ClienteComMaiorGasto as 
select c.idCliente as id_cliente, c.nomeCliente as 'Nome do Cliente', coalesce(sum(iv.quantidade * iv.precoUnitario), 0)  as 'Total Gasto'  
from cliente c
left join venda v on c.idCliente = v.idVendas
left join itemvenda iv on v.idVendas = iv.idVendas
group by c.idCliente, c.nomeCliente;