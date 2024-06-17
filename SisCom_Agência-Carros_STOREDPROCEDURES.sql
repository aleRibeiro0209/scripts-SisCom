/*
	PROJETO SisCom_Agência-Carros_STOREDPROCEDURES
		Alexandre Ribeiro dos Santos
		Letícia Vitória Perez Ramos
		Richard dos Santos Oliveira
*/

-- Selecionando o Banco de Dados que será utilizado --
USE SisCom_AgenciaCarros
GO

-- 1 - Cadastrar Clientes
CREATE PROCEDURE sp_CadastroCliente
    (
        @cod INT,
        @cep INT,
        @nome NVARCHAR(50),
        @numTelefone NVARCHAR(15),
        @dataNascimento DATE,
        @rg NVARCHAR(15),
        @cpf NVARCHAR(18)
    )
AS
BEGIN
    INSERT INTO tbClientes (clienteCodigo, codigoCEP, clienteNome, clienteFonePes, clienteDtNasc, clienteRG, clienteCPF)
    VALUES (@cod, @cep, @nome, @numTelefone, @dataNascimento, @rg, @cpf)

    PRINT 'Cliente cadastrado com sucesso.';
END

EXEC sp_CadastroCliente 42, 1, 'Rogério Senna', '11 91369-9633', '12/12/2012', '11987352-0', '856.342.654-43';
GO

-- 2 - Cadastrar Funcionarios
CREATE PROCEDURE sp_CadastroFuncionario
    (
        @cod INT,
        @cep INT,
        @nome NVARCHAR(50),
        @cargo NVARCHAR(25),
        @vlHora MONEY,
        @dep NVARCHAR(30),
        @dataNascimento DATE,
        @dataAdmissao DATE
    )
AS
BEGIN
    INSERT INTO tbFuncionarios (funcionarioCodigo, codigoCEP, funcionarioNome, funcionarioCargo, funcionarioVlHora, funcionarioDepto, funcionarioDtNasc, funcionarioDtAdmissao)
    VALUES (@cod, @cep, @nome, @cargo, @vlHora, @dep, @dataNascimento, @dataAdmissao)

    PRINT 'Funcionário cadastrado com sucesso.';
END

EXEC sp_CadastroFuncionario 16, 3, 'Marcelo Silva', 'Mecanico', 100, 'Manutencao', '15/03/1975', '06/03/2000';
GO

-- 3 - Cadastrar Fornecedores
CREATE PROCEDURE sp_CadastroManutencao
    (
        @cod INT,
        @carroCod INT,
        @cep INT,
        @nome NVARCHAR(50),
        @email NVARCHAR(50),
        @contato NVARCHAR(30),
        @telefone NVARCHAR(15),
        @cnpj NVARCHAR (20)
    )
AS
BEGIN
    INSERT INTO tbManutencao (manutencaoCodigo, carroCodigo, codigoCEP, manutencaoNome, manutencaoEmail, manutencaoContato, manutencaoFone, manutencaoCNPJ)
    VALUES (@cod, @carroCod, @cep, @nome, @email, @contato, @telefone, @cnpj)

    PRINT 'Empresa cadastrada com sucesso.';
END

EXEC sp_CadastroManutencao 21, 76, 4, 'Concerto Certo', 'gerencia@concertocerto.com', 'Pedro - Gerente', '(11) 1234-5678', '12345678901234';
GO

-- 4 - Cadastrar Produtos
CREATE PROCEDURE sp_CadastroCarro
    (
        @cod INT,
        @descricao NVARCHAR(150),
        @descricaoResumida NVARCHAR(50),
        @ano SMALLINT,
        @quilometragem FLOAT,
        @valor MONEY,
        @modelo NVARCHAR(35)
    )
AS
BEGIN
    INSERT INTO tbCarros (carroCodigo, carroDescricao, carroDescResumida, carroAno, carroQuilometragem, carroValorVenda, carroModelo)
    VALUES (@cod, @descricao, @descricaoResumida, @ano, @quilometragem, @valor, @modelo)

    PRINT 'Carro cadastrado com sucesso.';
END

EXEC sp_CadastroCarro 81, 'Porsche 918 Spyder', 'Porsche 918', 2018, 35000, 4500000.00, '918 Spyder';
GO

-- 5 - Procurar um Produto na tabela produtos, exibindo Nome do Produto e seu respectivo Fornecedor
CREATE PROCEDURE sp_ConsultaCarro (@cod INT)
AS
BEGIN
    SELECT Car.carroModelo AS 'Carro',
           Man.manutencaoNome AS 'Empresa de Manutenção'
    FROM tbCarros Car
    INNER JOIN tbManutencao Man
    ON Car.carroCodigo = Man.carroCodigo
    WHERE Car.carroCodigo = @cod
END

EXEC sp_ConsultaCarro 12
GO

-- 6 - Mostrar o Total a Pagar de um Venda informada
CREATE PROCEDURE sp_ConsultaValorVenda (@cod INT)
AS
BEGIN
    SELECT vendaValor AS 'Valor Total'
    FROM tbVendas
    WHERE vendaCodigo = @cod
END

EXEC sp_ConsultaValorVenda 20
GO

-- 7 - Excluir um Fornecedor informado e todos os produtos relacionados a esse fornecedor
CREATE PROCEDURE sp_excluirEmpresaManutencao (@cod INT)
AS
BEGIN
    -- PROCEDURE ADAPTADA
    DELETE FROM tbPendencia
    WHERE manutencaoCodigo = @cod

    DELETE FROM tbManutencao
    WHERE manutencaoCodigo = @cod

    PRINT 'Empresa de Manutenção e pendências relacionadas excluidas.';
END

EXEC sp_excluirEmpresaManutencao 21
GO

-- 8 - Excluir um Cliente informado e todas as compras relacionadas a esse cliente
CREATE PROCEDURE sp_excluirCliente (@cod INT)
AS
BEGIN
    DELETE FROM tbVendas
    WHERE clienteCodigo = @cod

    DELETE FROM tbClientes
    WHERE clienteCodigo = @cod

    PRINT 'Cliente e compras relacionadas excluidas.';
END

EXEC sp_excluirCliente 12
GO

-- 9 - Excluir um Funcionario informado
CREATE PROCEDURE sp_excluirFuncionario (@cod INT)
AS
BEGIN
    -- Caso não delete as vendas relacionadas ao funcionario a procedure não funciona
    DELETE FROM tbVendas
    WHERE funcionarioCodigo = @cod

    DELETE FROM tbFuncionarios
    WHERE funcionarioCodigo = @cod

    PRINT 'Funcionario excluido.';
END

EXEC sp_excluirFuncionario 13
GO

-- 10 - Mostrar todas as vendas de um funcionario informado
CREATE PROCEDURE sp_relatorioVendaFuncionario (@cod INT)
AS
BEGIN
    SELECT funcionarioCodigo AS 'Código do Funcionario', vendaCodigo AS 'Código da Venda', vendaData AS 'Data da Venda', vendaNumCont AS 'Número de Contrato', vendaValor AS 'Valor da Venda', clienteCodigo AS 'Código do Cliente', carroCodigo AS 'Código do Carro'
    FROM tbVendas
    WHERE funcionarioCodigo = @cod
END

EXEC sp_relatorioVendaFuncionario 14
GO

-- 11 - Mostrar todas as compras de um cliente informado
CREATE PROCEDURE sp_relatorioCompraCliente (@cod INT)
AS
BEGIN
    SELECT clienteCodigo AS 'Código do Cliente', carroCodigo AS 'Código do Carro', vendaCodigo AS 'Código da Venda', vendaData AS 'Data da Venda', vendaNumCont AS 'Número de Contrato', vendaValor AS 'Valor da Venda',funcionarioCodigo AS 'Código do Funcionario'
    FROM tbVendas
    WHERE clienteCodigo = @cod
END

EXEC sp_relatorioCompraCliente 14
GO

-- 12 - Mostrar todos os produtos de um fornecedor informado
CREATE PROCEDURE sp_consultaCarrosManutencao (@cod INT)
AS
BEGIN
    SELECT Man.manutencaoCodigo AS 'Código Empresa', Car.*
    FROM tbCarros Car
    INNER JOIN tbManutencao Man
    ON Car.carroCodigo = Man.carroCodigo
    WHERE Man.manutencaoCodigo = @cod
END

EXEC sp_consultaCarrosManutencao 12
GO