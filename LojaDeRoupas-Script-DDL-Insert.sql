INSERT INTO Categoria (descricao, nomeCategoria) VALUES
('Roupas confortáveis e simples', 'Casual'),
('Roupas para esportes', 'Esportiva'),
('Moda formal', 'Social'),
('Roupas infantis', 'Infantil'),
('Roupas masculinas', 'Masculina'),
('Roupas femininas', 'Feminina'),
('Acessórios de moda', 'Acessórios'),
('Calçados casuais', 'Calçados'),
('Moda praia', 'Praia'),
('Moda inverno', 'Inverno'),
('Moda verão', 'Verão'),
('Moda sustentável', 'Eco-friendly'),
('Roupas íntimas', 'Lingerie'),
('Roupas fitness', 'Fitness'),
('Uniformes profissionais', 'Uniforme');


INSERT INTO Marca (nome, descricao) VALUES
('Nike', 'Esporte e performance'),
('Adidas', 'Moda esportiva'),
('Zara', 'Moda contemporânea'),
('Hering', 'Casual brasileira'),
('Riachuelo', 'Popular e acessível'),
('C&A', 'Varejo de moda global'),
('Reserva', 'Estilo casual masculino'),
('Lupo', 'Roupas íntimas e meias'),
('Malwee', 'Sustentabilidade e conforto'),
('Puma', 'Estilo esportivo'),
('Tommy Hilfiger', 'Clássico americano'),
('Colcci', 'Moda jovem'),
('Renner', 'Varejo nacional'),
('Calvin Klein', 'Moda internacional'),
('Gucci', 'Alta costura italiana');

INSERT INTO Fornecedor (CNPJ, nomeFornecedor, telefoneFornecedor, emailFornecedor) VALUES
(1000000101, 'Distribuidora Nike', '(81)99999-9901', 'nike@fornecedor.com'),
(1000000102, 'Distribuidora Adidas', '(81)99999-9902', 'adidas@fornecedor.com'),
(1000000103, 'FastFashion Zara', '(81)99999-9903', 'zara@fornecedor.com'),
(1000000104, 'Hering Logística', '(81)99999-9904', 'hering@fornecedor.com'),
(1000000105, 'Distrib. Riachuelo', '(81)99999-9905', 'riachuelo@fornecedor.com'),
(1000000106, 'C&A Supply', '(81)99999-9906', 'cea@fornecedor.com'),
(1000000107, 'Reserva Distribuidora', '(81)99999-9907', 'reserva@fornecedor.com'),
(1000000108, 'Lupo Representações', '(81)99999-9908', 'lupo@fornecedor.com'),
(1000000109, 'Malwee Varejo', '(81)99999-9909', 'malwee@fornecedor.com'),
(1000000110, 'Puma Fornecimentos', '(81)99999-9910', 'puma@fornecedor.com'),
(1000000111, 'Hilfiger Fashion', '(81)99999-9911', 'tommy@fornecedor.com'),
(1000000112, 'Colcci Repasses', '(81)99999-9912', 'colcci@fornecedor.com'),
(1000000113, 'Renner Distribuidora', '(81)99999-9913', 'renner@fornecedor.com'),
(1000000114, 'Calvin Klein BR', '(81)99999-9914', 'ck@fornecedor.com'),
(1000000115, 'Gucci Brasil', '(81)99999-9915', 'gucci@fornecedor.com');


INSERT INTO Funcionario (email, telefone, cargo, nome) VALUES
('amanda.cruz@loja.com', '(81)98000-0001', 'Vendedor(a)', 'Amanda Cruz'),
('joao.carlos@loja.com', '(81)98000-0002', 'Gerente', 'João Carlo'),
('day.santos@loja.com', '(81)98000-0003', 'Caixa', 'Dayanne Santos'),
('carlos.silva@loja.com', '(81)98000-0004', 'Estoquista', 'Carlos Silva'),
('patricia.rocha@loja.com', '(81)98000-0005', 'RH', 'Patrícia Rocha'),
('lucas.oliveira@loja.com', '(81)98000-0006', 'Vendedor(a)', 'Lucas Oliveira'),
('aline.pereira@loja.com', '(81)98000-0007', 'Vendedor(a)', 'Aline Pereira'),
('fernando.gomes@loja.com', '(81)98000-0008', 'Segurança', 'Fernando Gomes'),
('juliana.ferreira@loja.com', '(81)98000-0009', 'Marketing', 'Juliana Ferreira'),
('rafael.martins@loja.com', '(81)98000-0010', 'TI', 'Rafael Martins'),
('camila.alves@loja.com', '(81)98000-0011', 'Caixa', 'Camila Alves'),
('eduardo.pinto@loja.com', '(81)98000-0012', 'Vendedor(a)', 'Eduardo Pinto'),
('daniela.ramos@loja.com', '(81)98000-0013', 'Gerente', 'Daniela Ramos'),
('marcos.teixeira@loja.com', '(81)98000-0014', 'Vendedor(a)', 'Marcos Teixeira'),
('paula.medeiros@loja.com', '(81)98000-0015', 'Atendente', 'Paula Medeiros');

INSERT INTO Cliente (nomeCliente, enderecoCliente, email, telefone) VALUES
('Carlos Souza', 'Rua da Aurora, 123', 'carlos@gmail.com', '(81)98888-0001'),
('Mariana Lima', 'Avenida Conde da Boa Vista, 1000', 'mariana@yahoo.com', '(81)98888-0002'),
('João Pedro', 'Rua do Sol, 321', 'joao@outlook.com', '(81)98888-0003'),
('Ana Clara', 'Rua Verde, 45', 'ana@hotmail.com', '(81)98888-0004'),
('Ricardo Lopes', 'Avenida Agamenon Magalhães, 987', 'ricardo@gmail.com', '(81)98888-0005'),
('Fernanda Dias', 'Rua do Bom Jesus, 22', 'fernanda@yahoo.com', '(81)98888-0006'),
('Bruno Almeida', 'Rua da Praia, 56', 'bruno@live.com', '(81)98888-0007'),
('Letícia Moura', 'Rua do Futuro, 800', 'leticia@gmail.com', '(81)98888-0008'),
('Diego Souza', 'Rua Nova, 12', 'diego@icloud.com', '(81)98888-0009'),
('Juliana Torres', 'Avenida Norte Miguel Arraes, 999', 'juliana@gmail.com', '(81)98888-0010'),
('André Silva', 'Rua do Mercado, 654', 'andre@yahoo.com', '(81)98888-0011'),
('Laura Castro', 'Rua Azul, 321', 'laura@gmail.com', '(81)98888-0012'),
('Gabriel Nunes', 'Avenida Recife, 77', 'gabriel@gmail.com', '(81)98888-0013'),
('Clara Rezende', 'Rua Verdejante, 42', 'clara@hotmail.com', '(81)98888-0014'),
('Mateus Rocha', 'Rua da Moda, 11', 'mateus@outlook.com', '(81)98888-0015');

INSERT INTO Produtos (nomeProduto, preco, descricao, tamanho, cor, idCategoria, idMarcas) VALUES
('Camiseta Dry Fit', 59.90, 'Camiseta esportiva', 'M', 'Preta', 2, 1),
('Blusa de Moletom', 120.00, 'Blusa quente e confortável', 'G', 'Cinza', 10, 2),
('Bermuda Jeans', 80.00, 'Bermuda casual masculina', 'G', 'Azul', 1, 3),
('Vestido Floral', 150.00, 'Vestido para verão', 'P', 'Rosa', 11, 4),
('Calça Legging', 90.00, 'Roupas fitness feminina', 'M', 'Preta', 14, 1),
('Blazer Masculino', 220.00, 'Ideal para eventos formais', 'G', 'Azul Marinho', 3, 15),
('Camiseta Básica', 39.90, 'Algodão 100%', 'M', 'Branca', 1, 4),
('Shorts Praia', 60.00, 'Secagem rápida', 'G', 'Azul', 9, 6),
('Jaqueta Corta-Vento', 180.00, 'Resistente ao vento', 'M', 'Vermelha', 10, 2),
('Sandália Feminina', 70.00, 'Confortável e leve', '38', 'Bege', 8, 3),
('Tênis Corrida', 200.00, 'Leve e amortecido', '42', 'Branco', 2, 1),
('Sutiã Renda', 50.00, 'Renda delicada', 'M', 'Preto', 13, 8),
('Macacão Social', 180.00, 'Ocasiões formais', 'G', 'Preto', 3, 9),
('Camisa Polo', 100.00, 'Casual elegante', 'G', 'Azul', 1, 10),
('Calça Jeans Skinny', 130.00, 'Moda jovem', '38', 'Azul Escuro', 5, 3);

INSERT INTO Estoque (quantidade, dataEntrada, dataSaida, idProduto) VALUES
(50, '2025-01-01', NULL, 1),
(30, '2025-01-01', NULL, 2),
(20, '2025-01-02', NULL, 3),
(25, '2025-01-02', NULL, 4),
(15, '2025-01-03', NULL, 5),
(18, '2025-01-03', NULL, 6),
(40, '2025-01-04', NULL, 7),
(35, '2025-01-05', NULL, 8),
(20, '2025-01-06', NULL, 9),
(25, '2025-01-06', NULL, 10),
(30, '2025-01-07', NULL, 11),
(10, '2025-01-07', NULL, 12),
(12, '2025-01-08', NULL, 13),
(22, '2025-01-09', NULL, 14),
(28, '2025-01-10', NULL, 15);

INSERT INTO Venda (dataVenda, statusEntrega, idFuncionario, idCliente) VALUES
('2025-01-10', 'Entregue', 1, 1),
('2025-01-11', 'Entregue', 2, 2),
('2025-01-12', 'Pendente', 3, 3),
('2025-01-13', 'Em transporte', 4, 4),
('2025-01-14', 'Cancelado', 5, 5),
('2025-01-15', 'Entregue', 6, 6),
('2025-01-16', 'Entregue', 7, 7),
('2025-01-17', 'Pendente', 8, 8),
('2025-01-18', 'Entregue', 9, 9),
('2025-01-19', 'Em transporte', 10, 10),
('2025-01-20', 'Entregue', 11, 11),
('2025-01-21', 'Entregue', 12, 12),
('2025-01-22', 'Entregue', 13, 13),
('2025-01-23', 'Pendente', 14, 14),
('2025-01-24', 'Em transporte', 15, 15);

INSERT INTO itemVenda (quantidade, precoUnitario, desconto, idProduto, idVendas) VALUES
(2, 59.90, 0, 1, 1),
(1, 120.00, 10.00, 2, 2),
(3, 80.00, 15.00, 3, 3),
(1, 150.00, 0.00, 4, 4),
(2, 90.00, 10.00, 5, 5),
(1, 220.00, 20.00, 6, 6),
(2, 39.90, 0.00, 7, 7),
(1, 60.00, 5.00, 8, 8),
(1, 180.00, 0.00, 9, 9),
(2, 70.00, 0.00, 10, 10),
(1, 200.00, 10.00, 11, 11),
(1, 50.00, 0.00, 12, 12),
(1, 180.00, 20.00, 13, 13),
(1, 100.00, 0.00, 14, 14),
(1, 130.00, 5.00, 15, 15);

INSERT INTO FormaPag (parcela, tipo, valorPago, idVendas) VALUES
('1x', 'Cartão', 119.80, 1),
('2x', 'Cartão', 110.00, 2),
('1x', 'Pix', 225.00, 3),
('1x', 'Cartão', 150.00, 4),
('1x', 'Dinheiro', 170.00, 5),
('10x', 'Cartão', 200.00, 6),
('1x', 'Cartão', 79.80, 7),
('1x', 'Cartão', 55.00, 8),
('2x', 'Cartão', 180.00, 9),
('3x', 'Cartão', 140.00, 10),
('3x', 'Cartão', 190.00, 11),
('1x', 'Cartão', 50.00, 12),
('2x', 'Cartão', 160.00, 13),
('2x', 'Cartão', 100.00, 14),
('1x', 'Cartão', 125.00, 15);

INSERT INTO ProdutoFornecedor (idProduto, CNPJ) VALUES
(1, 1000000101),
(2, 1000000102),
(3, 1000000103),
(4, 1000000104),
(5, 1000000105),
(6, 1000000106),
(7, 1000000107),
(8, 1000000108),
(9, 1000000109),
(10, 1000000110),
(11, 1000000111),
(12, 1000000112),
(13, 1000000113),
(14, 1000000114),
(15, 1000000115);

INSERT INTO Promocao (nome, descricao, dataInicio, dataFim, descontoPercentual, iditemVenda) VALUES
('Verão 2025', 'Promoção de verão', '2025-01-01', '2025-01-31', 10.00, 1),
('Carnaval', 'Descontos especiais', '2025-02-01', '2025-02-15', 15.00, 2),
('Volta às Aulas', 'Desconto em roupas básicas', '2025-01-10', '2025-01-20', 5.00, 3),
('Semana da Mulher', 'Desconto para produtos femininos', '2025-03-01', '2025-03-08', 20.00, 4),
('Inverno Chegando', 'Casacos e jaquetas', '2025-04-01', '2025-04-30', 25.00, 5),
('Páscoa', 'Promoções de abril', '2025-04-10', '2025-04-20', 10.00, 6),
('Dia das Mães', 'Presentes com desconto', '2025-05-01', '2025-05-10', 15.00, 7),
('Liquida Total', 'Tudo com até 30%', '2025-05-15', '2025-05-31', 30.00, 8),
('Namorados', 'Desconto especial', '2025-06-01', '2025-06-12', 10.00, 9),
('Férias de Julho', 'Moda verão em promoção', '2025-07-01', '2025-07-31', 20.00, 10),
('Volta às Aulas 2', 'Ofertas escolares', '2025-08-01', '2025-08-15', 5.00, 11),
('Primavera', 'Roupas leves com desconto', '2025-09-01', '2025-09-30', 10.00, 12),
('Black Friday', 'Descontos imperdíveis', '2025-11-25', '2025-11-30', 50.00, 13),
('Natal', 'Ofertas natalinas', '2025-12-10', '2025-12-25', 20.00, 14),
('Ano Novo', 'Descontos de virada', '2025-12-26', '2025-12-31', 15.00, 15);

INSERT INTO PromocaoProduto (idPromocao, idProduto) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),

(11, 11), (12, 12), (13, 13), (14, 14), (15, 15);

(11, 11), (12, 12), (13, 13), (14, 14), (15, 15);

