/*
	PROJETO SisCom_Ag�ncia-Carros_CRIAR
		Alexandre Ribeiro dos Santos
		Let�cia Vit�ria Perez Ramos
		Richard dos Santos Oliveira
*/
 
-- Criando o Banco de Dados --
CREATE DATABASE SisCom_AgenciaCarros
GO

-- Selecionando o Banco de Dados que ser� utilizado --
USE SisCom_AgenciaCarros
GO

/* 
	O ideal � criar as tabelas de acordo com a ordem 
	em que usar� as chaves estrangeiras, para que n�o
	ocorra erros no c�digo. (Caso a primeira tabela 
	tenha uma chave estrangeira criada na ultima tabela
	o SQLSERVER n�o consegue referenciar corretamente, 
	resultando em um erro.)
*/
 
-- Criando as tabelas e seus campos --
CREATE TABLE tbPais
	(
		paisCodigo INT PRIMARY KEY NOT NULL,
		nomePais NVARCHAR(50) NOT NULL
	)
GO

CREATE TABLE tbEstado
	(
		estadoCodigo INT PRIMARY KEY NOT NULL,
		paisCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		nomeEstado NVARCHAR(50) NOT NULL,
		FOREIGN KEY (paisCodigo) REFERENCES tbPais (paisCodigo)
	)
GO

CREATE TABLE tbCidade
	(
		cidadeCodigo INT PRIMARY KEY NOT NULL,
		estadoCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		nomeCidade NVARCHAR(50) NOT NULL,
		FOREIGN KEY (estadoCodigo) REFERENCES tbEstado (estadoCodigo)
	)
GO

CREATE TABLE tbBairro
	(
		bairroCodigo INT PRIMARY KEY NOT NULL,
		cidadeCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		nomeBairro NVARCHAR(50) NOT NULL,
		FOREIGN KEY (cidadeCodigo) REFERENCES tbCidade (cidadeCodigo)
	)
GO

CREATE TABLE tbLogradouro
	(
		logradouroCodigo INT PRIMARY KEY NOT NULL,
		bairroCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		nomeLogradouro NVARCHAR(50) NOT NULL,
		FOREIGN KEY (bairroCodigo) REFERENCES tbBairro (bairroCodigo)
	)
GO

CREATE TABLE tbEndereco
	(
		codigoCEP INT PRIMARY KEY NOT NULL,
		CEP NVARCHAR(15) NOT NULL,
		logradouroCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		FOREIGN KEY (logradouroCodigo) REFERENCES tbLogradouro (logradouroCodigo)
	)
GO

CREATE TABLE tbClientes
	(
		clienteCodigo INT PRIMARY KEY NOT NULL,
		codigoCEP INT NOT NULL /*Chave Estr�ngeira*/,
		clienteNome NVARCHAR(50) NOT NULL,
		clienteFonePes NVARCHAR(15) NOT NULL,
		clienteDtNasc DATE NOT NULL,
		clienteRG NVARCHAR(15) NOT NULL,
		clienteCPF NVARCHAR(18) NOT NULL,
		FOREIGN KEY (codigoCEP) REFERENCES tbEndereco (codigoCEP)
	)
GO
 
CREATE TABLE tbFuncionarios
	(
		funcionarioCodigo INT PRIMARY KEY NOT NULL,
		codigoCEP INT NOT NULL /*Chave Estr�ngeira*/,
		funcionarioNome NVARCHAR(50) NOT NULL,
		funcionarioCargo NVARCHAR(30) NOT NULL,
		funcionarioVlHora MONEY NOT NULL,
		funcionarioDepto NVARCHAR(35) NOT NULL,
		funcionarioDtNasc DATE NOT NULL,
		funcionarioDtAdmissao DATE NOT NULL,
		FOREIGN KEY (codigoCEP) REFERENCES tbEndereco (codigoCEP)
	)
GO
 
CREATE TABLE tbCarros
	(
		carroCodigo INT PRIMARY KEY NOT NULL,
		carroDescricao NVARCHAR(150) NOT NULL,
		carroDescResumida NVARCHAR(50) NOT NULL,
		carroAno SMALLINT NOT NULL,
		carroQuilometragem FLOAT NOT NULL,
		carroValorVenda MONEY NOT NULL,
		carroModelo NVARCHAR(35) NOT NULL
	)
GO

CREATE TABLE tbManutencao
	(
		manutencaoCodigo INT PRIMARY KEY NOT NULL,
		carroCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		codigoCEP INT NOT NULL /*Chave Estr�ngeira*/,
		manutencaoEmpresa NVARCHAR(50) NOT NULL,
		manutencaoEmail NVARCHAR(50) NOT NULL,
		manutencaoContato NVARCHAR(30) NOT NULL,
		manutencaoFone NVARCHAR(15) NOT NULL,
		manutencaoCNPJ NVARCHAR(20) NOT NULL,
		FOREIGN KEY (carroCodigo) REFERENCES tbCarros (carroCodigo),
		FOREIGN KEY (codigoCEP) REFERENCES tbEndereco (codigoCEP)
	)
GO

CREATE TABLE tbVendas
	(
		vendaCodigo INT PRIMARY KEY NOT NULL,
		clienteCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		funcionarioCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		carroCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		vendaData DATE NOT NULL,
		vendaNumCont NVARCHAR(50) NOT NULL,
		vendaValor MONEY NOT NULL,
		FOREIGN KEY (clienteCodigo) REFERENCES tbClientes (clienteCodigo),
		FOREIGN KEY (funcionarioCodigo) REFERENCES tbFuncionarios (funcionarioCodigo),
		FOREIGN KEY (carroCodigo) REFERENCES tbCarros (carroCodigo)
	)
GO

CREATE TABLE tbPendencia
	(
		pendenciaCodigo INT PRIMARY KEY NOT NULL,
		funcionarioCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		vendaCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		manutencaoCodigo INT NOT NULL /*Chave Estr�ngeira*/,
		pendenciaPaga BIT NOT NULL,
		valorPendencia MONEY NOT NULL,
		qtnParcelasPendentes INT NOT NULL,
		vendaPago BIT NOT NULL,
		vendaDtPagto DATE NOT NULL,
		tipoPendencia INT NOT NULL,
		FOREIGN KEY (funcionarioCodigo) REFERENCES tbFuncionarios (funcionarioCodigo),
		FOREIGN KEY (vendaCodigo) REFERENCES tbVendas (vendaCodigo),
		FOREIGN KEY (manutencaoCodigo) REFERENCES tbManutencao (manutencaoCodigo)
	)
GO