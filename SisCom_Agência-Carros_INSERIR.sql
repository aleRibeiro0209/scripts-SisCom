/*
	PROJETO SisCom_Agência-Carros_INSERIR
		Alexandre Ribeiro dos Santos
		Letícia Vitória Perez Ramos
		Richard dos Santos Oliveira
*/

-- Selecionando o Banco de Dados que será utilizado --
USE SisCom_AgenciaCarros
GO

/* 
	O ideal é inserir as informações nas tabelas de acordo com a ordem 
	em que elas foram criadas para evitar conflitos das chaves estrângeiras 
	e fique atento na quantidade e nos valores das chaves entrageiras está 
	usando.
*/

-- Inserir dados na Tabela Pais --
INSERT INTO tbPais (paisCodigo, nomePais) 
	VALUES (1, 'Brasil'),
		   (2, 'Estados Unidos'),
		   (3, 'Canadá'),
		   (4, 'Austrália'),
		   (5, 'Reino Unido')
GO

-- Inserir dados na Tabela Estado --
INSERT INTO tbEstado (estadoCodigo, paisCodigo, nomeEstado) 
	VALUES (1, 1, 'São Paulo'),
		   (2, 1, 'Rio de Janeiro'),
		   (3, 2, 'Califórnia'),
		   (4, 2, 'Texas'),
		   (5, 3, 'Ontário')
GO

-- Inserir dados na Tabela Cidade --
INSERT INTO tbCidade (cidadeCodigo, estadoCodigo, nomeCidade) 
	VALUES (1, 1, 'São Paulo'),
	       (2, 1, 'Campinas'),
		   (3, 2, 'Rio de Janeiro'),
		   (4, 3, 'Los Angeles'),
		   (5, 3, 'San Francisco')
GO

-- Inserir dados na Tabela Bairro --
INSERT INTO tbBairro (bairroCodigo, cidadeCodigo, nomeBairro) 
	VALUES (1, 1, 'Vila Mariana'),
		   (2, 1, 'Moema'),
		   (3, 2, 'Centro'),
		   (4, 3, 'Hollywood'),
		   (5, 4, 'Downtown')
GO

-- Inserir dados na Tabela Logradouro --
INSERT INTO tbLogradouro (logradouroCodigo, bairroCodigo, nomeLogradouro) 
	VALUES (1, 1, 'Rua A'),
		   (2, 1, 'Rua B'),
		   (3, 2, 'Avenida X'),
		   (4, 3, 'Main Street'),
		   (5, 4, 'Market Street')
GO

-- Inserir dados na Tabela Endereço --
INSERT INTO tbEndereco (codigoCEP, CEP, logradouroCodigo) 
	VALUES (1, '01000-000', 1),
		   (2, '02000-000', 2),
		   (3, '10000-000', 3),
		   (4, '90000-000', 4),
		   (5, '94110-000', 5)
GO

-- Inserir dados na Tabela Clientes --
INSERT INTO tbClientes (clienteCodigo, codigoCEP, clienteNome, clienteFonePes, clienteDtNasc, clienteRG, clienteCPF)
	VALUES (1, 1, 'João da Silva', '(99) 1234-5678', '10/05/1985', '1234567-8', '123.456.789-10'),
	       (2, 2, 'Maria Oliveira', '(88) 9876-5432', '15/07/1990', '9876543-2', '987.654.321-21'),
		   (3, 3, 'Pedro Santos', '(77) 2345-6789', '25/12/1982', '3456789-1', '345.678.912-32'),
		   (4, 4, 'Ana Pereira', '(66) 3456-7890', '20/03/1978', '4567890-1', '456.789.123-43'),
		   (5, 5, 'Carla Almeida', '(55) 4567-8901', '05/09/1995', '5678901-2', '567.890.123-54'),
		   (6, 1, 'Lucas Souza', '(44) 5678-9012', '15/11/1988', '6789012-3', '678.901.234-65'),
		   (7, 2, 'Fernanda Lima', '(33) 6789-0123', '30/01/1970', '7890123-4', '789.012.345-76'),
		   (8, 3, 'Rafaela Costa', '(22) 7890-1234', '25/04/1993', '8901234-5', '890.123.456-87'),
		   (9, 4, 'Marcos Ferreira', '(11) 8901-2345', '12/08/1980', '9012345-6', '901.234.567-98'),
		   (10, 5, 'Juliana Rodrigues', '(00) 9012-3456', '18/06/1987', '0123456-7', '012.345.678-90'),
		   (11, 1, 'Luiz Oliveira', '(99) 8765-4321', '22/07/1992', '2109876-5', '210.987.654-32'),
		   (12, 2, 'Amanda Souza', '(88) 7654-3210', '08/03/1983', '3210765-4', '321.076.543-23'),
		   (13, 3, 'Carlos Silva', '(77) 6543-2109', '14/09/1975', '4321098-3', '432.109.876-12'),
		   (14, 4, 'Laura Santos', '(66) 5432-1098', '03/11/1998', '5432109-2', '543.210.987-01'),
		   (15, 5, 'Cristina Almeida', '(55) 4321-0987', '20/05/1986', '6543210-1', '654.321.098-90'),
		   (16, 1, 'Daniel Pereira', '(44) 3210-9876', '17/08/1991', '7654321-0', '765.432.109-89'),
		   (17, 2, 'Mariana Costa', '(33) 2109-8765', '05/02/1984', '8765432-1', '876.543.210-98'),
		   (18, 3, 'Rodrigo Ferreira', '(22) 1098-7654', '09/06/1979', '9876543-2', '987.654.321-09'),
		   (19, 4, 'Patricia Rodrigues', '(11) 0987-6543', '23/12/1994', '0987654-3', '098.765.432-10'),
		   (20, 5, 'Gabriel Oliveira', '(00) 9876-5432', '28/04/1982', '1098765-4', '109.876.543-21'),
		   (21, 1, 'Tatiane Souza', '(99) 8765-4321', '11/10/1976', '2109876-5', '210.987.654-32'),
		   (22, 2, 'Camila Santos', '(88) 7654-3210', '02/03/1990', '3210765-4', '321.076.543-23'),
		   (23, 3, 'Felipe Silva', '(77) 6543-2109', '19/09/1988', '4321098-3', '432.109.876-12'),
		   (24, 4, 'Isabela Lima', '(66) 5432-1098', '07/11/1997', '5432109-2', '543.210.987-01'),
		   (25, 5, 'Luciana Almeida', '(55) 4321-0987', '14/05/1985', '6543210-1', '654.321.098-90'),
		   (26, 1, 'Ricardo Pereira', '(44) 3210-9876', '29/08/1992', '7654321-0', '765.432.109-89'),
		   (27, 2, 'Paula Costa', '(33) 2109-8765', '06/02/1986', '8765432-1', '876.543.210-98'),
		   (28, 3, 'Lucas Ferreira', '(22) 1098-7654', '10/07/1977', '9876543-2', '987.654.321-09'),
		   (29, 4, 'Carolina Rodrigues', '(11) 0987-6543', '24/12/1995', '0987654-3', '098.765.432-10'),
		   (30, 5, 'Guilherme Oliveira', '(00) 9876-5432', '19/04/1983', '1098765-4', '109.876.543-21'),
		   (31, 1, 'Juliana Souza', '(99) 8765-4321', '02/11/1979', '2109876-5', '210.987.654-32'),
		   (32, 2, 'Renata Santos', '(88) 7654-3210', '15/03/1993', '3210765-4', '321.076.543-23'),
		   (33, 3, 'Vinicius Silva', '(77) 6543-2109', '20/09/1981', '4321098-3', '432.109.876-12'),
		   (34, 4, 'Aline Lima', '(66) 5432-1098', '25/11/1996', '5432109-2', '543.210.987-01'),
		   (35, 5, 'Fernando Almeida', '(55) 4321-0987', '04/06/1989', '6543210-1', '654.321.098-90'),
		   (36, 1, 'Gustavo Pereira', '(44) 3210-9876', '31/08/1994', '7654321-0', '765.432.109-89'),
		   (37, 2, 'Ana Costa', '(33) 2109-8765', '15/02/1987', '8765432-1', '876.543.210-98'),
		   (38, 3, 'Raquel Ferreira', '(22) 1098-7654', '18/07/1978', '9876543-2', '987.654.321-09'),
		   (39, 4, 'Thiago Rodrigues', '(11) 0987-6543', '05/12/1992', '0987654-3', '098.765.432-10'),
		   (40, 5, 'Vivian Oliveira', '(00) 9876-5432', '10/04/1980', '1098765-4', '109.876.543-21')
GO

-- Inserir dados na Tabela Funcionários --
INSERT INTO tbFuncionarios (funcionarioCodigo, codigoCEP, funcionarioNome, funcionarioCargo, funcionarioVlHora, funcionarioDepto, funcionarioDtNasc, funcionarioDtAdmissao) 
	VALUES (1, 1, 'João Silva', 'Mecânico', 30.50, 'Manutenção', '15/03/1985', '20/05/2010'),
		   (2, 2, 'Maria Souza', 'Auxiliar Administrativo', 25.00, 'Administração', '20/07/1990', '10/08/2015'),
		   (3, 3, 'Carlos Oliveira', 'Eletricista', 35.75, 'Manutenção', '10/12/1982', '15/04/2012'),
		   (4, 4, 'Ana Santos', 'Contador', 40.00, 'Financeiro', '25/06/1978', '05/10/2008'),
		   (5, 5, 'Paula Costa', 'Assistente de Vendas', 28.00, 'Vendas', '05/09/1995', '28/02/2019'),
		   (6, 1, 'Felipe Oliveira', 'Mecânico', 32.00, 'Manutenção', '20/11/1988', '12/03/2011'),
		   (7, 2, 'Juliana Silva', 'Recepcionista', 20.00, 'Administração', '30/04/1993', '18/07/2017'),
		   (8, 3, 'Lucas Pereira', 'Encarregado de Manutenção', 38.50, 'Manutenção', '05/08/1980', '22/09/2013'),
		   (9, 4, 'Mariana Costa', 'Analista Financeiro', 45.00, 'Financeiro', '15/02/1975', '30/06/2005'),
		   (10, 5, 'Rafael Souza', 'Vendedor', 26.00, 'Vendas', '18/06/1987', '15/10/2018'),
		   (11, 1, 'Fernanda Santos', 'Auxiliar de Mecânico', 22.50, 'Manutenção', '22/07/1992', '05/09/2014'),
		   (12, 2, 'Gustavo Oliveira', 'Auxiliar Administrativo', 23.00, 'Administração', '08/01/1983', '30/11/2016'),
		   (13, 3, 'Camila Rodrigues', 'Eletricista', 36.25, 'Manutenção', '14/09/1975', '25/01/2009'),
		   (14, 4, 'Rodrigo Silva', 'Contador', 42.00, 'Financeiro', '03/03/1998', '12/05/2020'),
		   (15, 5, 'Vanessa Costa', 'Assistente de Vendas', 29.50, 'Vendas', '07/11/1985', '20/08/2021')
GO

-- Inserir dados na Tabela Carros --
INSERT INTO tbCarros (carroCodigo, carroDescricao, carroDescResumida, carroAno, carroQuilometragem, carroValorVenda, carroModelo)
	VALUES (1, 'Ford Fiesta Hatch 1.6 Flex', 'Ford Fiesta 1.6 Flex', 2018, 35000, 45000.00, 'Fiesta'),
		   (2, 'Volkswagen Gol 1.0', 'VW Gol 1.0', 2019, 25000, 38000.00, 'Gol'),
		   (3, 'Chevrolet Onix LT 1.0', 'Chevrolet Onix LT 1.0', 2020, 15000, 55000.00, 'Onix'),
		   (4, 'Fiat Palio Fire 1.0', 'Fiat Palio Fire 1.0', 2017, 40000, 32000.00, 'Palio'),
		   (5, 'Renault Sandero 1.6', 'Renault Sandero 1.6', 2016, 45000, 30000.00, 'Sandero'),
		   (6, 'Ford Ka SE 1.0', 'Ford Ka SE 1.0', 2019, 20000, 36000.00, 'Ka'),
		   (7, 'Volkswagen Voyage Comfortline 1.6', 'VW Voyage Comfortline 1.6', 2018, 30000, 42000.00, 'Voyage'),
		   (8, 'Chevrolet Prisma LT 1.4', 'Chevrolet Prisma LT 1.4', 2017, 35000, 40000.00, 'Prisma'),
		   (9, 'Fiat Uno Drive 1.0', 'Fiat Uno Drive 1.0', 2019, 18000, 33000.00, 'Uno'),
		   (10, 'Renault Logan Expression 1.6', 'Renault Logan Expression 1.6', 2018, 28000, 38000.00, 'Logan'),
		   (11, 'Ford EcoSport SE 1.5', 'Ford EcoSport SE 1.5', 2020, 12000, 60000.00, 'EcoSport'),
		   (12, 'Volkswagen Fox Connect 1.6', 'VW Fox Connect 1.6', 2019, 22000, 36000.00, 'Fox'),
		   (13, 'Chevrolet Spin LT 1.8', 'Chevrolet Spin LT 1.8', 2017, 32000, 42000.00, 'Spin'),
		   (14, 'Fiat Cronos Drive 1.3', 'Fiat Cronos Drive 1.3', 2019, 20000, 48000.00, 'Cronos'),
		   (15, 'Renault Duster Expression 1.6', 'Renault Duster Expression 1.6', 2018, 25000, 55000.00, 'Duster'),
		   (16, 'Ford Ranger XLT 2.2 Diesel', 'Ford Ranger XLT 2.2 Diesel', 2017, 35000, 80000.00, 'Ranger'),
		   (17, 'Volkswagen Saveiro Cross CD 1.6', 'VW Saveiro Cross CD 1.6', 2019, 18000, 52000.00, 'Saveiro'),
		   (18, 'Chevrolet S10 LTZ 2.8 Diesel', 'Chevrolet S10 LTZ 2.8 Diesel', 2020, 15000, 100000.00, 'S10'),
		   (19, 'Fiat Toro Freedom 1.8 Flex', 'Fiat Toro Freedom 1.8 Flex', 2019, 20000, 70000.00, 'Toro'),
		   (20, 'Renault Master Chassi 2.3 Diesel', 'Renault Master Chassi 2.3 Diesel', 2018, 30000, 90000.00, 'Master'),
		   (21, 'Ford Mustang GT 5.0', 'Ford Mustang GT 5.0', 2019, 8000, 150000.00, 'Mustang'),
		   (22, 'Volkswagen Golf GTI 2.0', 'VW Golf GTI 2.0', 2020, 6000, 130000.00, 'Golf'),
		   (23, 'Chevrolet Camaro SS 6.2', 'Chevrolet Camaro SS 6.2', 2019, 10000, 170000.00, 'Camaro'),
		   (24, 'Fiat 500 Lounge 1.4', 'Fiat 500 Lounge 1.4', 2018, 15000, 55000.00, '500'),
		   (25, 'Renault Kwid Zen 1.0', 'Renault Kwid Zen 1.0', 2020, 5000, 30000.00, 'Kwid'),
		   (26, 'Ford Fusion Titanium 2.0', 'Ford Fusion Titanium 2.0', 2019, 12000, 90000.00, 'Fusion'),
		   (27, 'Volkswagen Jetta Highline 2.0 TSI', 'VW Jetta Highline 2.0 TSI', 2017, 25000, 70000.00, 'Jetta'),
		   (28, 'Chevrolet Cruze LTZ 1.4 Turbo', 'Chevrolet Cruze LTZ 1.4 Turbo', 2018, 20000, 80000.00, 'Cruze'),
		   (29, 'Fiat Argo HGT 1.8', 'Fiat Argo HGT 1.8', 2019, 10000, 45000.00, 'Argo'),
		   (30, 'Renault Captur Intense 2.0', 'Renault Captur Intense 2.0', 2017, 30000, 60000.00, 'Captur'),
		   (31, 'Ford Focus Titanium Plus 2.0', 'Ford Focus Titanium Plus 2.0', 2018, 18000, 70000.00, 'Focus'),
		   (32, 'Volkswagen Virtus Highline 1.0 TSI', 'VW Virtus Highline 1.0 TSI', 2019, 15000, 65000.00, 'Virtus'),
		   (33, 'Chevrolet Tracker Premier 1.4 Turbo', 'Chevrolet Tracker Premier 1.4 Turbo', 2020, 8000, 85000.00, 'Tracker'),
		   (34, 'Fiat Mobi Drive 1.0', 'Fiat Mobi Drive 1.0', 2019, 12000, 35000.00, 'Mobi'),
		   (35, 'Renault Fluence Dynamique 2.0', 'Renault Fluence Dynamique 2.0', 2017, 22000, 50000.00, 'Fluence'),
		   (36, 'Ford Fiesta Sedan 1.6 Flex', 'Ford Fiesta Sedan 1.6 Flex', 2018, 28000, 42000.00, 'Fiesta'),
		   (37, 'Volkswagen up! Pepper 1.0', 'VW up! Pepper 1.0', 2019, 18000, 30000.00, 'up!'),
		   (38, 'Chevrolet Cobalt Elite 1.8', 'Chevrolet Cobalt Elite 1.8', 2020, 15000, 50000.00, 'Cobalt'),
		   (39, 'Fiat Doblo Essence 1.8', 'Fiat Doblo Essence 1.8', 2017, 32000, 55000.00, 'Doblo'),
		   (40, 'Renault Kangoo Express 1.6', 'Renault Kangoo Express 1.6', 2018, 26000, 48000.00, 'Kangoo'),
		   (41, 'Ford Edge SEL 2.0 EcoBoost', 'Ford Edge SEL 2.0 EcoBoost', 2019, 13000, 110000.00, 'Edge'),
		   (42, 'Volkswagen Tiguan Allspace Comfortline 2.0 TSI', 'VW Tiguan Allspace Comfortline 2.0 TSI', 2020, 9000, 95000.00, 'Tiguan'),
		   (43, 'Chevrolet Trailblazer Premier 3.6 V6', 'Chevrolet Trailblazer Premier 3.6 V6', 2019, 14000, 130000.00, 'Trailblazer'),
		   (44, 'Fiat Freemont Precision 2.4', 'Fiat Freemont Precision 2.4', 2018, 24000, 70000.00, 'Freemont'),
		   (45, 'Renault Grand Scenic Zen 1.6', 'Renault Grand Scenic Zen 1.6', 2017, 30000, 60000.00, 'Grand Scenic'),
		   (46, 'Ford Transit Furgão 2.2 Diesel', 'Ford Transit Furgão 2.2 Diesel', 2019, 16000, 85000.00, 'Transit'),
		   (47, 'Volkswagen Amarok Highline 3.0 V6 Diesel', 'VW Amarok Highline 3.0 V6 Diesel', 2018, 20000, 120000.00, 'Amarok'),
		   (48, 'Chevrolet Montana LS 1.4', 'Chevrolet Montana LS 1.4', 2020, 10000, 45000.00, 'Montana'),
		   (49, 'Fiat Fiorino Hard Working 1.4', 'Fiat Fiorino Hard Working 1.4', 2019, 12000, 35000.00, 'Fiorino'),
		   (50, 'Renault Kangoo Express 1.6', 'Renault Kangoo Express 1.6', 2018, 26000, 48000.00, 'Kangoo'),
		   (51, 'Ford Ranger XLS 2.2 Diesel', 'Ford Ranger XLS 2.2 Diesel', 2019, 14000, 75000.00, 'Ranger'),
		   (52, 'Volkswagen Saveiro Robust CS 1.6', 'VW Saveiro Robust CS 1.6', 2020, 8000, 42000.00, 'Saveiro'),
		   (53, 'Chevrolet Montana Sport 1.4', 'Chevrolet Montana Sport 1.4', 2017, 18000, 38000.00, 'Montana'),
		   (54, 'Fiat Fiorino Hard Working 1.4', 'Fiat Fiorino Hard Working 1.4', 2019, 12000, 35000.00, 'Fiorino'),
		   (55, 'Renault Kangoo Express 1.6', 'Renault Kangoo Express 1.6', 2018, 26000, 48000.00, 'Kangoo'),
		   (56, 'Ford Ranger XLS 2.2 Diesel', 'Ford Ranger XLS 2.2 Diesel', 2019, 14000, 75000.00, 'Ranger'),
		   (57, 'Volkswagen Saveiro Robust CS 1.6', 'VW Saveiro Robust CS 1.6', 2020, 8000, 42000.00, 'Saveiro'),
		   (58, 'Chevrolet Montana Sport 1.4', 'Chevrolet Montana Sport 1.4', 2017, 18000, 38000.00, 'Montana'),
		   (59, 'Fiat Fiorino Hard Working 1.4', 'Fiat Fiorino Hard Working 1.4', 2019, 12000, 35000.00, 'Fiorino'),
		   (60, 'Renault Kangoo Express 1.6', 'Renault Kangoo Express 1.6', 2018, 26000, 48000.00, 'Kangoo'),
		   (61, 'Ford Ranger XLS 2.2 Diesel', 'Ford Ranger XLS 2.2 Diesel', 2019, 14000, 75000.00, 'Ranger'),
		   (62, 'Volkswagen Saveiro Robust CS 1.6', 'VW Saveiro Robust CS 1.6', 2020, 8000, 42000.00, 'Saveiro'),
		   (63, 'Chevrolet Montana Sport 1.4', 'Chevrolet Montana Sport 1.4', 2017, 18000, 38000.00, 'Montana'),
		   (64, 'Fiat Fiorino Hard Working 1.4', 'Fiat Fiorino Hard Working 1.4', 2019, 12000, 35000.00, 'Fiorino'),
		   (65, 'Renault Kangoo Express 1.6', 'Renault Kangoo Express 1.6', 2018, 26000, 48000.00, 'Kangoo'),
		   (66, 'Ford Ranger XLS 2.2 Diesel', 'Ford Ranger XLS 2.2 Diesel', 2019, 14000, 75000.00, 'Ranger'),
		   (67, 'Volkswagen Saveiro Robust CS 1.6', 'VW Saveiro Robust CS 1.6', 2020, 8000, 42000.00, 'Saveiro'),
		   (68, 'Chevrolet Montana Sport 1.4', 'Chevrolet Montana Sport 1.4', 2017, 18000, 38000.00, 'Montana'),
		   (69, 'Fiat Fiorino Hard Working 1.4', 'Fiat Fiorino Hard Working 1.4', 2019, 12000, 35000.00, 'Fiorino'),
		   (70, 'Renault Kangoo Express 1.6', 'Renault Kangoo Express 1.6', 2018, 26000, 48000.00, 'Kangoo'),
		   (71, 'Ford Ranger XLS 2.2 Diesel', 'Ford Ranger XLS 2.2 Diesel', 2019, 14000, 75000.00, 'Ranger'),
		   (72, 'Volkswagen Saveiro Robust CS 1.6', 'VW Saveiro Robust CS 1.6', 2020, 8000, 42000.00, 'Saveiro'),
		   (73, 'Chevrolet Montana Sport 1.4', 'Chevrolet Montana Sport 1.4', 2017, 18000, 38000.00, 'Montana'),
		   (74, 'Fiat Fiorino Hard Working 1.4', 'Fiat Fiorino Hard Working 1.4', 2019, 12000, 35000.00, 'Fiorino'),
		   (75, 'Renault Kangoo Express 1.6', 'Renault Kangoo Express 1.6', 2018, 26000, 48000.00, 'Kangoo'),
		   (76, 'Ford Ranger XLS 2.2 Diesel', 'Ford Ranger XLS 2.2 Diesel', 2019, 14000, 75000.00, 'Ranger'),
		   (77, 'Volkswagen Saveiro Robust CS 1.6', 'VW Saveiro Robust CS 1.6', 2020, 8000, 42000.00, 'Saveiro'),
		   (78, 'Chevrolet Montana Sport 1.4', 'Chevrolet Montana Sport 1.4', 2017, 18000, 38000.00, 'Montana'),
		   (79, 'Fiat Fiorino Hard Working 1.4', 'Fiat Fiorino Hard Working 1.4', 2019, 12000, 35000.00, 'Fiorino'),
		   (80, 'Renault Kangoo Express 1.6', 'Renault Kangoo Express 1.6', 2018, 26000, 48000.00, 'Kangoo')
GO

-- Inserir dados na Tabela Manutenção --
INSERT INTO tbManutencao (manutencaoCodigo, carroCodigo, codigoCEP, manutencaoEmpresa, manutencaoEmail, manutencaoContato, manutencaoFone, manutencaoCNPJ) 
	VALUES (1, 1, 1, 'AutoManutenção A', 'contato@automanutencaoa.com', 'Fulano de Tal', '(11) 1234-5678', '12345678901234'),
		   (2, 2, 2, 'Oficina B', 'contato@oficinab.com', 'Ciclano de Tal', '(22) 2345-6789', '23456789012345'),
		   (3, 3, 3, 'Mecânica C', 'contato@mecanicac.com', 'Beltrano de Tal', '(33) 3456-7890', '34567890123456'),
		   (4, 4, 4, 'Manutenção Express', 'contato@manutencaoexpress.com', 'Outro Contato', '(44) 4567-8901', '45678901234567'),
		   (5, 5, 5, 'Car Care Center', 'contato@carcarecenter.com', 'Alguém', '(55) 5678-9012', '56789012345678'),
		   (6, 6, 1, 'Mecânica XYZ', 'contato@mecanicaxyz.com', 'Fulano de Tal', '(11) 1234-5678', '12345678901234'),
		   (7, 7, 2, 'Manutenção 123', 'contato@manutencao123.com', 'Ciclano de Tal', '(22) 2345-6789', '23456789012345'),
		   (8, 8, 3, 'AutoFix', 'contato@autofix.com', 'Beltrano de Tal', '(33) 3456-7890', '34567890123456'),
		   (9, 9, 4, 'Mecânica Rápida', 'contato@mecanicarapida.com', 'Outro Contato', '(44) 4567-8901', '45678901234567'),
		   (10, 10, 5, 'Fix Car', 'contato@fixcar.com', 'Alguém', '(55) 5678-9012', '56789012345678'),
		   (11, 11, 1, 'AutoManutenção B', 'contato@automanutencaob.com', 'Fulano de Tal', '(11) 1234-5678', '12345678901234'),
		   (12, 12, 2, 'Mecânica ABC', 'contato@mecanicaabc.com', 'Ciclano de Tal', '(22) 2345-6789', '23456789012345'),
		   (13, 13, 3, 'Garagem Mecânica', 'contato@garagemmecanica.com', 'Beltrano de Tal', '(33) 3456-7890', '34567890123456'),
		   (14, 14, 4, 'AutoMec', 'contato@automec.com', 'Outro Contato', '(44) 4567-8901', '45678901234567'),
		   (15, 15, 5, 'Mecânica Total', 'contato@mecanicatotal.com', 'Alguém', '(55) 5678-9012', '56789012345678'),
		   (16, 16, 1, 'Carro Novo', 'contato@arrumacarro.com', 'Fulano de Tal', '(11) 1234-5678', '12345678901234'),
		   (17, 17, 2, 'Mecânica Veloz', 'contato@mecanicaveloz.com', 'Ciclano de Tal', '(22) 2345-6789', '23456789012345'),
		   (18, 18, 3, 'Manutenção 24 Horas', 'contato@manutencao24horas.com', 'Beltrano de Tal', '(33) 3456-7890', '34567890123456'),
		   (19, 19, 4, 'Garagem Mecânica', 'contato@garagemmecanica.com', 'Outro Contato', '(44) 4567-8901', '45678901234567'),
		   (20, 20, 5, 'AutoCenter', 'contato@autocenter.com', 'Alguém', '(55) 5678-9012', '56789012345678')
GO

-- Inserir dados na Tabela Vendas --
INSERT INTO tbVendas (funcionarioCodigo, vendaCodigo, clienteCodigo, carroCodigo, vendaData, vendaNumCont, vendaValor) 
	VALUES (1, 1, 1, 1, '01/01/2023', '123456', 40000.00),
		   (2, 2, 2, 2, '02/01/2023', '123457', 35000.00),
		   (3, 3, 3, 3, '03/01/2023', '123458', 55000.00),
		   (4, 4, 4, 4, '04/01/2023', '123459', 32000.00),
		   (5, 5, 5, 5, '05/01/2023', '123460', 30000.00),
		   (6, 6, 6, 6, '06/01/2023', '123461', 36000.00),
		   (7, 7, 7, 7, '07/01/2023', '123462', 42000.00),
		   (8, 8, 8, 8, '08/01/2023', '123463', 40000.00),
		   (9, 9, 9, 9, '09/01/2023', '123464', 33000.00),
		   (10, 10, 10, 10, '10/01/2023', '123465', 38000.00),
		   (11, 11, 11, 11, '11/01/2023', '123466', 60000.00),
		   (12, 12, 12, 12, '12/01/2023', '123467', 36000.00),
		   (13, 13, 13, 13, '13/01/2023', '123468', 42000.00),
		   (14, 14, 14, 14, '14/01/2023', '123469', 48000.00),
		   (15, 15, 15, 15, '15/01/2023', '123470', 55000.00),
		   (1, 16, 16, 16, '16/01/2023', '123471', 80000.00),
		   (2, 17, 17, 17, '17/01/2023', '123472', 52000.00),
		   (3, 18, 18, 18, '18/01/2023', '123473', 100000.00),
		   (4, 19, 19, 19, '19/01/2023', '123474', 70000.00),
		   (5, 20, 20, 20, '20/01/2023', '123475', 90000.00),
		   (6, 21, 21, 21, '21/01/2023', '123476', 150000.00),
		   (7, 22, 22, 22, '22/01/2023', '123477', 130000.00),
		   (8, 23, 23, 23, '23/01/2023', '123478', 170000.00),
		   (9, 24, 24, 24, '24/01/2023', '123479', 55000.00),
		   (10, 25, 25, 25, '25/01/2023', '123480', 30000.00),
		   (11, 26, 26, 26, '26/01/2023', '123481', 90000.00),
		   (12, 27, 27, 27, '27/01/2023', '123482', 70000.00),
		   (13, 28, 28, 28, '28/01/2023', '123483', 80000.00),
		   (14, 29, 29, 29, '29/01/2023', '123484', 45000.00),
		   (15, 30, 30, 30, '30/01/2023', '123485', 60000.00),
		   (1, 31, 31, 31, '31/01/2023', '123486', 70000.00),
		   (2, 32, 32, 32, '01/02/2023', '123487', 65000.00),
		   (3, 33, 33, 33, '02/02/2023', '123488', 85000.00),
		   (4, 34, 34, 34, '03/02/2023', '123489', 35000.00),
		   (5, 35, 35, 35, '04/02/2023', '123490', 50000.00),
		   (6, 36, 36, 36, '05/02/2023', '123491', 42000.00),
		   (7, 37, 37, 37, '06/02/2023', '123492', 38000.00),
		   (8, 38, 38, 38, '07/02/2023', '123493', 35000.00),
		   (9, 39, 39, 39, '08/02/2023', '123494', 48000.00),
		   (10, 40, 40, 40, '09/02/2023', '123495', 48000.00),
		   (11, 41, 1, 41, '10/02/2023', '123496', 110000.00),
		   (12, 42, 2, 42, '11/02/2023', '123497', 95000.00),
		   (13, 43, 3, 43, '12/02/2023', '123498', 130000.00),
		   (14, 44, 4, 44, '13/02/2023', '123499', 55000.00),
		   (15, 45, 5, 45, '14/02/2023', '123410', 30000.00),
		   (1, 46, 6, 46, '15/02/2023', '123411', 90000.00),
		   (2, 47, 7, 47, '16/02/2023', '123412', 70000.00),
		   (3, 48, 8, 48, '17/02/2023', '123413', 80000.00),
		   (4, 49, 9, 49, '18/02/2023', '123414', 45000.00),
		   (5, 50, 10, 50, '19/02/2023', '123415', 60000.00),
		   (6, 51, 11, 51, '20/02/2023', '123416', 70000.00),
		   (7, 52, 12, 52, '21/02/2023', '123417', 65000.00),
		   (8, 53, 13, 53, '22/02/2023', '123418', 85000.00),
		   (9, 54, 14, 54, '23/02/2023', '123419', 35000.00),
		   (10, 55, 15, 55, '24/02/2023', '123420', 50000.00),
		   (11, 56, 16, 56, '25/02/2023', '123421', 42000.00),
		   (12, 57, 17, 57, '26/02/2023', '123422', 38000.00),
		   (13, 58, 18, 58, '27/02/2023', '123423', 35000.00),
		   (14, 59, 19, 59, '28/02/2023', '123424', 48000.00),
		   (15, 60, 20, 60, '01/03/2023', '123425', 48000.00)
GO

-- Inserir dados na Tabela Pendência --
INSERT INTO tbPendencia (pendenciaCodigo, funcionarioCodigo, vendaCodigo, manutencaoCodigo, pendenciaPaga, valorPendencia, qtnParcelasPendentes, vendaPago, vendaDtPagto, tipoPendencia) 
	VALUES (1, 11, 11, 1, 0, 500.00, 3, 0, '21-12-2021', 1/*'Atraso no pagamento'*/),
		   (2, 2, 32, 2, 1, 300.00, 2, 1, '01-03-2022', 2/*'Multa por atraso'*/),
		   (3, 8, 53, 3, 0, 700.00, 4, 0, '09-04-2020', 1/*'Atraso no pagamento'*/),
		   (4, 11, 26, 4, 0, 450.00, 1, 0, '27-03-2024', 3/*'Avaria no veículo'*/),
		   (5, 5, 50, 5, 1, 600.00, 3, 1, '02-03-2023', 2/*'Multa por atraso'*/)
GO