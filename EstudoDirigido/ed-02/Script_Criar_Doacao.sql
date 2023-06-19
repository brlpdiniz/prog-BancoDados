CREATE DATABASE Meu_Banco;

USE Meu_Banco;

CREATE TABLE Usuario (
    Id_Usuario Int PRIMARY KEY,
    Endereco Varchar(100),
    Telefone Varchar(11),
    Email Varchar(50),
    Tipo Varchar(11),
    Senha Int
);

CREATE TABLE NecessidadeDoacao (
    Id_Necessidade Varchar(11) PRIMARY KEY,
    Id_Usuario int,
    Data Date,
    NomeAnimal Varchar(10),
    Id_TipoDoacao Varchar(10),
    Quantidade int
);

CREATE TABLE TipoDoacao (
    Id_TipoDoacao Varchar(11) PRIMARY KEY,
    Descricao Varchar(11)
);

CREATE TABLE Coleta (
    Id_Doacao int,
    Id_Necessidade Varchar(10),
    Id_Usuario int,
    DataColeta Date,
    DataEntrega Date
);

CREATE TABLE Doacao (
    Id_Doacao int PRIMARY KEY,
    Id_Usuario int,
    Data Date,
    Id_TipoDoacao Varchar(11),
    Quantidade int
);
 
ALTER TABLE NecessidadeDoacao ADD CONSTRAINT FK_NecessidadeDoacao_Usuario
    FOREIGN KEY (Id_Usuario)
    REFERENCES Usuario (Id_Usuario);

ALTER TABLE NecessidadeDoacao ADD CONSTRAINT FK_NecessidadeDoacao_TipoDoacao
    FOREIGN KEY (Id_TipoDoacao)
    REFERENCES TipoDoacao (Id_TipoDoacao);

ALTER TABLE Coleta ADD CONSTRAINT FK_Coleta_Doacao
    FOREIGN KEY (Id_Doacao)
    REFERENCES Doacao (Id_Doacao);

ALTER TABLE Coleta ADD CONSTRAINT FK_Id_Usuario
    FOREIGN KEY (Id_Usuario)
    REFERENCES  Usuario (Id_Usuario);

ALTER TABLE Coleta ADD CONSTRAINT FK_NecessidadeDoacao
    FOREIGN KEY (Id_Necessidade)
    REFERENCES NecessidadeDoacao (Id_Necessidade);

ALTER TABLE Doacao ADD CONSTRAINT FK_Doacao_Usuario
    FOREIGN KEY (Id_Usuario)
    REFERENCES Usuario (Id_Usuario);

ALTER TABLE Doacao ADD CONSTRAINT FK_Doacao_TipoDoacao
    FOREIGN KEY (Id_TipoDoacao)
    REFERENCES TipoDoacao (Id_TipoDoacao);