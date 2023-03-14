CREATE DATABASE Seguradora_de_Veiculos

USE Seguradora_de_Veiculos





CREATE TABLE Cliente {
    CodCliente INT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    CPF VARCHAR(45) NOT NULL UNIQUE,
    Sexo VARCHAR(45),
    Estado VARCHAR(45),
    Cidade VARCHAR(45) DEFAULT 'Itapira',
    Bairro VARCHAR(45),
    Numero VARCHAR(45)  UNIQUE,
    Rua VARCHAR(45),
    TelefoneFixo VARCHAR NOT NULL(45),
    TelefoneCelular VARCHAR NOT NULL(45),

}


CREATE TABLE Carro {
    CodCarro INT PRIMARY KEY,
    Placa VARCHAR(45),
    Marca VARCHAR(45),
    Modelo VARCHAR(45),
    Ano VARCHAR(45),
    Chassi VARCHAR(45),
    Cor VARCHAR(45),
}


CREATE TABLE Apolice {
    CodApolice INT PRIMARY KEY NOT NULL,
    ValorCobertura DECIMAL NOT NULL,
    ValorFranquia DECIMAL NOT NULL,
    DataInicioVigencia DATE NOT NULL CHECK (DataInicioVigencia >= GETDATE()),
    DataFimVigencia DATE NOT NULL ,
    CodCliente INT,
    CodCarro INT,
    CONSTRAINT fk_cliente FOREIGN KEY (CodCliente) REFERENCES Cliente(CodCliente),
    CONSTRAINT fk_carro FOREIGN KEY (CodCarro) REFERENCES Carro(CodCarro),

}


CREATE TABLE Sinistro {
    CodSinistro INT,
    HoraSinistro INT,
    DataSinistro DATE,
    LocalSinistro VARCHAR(45),
    Condutor VARCHAR(45),

    CONSTRAINT pk_sinistro PRIMARY KEY(CodSinistro, CodCarro),
    CONSTRAINT fk_codcarro FOREIGN KEY(CodCarro) REFERENCES Carro(CodCarro),

}











