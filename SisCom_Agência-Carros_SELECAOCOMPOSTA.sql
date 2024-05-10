/*
	PROJETO SisCom_Agência-Carros_SELECAOCOMPOSTA
		Alexandre Ribeiro dos Santos
		Letícia Vitória Perez Ramos
		Richard dos Santos Oliveira
*/

-- Selecionando o Banco de Dados que será utilizado --
USE SisCom_AgenciaCarros
GO

-- 1 Mostrar todos os clientes do estado de São Paulo --
SELECT C.clienteNome AS 'Clientes'
FROM tbClientes C
INNER JOIN tbEndereco E
ON C.codigoCEP = E.codigoCEP
INNER JOIN tbLogradouro L
ON E.logradouroCodigo = L.logradouroCodigo
INNER JOIN tbBairro B
ON B.bairroCodigo = L.bairroCodigo
INNER JOIN tbCidade Cid
ON Cid.cidadeCodigo = B.cidadeCodigo
INNER JOIN tbEstado Est
ON Est.estadoCodigo = Cid.estadoCodigo
WHERE Est.nomeEstado LIKE 'São Paulo'
GO

-- 2 Mostrar todos os Fornecedores e seus respectivos Produtos, ordenados por Fornecedor --
SELECT M.manutencaoEmpresa AS 'Empresa', -- Nome da empresa que prestou o serviço
       Car.carroModelo AS 'Carro'        -- Nome do carro que foi enviado a manutenção
FROM tbManutencao M
INNER JOIN tbCarros Car
ON M.carroCodigo = Car.carroCodigo
ORDER BY 1
GO

-- 3 Mostrar todos os Produtos e seus respectivos Fornecedores, ordenador por Produtos --
SELECT Car.carroModelo AS 'Carro', -- Nome do Carro
       M.manutencaoEmpresa AS 'Nome empresa', -- Nome da empresa que prestou manutenção
       M.manutencaoCNPJ AS 'CNPJ' -- CNPJ da empresa que prestou manutenção
FROM tbCarros Car
INNER JOIN tbManutencao M
ON Car.carroCodigo = M.carroCodigo
ORDER BY 1
GO

-- 4 Mostrar todos os Departamentos e seus respectivos Funcionários e cargos, ordenados por Departamentos e Funcionários --
-- No nosso caso todos os dados do Funcionário estão na tbFuncionarios, assim não havendo a necessidade de utilizar INNER JOIN
SELECT F.funcionarioDepto AS 'Departamento', 
       F.funcionarioNome AS 'Nome Funcionário',
       F.funcionarioCargo AS 'Cargo'
FROM tbFuncionarios F
ORDER BY 1, 2
GO

-- 5 Mostrar todas as Vendas, com os nomes dos Clientes, Funcionários e Tipo de Pagamentos envolvidos --
-- Por não ter o tipo de pagamento incluimos se a venda foi paga ou não (0 para pendente e 1 para paga)
SELECT C.clienteNome AS 'Cliente',
       F.funcionarioNome AS 'Funcionário',
       V.vendaValor AS 'Valor da venda',
       P.pendenciaPaga AS 'Pendência Paga'
FROM tbClientes C
INNER JOIN tbVendas V
ON C.clienteCodigo = V.clienteCodigo
INNER JOIN tbFuncionarios F
ON V.funcionarioCodigo = F.funcionarioCodigo
INNER JOIN tbPendencia P
ON v.vendaCodigo = P.vendaCodigo
GO

-- 6 Mostrar todos os Produtos que cada Cliente comprou, e seus Fornecedores, com um total para cada Produto. Ordenado por Cliente e Produtos --
SELECT Car.carroModelo AS 'Carro',
       Car.carroValorVenda AS 'Valor do Carro',
       C.clienteNome AS 'Cliente',
       M.manutencaoEmpresa AS 'Empresa'
FROM tbVendas V
INNER JOIN tbClientes C
ON V.clienteCodigo = C.clienteCodigo
INNER JOIN tbCarros Car
ON V.carroCodigo = Car.carroCodigo
INNER JOIN tbManutencao M
ON Car.carroCodigo = M.carroCodigo
ORDER BY 1, 2
GO
-- 7 Mostrar todas as Pendências de cada Cliente --
SELECT C.clienteNome AS 'Cliente',
       P.valorPendencia AS 'Valor',
       P.qtnParcelasPendentes AS 'Quantidade de parcelas'
FROM tbVendas V
INNER JOIN tbClientes C
ON V.clienteCodigo = C.clienteCodigo
INNER JOIN tbPendencia P
ON V.vendaCodigo = P.vendaCodigo
GO

-- 8 Mostrar apenas as Vendas que tenha Clientes com Pendência do tipo Cheque que ainda não pagou --
-- Tipos de pagamento, 1 - Dinheiro, 2 - Cheque, 3 - Financiamento 
SELECT C.clienteNome AS 'Cliente',
       V.vendaValor AS 'Valor',
       P.tipoPendencia AS 'Tipo de Pendência'
FROM tbVendas V
INNER JOIN tbClientes C
ON V.clienteCodigo = C.clienteCodigo
INNER JOIN tbPendencia P
ON V.vendaCodigo = P.vendaCodigo
WHERE P.tipoPendencia = 2
GO

-- 9 Mostrar todos os Produtos onde o Fornecedor seja de São Paulo e quantidade seja menor que 10 --
SELECT Car.carroModelo AS 'Carro',
       M.manutencaoEmpresa AS 'Empresa',
       Est.nomeEstado AS 'Estado'
FROM tbManutencao M
INNER JOIN tbCarros Car
ON M.carroCodigo = Car.carroCodigo
INNER JOIN tbEndereco E
ON M.codigoCEP = E.codigoCEP
INNER JOIN tbLogradouro L
ON E.logradouroCodigo = L.logradouroCodigo
INNER JOIN tbBairro B
ON B.bairroCodigo = L.bairroCodigo
INNER JOIN tbCidade Cid
ON Cid.cidadeCodigo = B.cidadeCodigo
INNER JOIN tbEstado Est
ON Est.estadoCodigo = Cid.estadoCodigo
WHERE Est.nomeEstado LIKE 'São Paulo'
GO

-- 10 Mostrar todas as Vendas, os nomes dos Clientes, Funcionários, Produtos, Fornecedores, etc, apenas de Produtos cujos Fornecedores não sejam do Brasil, e quantidade comprada maior que 5. --
-- Só possui 20 vendas realizadas e todas elas são no Brasil, por isso não aparece nada ao executar a query abaixo
SELECT C.clienteNome AS 'Cliente',
       F.funcionarioNome AS 'Funcionário',
       V.vendaValor AS 'Valor',
       V.vendaNumCont AS 'Nota Fiscal',
       Car.carroModelo AS 'Carro',
       M.manutencaoEmpresa AS 'Empresa',
       Pais.nomePais AS 'Pais'
FROM tbVendas V
INNER JOIN tbClientes C
ON V.clienteCodigo = C.clienteCodigo
INNER JOIN tbFuncionarios F
ON V.funcionarioCodigo = F.funcionarioCodigo
INNER JOIN tbCarros Car
ON V.carroCodigo = Car.carroCodigo
INNER JOIN tbManutencao M
ON Car.carroCodigo = M.carroCodigo
INNER JOIN tbEndereco E
ON M.codigoCEP = E.codigoCEP
INNER JOIN tbLogradouro L
ON E.logradouroCodigo = L.logradouroCodigo
INNER JOIN tbBairro B
ON B.bairroCodigo = L.bairroCodigo
INNER JOIN tbCidade Cid
ON Cid.cidadeCodigo = B.cidadeCodigo
INNER JOIN tbEstado Est
ON Est.estadoCodigo = Cid.estadoCodigo
INNER JOIN tbPais Pais
ON Est.paisCodigo = Pais.paisCodigo
WHERE Pais.nomePais NOT LIKE 'Brasil'
GO