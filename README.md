<h1> Atividade 1: SQL Server </h1>

O código a seguir são comandos DDL em SQL server para a criação de 4 tabelas em um banco de dados. As tabelas são: Cliente, Apolice, Carro e Sinistro.


<h2> Cliente </h2>

A tabela Cliente contém informações sobre os clientes de uma seguradora. A chave primaria "CodCliente" indentifica de forma única cada cliente e também armazena outras informações pessoais como: Nome, CPF, Sexo, Estado, Cidade, Bairro, Numero, Rua, TelefoneFixo e TelefoneCelular. 

```
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
```

<h2>Carro</h2>

A tabela "Carro" contém informações sobre os carros dos clientes da seguradora. Cada carro é identificado pela chave primaria "CodCarro". Além disso, a tabela possui outras colunas, como Placa, Marca, Modelo, Ano, Chassi e Cor, que armazenam informações sobre o carro de cada cliente.

```
CREATE TABLE Carro {
    CodCarro INT PRIMARY KEY,
    Placa VARCHAR(45),
    Marca VARCHAR(45),
    Modelo VARCHAR(45),
    Ano VARCHAR(45),
    Chassi VARCHAR(45),
    Cor VARCHAR(45),
}
```
<h2> Apolice </h2>

A tabela Apolice armazena informações sobre as apólices de seguro dos clientes. Cada apólice é identificada por uma chave primaria "CodApolice". Além disso, a tabela possui outras colunas, como "ValorCobertura", "ValorFranquia", "DataInicioVigencia", "DataFimVigencia", "Cliente_CodCliente" e "Carro_CodCarro", que armazenam informações sobre a cobertura do seguro.

```
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
```
<h2> Sinistro </h2>

A tabela Sinistro armazena informações sobre os sinistros dos carros dos clientes. Cada sinistro é identificado por uma chave primaria de nome "CodSinistro". Além disso, a tabela possui outras colunas, como HoraSinistro, DataSinistro, LocalSinistro, Condutor e Carro_CodCarro, que armazenam informações sobre o horário, data, local, condutor e qual carro está envolvido em cada sinistro. 

```
CREATE TABLE Sinistro {
    CodSinistro INT,
    HoraSinistro INT,
    DataSinistro DATE,
    LocalSinistro VARCHAR(45),
    Condutor VARCHAR(45),

    CONSTRAINT pk_sinistro PRIMARY KEY(CodSinistro, CodCarro),
    CONSTRAINT fk_codcarro FOREIGN KEY(CodCarro) REFERENCES Carro(CodCarro),

}

```


