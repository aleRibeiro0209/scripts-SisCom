/*
	PROJETO SisCom_Agência-Carros_RELCOMPLEMENTAR
		Alexandre Ribeiro dos Santos
		Letícia Vitória Perez Ramos
		Richard dos Santos Oliveira
*/

-- Selecionando o Banco de Dados que será utilizado --
USE SisCom_AgenciaCarros
GO

-- 1 - Relacionar todos os produtos com os Fornecedores, independente de ter ou não relacionamento.
SELECT * FROM tbCarros CROSS JOIN tbManutencao
GO

-- 2 - Relacionar todos os Departamentos com os Funcionários, independente de ter ou não relacionamento
SELECT * FROM tbFuncionarios CROSS JOIN tbVendas
GO

-- 3 - Mostrar todos os Produtos que não tiveram nenhuma venda
SELECT Car.* 
FROM tbCarros Car 
LEFT JOIN tbVendas Ven ON Car.carroCodigo = Ven.carroCodigo
WHERE Ven.carroCodigo IS NULL
GO

-- 4 - Mostrar todos os Fornecedores dos Produtos que não tiveram vendas.
SELECT Man.* 
FROM tbManutencao Man 
INNER JOIN tbCarros Car ON Man.carroCodigo = Car.carroCodigo 
LEFT JOIN tbVendas Ven ON Car.carroCodigo = Ven.carroCodigo 
WHERE Ven.carroCodigo IS NULL
GO

-- 5 - Mostrar todos os endereços que não tem nenhum Cliente cadastrado
SELECT E.*
FROM tbEndereco E
LEFT JOIN tbClientes C ON E.codigoCEP = C.codigoCEP
WHERE C.codigoCEP IS NULL
GO

-- 6 - Mostrar todos os Clientes que não fizeram compras
SELECT C.*
FROM tbClientes C
LEFT JOIN tbVendas Ven ON C.clienteCodigo = Ven.clienteCodigo
WHERE Ven.clienteCodigo IS NULL 
GO

-- 7 - Mostrar todos os atendentes de caixa que não estão relacionados em nenhuma venda
SELECT Func.* 
FROM tbFuncionarios Func 
LEFT JOIN tbVendas Ven ON Func.funcionarioCodigo = Ven.funcionarioCodigo 
WHERE Ven.funcionarioCodigo IS NULL
GO

-- 8 - Mostrar o Nome do cliente e o celular que tem compras apenas com pagamento em Cartão de Crédito
SELECT C.clienteNome AS 'Nome',
	   C.clienteFonePes AS 'Celular'
FROM tbClientes C
INNER JOIN tbVendas Ven ON C.clienteCodigo = Ven.clienteCodigo
WHERE Ven.tipoPagamento LIKE '%Crédito'
GO

-- 9 - Mostrar todos os fornecedores estrangeiros que não tem produtos vendidos
SELECT Man.* 
FROM tbManutencao Man 
INNER JOIN tbCarros Car ON Man.carroCodigo = Car.carroCodigo 
LEFT JOIN tbVendas Ven ON Car.carroCodigo = Ven.carroCodigo
INNER JOIN tbEndereco E ON Man.codigoCEP = E.codigoCEP
INNER JOIN tbLogradouro L ON E.logradouroCodigo = L.logradouroCodigo
INNER JOIN tbBairro B ON B.bairroCodigo = L.bairroCodigo
INNER JOIN tbCidade Cid ON Cid.cidadeCodigo = B.cidadeCodigo
INNER JOIN tbEstado Est ON Est.estadoCodigo = Cid.estadoCodigo
INNER JOIN tbPais Pais ON Est.paisCodigo = Pais.paisCodigo
WHERE Ven.carroCodigo IS NULL AND Pais.nomePais NOT LIKE 'Brasil'
GO

-- 10 - Mostrar todos os cargos que não tem nenhum funcionário
SELECT Func.*
FROM tbFuncionarios Func
WHERE Func.funcionarioCargo IS NULL
GO

-- OBS: Em nosso banco de dados não temos a tabela referente a cargos