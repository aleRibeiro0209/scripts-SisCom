/*
	PROJETO SisCom_Agência-Carros_MANUTENCAO 
		Alexandre Ribeiro dos Santos
		Letícia Vitória Perez Ramos
		Richard dos Santos Oliveira
*/

-- Selecionando o Banco de Dados que será utilizado --
USE SisCom_AgenciaCarros
GO

-- 1 - Incluir campos na tabela de Produtos que consiga controlar a quantidade mínima de produtos no estoque e quantida	máxima de produtos que pode ser adquirida
ALTER TABLE tbCarros
    Add quantMin INT, quantMax INT

-- 2 - Alterar o campo forEmpresa para forNome
EXEC sp_Rename 'tbManutencao.manutencaoEmpresa', 'manutencaoNome', 'Column'

-- 3 - Incluir uma tabela de Categoria de Produtos, de modo que seja cadastrado todas as categorias de produtos que a loja vende
CREATE TABLE tbCategoriaCarro (
    categoriaCodigo INT PRIMARY KEY,
    categoriaNome VARCHAR(50) NOT NULL,
    categoriaDescricao VARCHAR(150)
)

INSERT INTO tbCategoriaCarro (categoriaCodigo, categoriaNome, categoriaDescricao)
    VALUES (1, 'SUV', 'Carro Familiar'),
           (2, 'Esportivo', 'Carro com aerodinâmica'),
           (3, 'Super Esportivo', 'Carro com velocidade máxima acima dos 200km/h'),
           (4, 'Luxo', 'Carro com valor acima de R$300.000,00'),
           (5, 'Sedan', 'Carro Executivo'),
           (6, 'Coupe', 'Carro Esportivo a depender da classificação do veiculo'),
           (7, 'Reti', 'Carro com trazeira reta'),
           (8, 'Conversivel', 'Carro com teto retratio')

-- 4 - Incluir o campo do Codigo da Categoria no cadastro de Produtos
ALTER TABLE tbCarros
ADD categoriaCodigo INT FOREIGN KEY REFERENCES tbCategoriaCarro(categoriaCodigo)

-- 5 - Incluir todos os dados referentes Categoria no cadastro de Produtos
UPDATE tbCarros
SET categoriaCodigo = 1
WHERE carroCodigo <= 10

UPDATE tbCarros
SET categoriaCodigo = 2
WHERE carroCodigo BETWEEN 11 AND 20

UPDATE tbCarros
SET categoriaCodigo = 3
WHERE carroCodigo BETWEEN 21 AND 30

UPDATE tbCarros
SET categoriaCodigo = 4
WHERE carroCodigo BETWEEN 31 AND 40

UPDATE tbCarros
SET categoriaCodigo = 5
WHERE carroCodigo BETWEEN 41 AND 50

UPDATE tbCarros
SET categoriaCodigo = 6
WHERE carroCodigo BETWEEN 51 AND 60

UPDATE tbCarros
SET categoriaCodigo = 7
WHERE carroCodigo BETWEEN 61 AND 70

UPDATE tbCarros
SET categoriaCodigo = 8
WHERE carroCodigo BETWEEN 71 AND 80

-- 6 - Incluir o campo de Número de Dependentes na tabela Funcionários
ALTER TABLE tbFuncionarios
ADD numDependentes INT

-- 7 - Colocar número de dependentes em alguns registros
UPDATE tbFuncionarios 
SET numDependentes = 2
WHERE funcionarioCodigo % 2 = 0

-- 8 - Excluir todos os registros, da tabela de Pendências, onde o campo pago seja Verdadeiro
DELETE FROM tbPendencia
WHERE pendenciaPaga = 1

-- 9 - Alterar todos os registros do campo Tipo de pagamento da tabela Vendas, de Cartão de Compras para Cartão de Crédito
UPDATE tbVendas
    SET tipoPagamento = 'Cartão de Crédito'
    WHERE tipoPagamento LIKE '%Compras'