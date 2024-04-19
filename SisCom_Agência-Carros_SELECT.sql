/*
	PROJETO SisCom_Agência-Carros_SELECT
		Alexandre Ribeiro dos Santos
		Letícia Vitória Perez Ramos
		Richard dos Santos Oliveira

    EM ANDAMENTO...
*/

-- Selecionando o Banco de Dados que será utilizado --
USE SisCom_AgenciaCarros
GO

-- 1 - Mostra todos os clientes por ordem alfabética de nome
SELECT clienteNome AS 'Nome do Cliente'
FROM tbClientes
ORDER BY clienteNome ASC
GO

-- 1 - Mostra todos os funcionarios por ordem alfabética de nome
SELECT funcionarioNome AS 'Nome do Funcionário'
FROM tbFuncionarios
ORDER BY funcionarioNome ASC
GO

-- 1 - Mostra todos os Fornocedores por ordem alfabética de nome
SELECT manutencaoEmpresa AS 'Nome da Empresa'
FROM tbManutencao
ORDER BY manutencaoEmpresa ASC
GO 

-- 1 - Mostra todos os produtos por ordem alfabética de nome
SELECT carroModelo AS 'Nome do Carro'
FROM tbCarros
ORDER BY carroModelo ASC
GO

-- 2 - Mostrar as cidades de São Paulo e Rio de Janeiro em ordem alfabética (Nome da cidade e depois estado).
SELECT nomeCidade AS 'Nome da cidade', estadoCodigo AS 'Código do Estado'
FROM tbCidade
WHERE estadoCodigo = (SELECT estadoCodigo
                      FROM tbEstado
                      WHERE nomeEstado LIKE 'São Paulo' 
                     )
OR estadoCodigo = (SELECT estadoCodigo
                      FROM tbEstado
                      WHERE nomeEstado LIKE 'Rio de Janeiro' 
                     )
ORDER BY nomeCidade ASC
GO
 
-- 3 - Mostrar todos os produtos com quantidade menor que 10, ordenados e com formatação de saída
SELECT carroModelo AS 'Nome carro', carroAno AS 'Ano do carro', carroQuilometragem AS 'Quilometragem'
FROM tbCarros
WHERE carroQuilometragem <= 10000
ORDER BY carroModelo ASC
GO


-- 4 - Mostrar o valor de todos os itens de cada produto no estoque. Mostrar apenas os campos código, descrição e valor total ordenado e formatado
SELECT carroCodigo AS 'Código do carro', carroDescResumida AS 'Descrição resumida', carroValorVenda AS 'Valor de venda'
FROM tbCarros
ORDER BY carroCodigo
GO

-- 5 - Escolha 3 clientes e mostre todas as compras feitas por eles ordenado e formatado
SELECT vendaCodigo AS 'Código da venda', clienteCodigo AS 'Código do cliente', vendaValor AS 'Valor da venda'
FROM tbVendas
WHERE clienteCodigo BETWEEN 3 AND 5
ORDER BY clienteCodigo ASC
GO

-- 6 - Escolha 3 funcionários e mostre todas as vendas feitas por eles ordenado e formatado
SELECT vendaCodigo AS 'Código da venda', funcionarioCodigo AS 'Código do funcionário', vendaValor AS 'Valor da venda'
FROM tbVendas
WHERE funcionarioCodigo BETWEEN 6 AND 8
ORDER BY funcionarioCodigo ASC
GO

-- 7 - Escolha 2 vendas e mostre todos os produtos de cada venda ordenado e formatado
SELECT vendaNumCont AS 'NF', vendaData AS 'Data da venda', vendaCodigo AS 'Código do venda', funcionarioCodigo AS 'Código do funcionário', clienteCodigo AS 'Código do cliente', carroCodigo AS 'Código do carro vendido', vendaValor AS 'Valor do veiculo'
FROM tbVendas
WHERE vendaCodigo = 26
OR vendaCodigo = 59
ORDER BY vendaData ASC
GO

-- 8 - Mostre dos os fornecedores estrangeiros
SELECT *
FROM tbManutencao
WHERE codigoCEP != 1
ORDER BY codigoCEP
GO

-- 9 - Mostre todos os clientes que compraram mais de 3 vezes

-- 10 - Mostre os todos os clientes onde a primeira letra do nome é B e a terceira letra é A da cidade de São Paulo ou do Rio de Janeiro.
SELECT *
FROM tbClientes
WHERE clienteNome LIKE '%S___A'
AND codigoCEP = 1
GO