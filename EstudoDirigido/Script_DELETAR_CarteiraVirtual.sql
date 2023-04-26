USE CarteiraVirtual
GO

-- DROP nas tabelas
DROP TABLE Wallet.ParesMoedas
DROP TABLE Wallet.ItemCarteira
DROP TABLE Wallet.Moeda
DROP TABLE Wallet.Carteira
DROP TABLE Wallet.Cliente
DROP TABLE Wallet.Corretora
DROP TABLE Wallet.IntegrantesGrupo
GO

-- DROP no schema
DROP SCHEMA Wallet
GO

-- DROP no banco criado
USE MASTER
DROP DATABASE CarteiraVirtual
GO