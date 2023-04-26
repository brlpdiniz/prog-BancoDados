USE master
CREATE DATABASE CarteiraVirtual
GO

USE CarteiraVirtual
GO

CREATE SCHEMA Wallet
GO

CREATE TABLE Wallet.Moeda (
	CodigoMoeda VARCHAR(3) PRIMARY KEY,
	Nome VARCHAR(100),
);
GO

CREATE TABLE Wallet.Cliente (
	CodigoCliente INT PRIMARY KEY,
	Nome VARCHAR(100),
	Email VARCHAR(50),
	Celular VARCHAR(13),
	PassHash VARCHAR(100)
);
GO

CREATE TABLE Wallet.Carteira (
	Endereco VARCHAR(50) PRIMARY KEY,
	CodigoCorretora INT,
	CodigoCliente INT,
);
GO

CREATE TABLE Wallet.ParesMoedas (
	CodigoMoedaBase VARCHAR(3),
	CodigoMoedaCotacao VARCHAR(3),
	Valor FLOAT,	-- o float eh double
	PRIMARY KEY (CodigoMoedaBase, CodigoMoedaCotacao),
	CONSTRAINT FK_CodigoMoedaBase FOREIGN KEY (CodigoMoedaBase) REFERENCES Wallet.Moeda(CodigoMoeda),
	CONSTRAINT FK_CodigoMoedaCotacao FOREIGN KEY (CodigoMoedaCotacao) REFERENCES Wallet.Moeda(CodigoMoeda)
);
GO

CREATE TABLE Wallet.ItemCarteira (
	CodigoItemCarteira INT PRIMARY KEY,
	Endereco VARCHAR(50),
	CodigoMoeda VARCHAR(3),
	Quantidade FLOAT,
	CONSTRAINT FK_Endereco FOREIGN KEY (Endereco) REFERENCES Wallet.Carteira(Endereco),
	CONSTRAINT FK_CodigoMoeda FOREIGN KEY (CodigoMoeda) REFERENCES Wallet.Moeda(CodigoMoeda)
);
GO

CREATE TABLE Wallet.Corretora (
	CodigoCorretora INT PRIMARY KEY,
	Nome VARCHAR(100)
);
GO

INSERT INTO Wallet.Moeda(CodigoMoeda, Nome)
	VALUES ('BTC','Bitcoin');
GO

INSERT INTO Wallet.Moeda(CodigoMoeda, Nome)
	VALUES ('ETH','Ethereum');
GO

INSERT INTO Wallet.Moeda(CodigoMoeda, Nome)
	VALUES ('LTC','Litecoin');
GO

INSERT INTO Wallet.Moeda(CodigoMoeda, Nome)
	VALUES ('USD', 'United States Dolar');
GO

INSERT INTO Wallet.ParesMoedas(CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('BTC', 'USD', 9073.51);
GO
INSERT INTO Wallet.ParesMoedas(CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('ETH', 'USD', 576.52);
GO
INSERT INTO Wallet.ParesMoedas(CodigoMoedaBase, CodigoMoedaCotacao, Valor)	VALUES ('LTC', 'USD', 173.39);
GO

ALTER TABLE Wallet.Carteira ADD CONSTRAINT FK_CodigoCliente
	FOREIGN KEY (CodigoCliente) REFERENCES Wallet.Cliente(CodigoCliente);
GO

ALTER TABLE Wallet.Carteira ADD CONSTRAINT FK_CodigoCorretora
	FOREIGN KEY (CodigoCorretora) REFERENCES Wallet.Corretora(CodigoCorretora);
GO

CREATE INDEX indice_CodigoMoedaBase
	ON Wallet.ParesMoedas(CodigoMoedaBase);
GO

CREATE INDEX indice_Quantidade
	ON Wallet.ItemCarteira(Quantidade);
GO


	-- COMANDOS PARA DEBUG --
	
-- SELECT * FROM sys.schemas
-- SELECT * FROM Wallet.Carteira;
-- SELECT * FROM Wallet.Cliente;
-- SELECT * FROM Wallet.Moeda;
-- SELECT * FROM Wallet.ParesMoedas;
-- SELECT * FROM Wallet.ItemCarteira;
-- SELECT * FROM Wallet.Corretora;