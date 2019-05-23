--
-- File generated with SQLiteStudio v3.2.1 on Sun Apr 14 20:09:35 2019
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = on;
BEGIN TRANSACTION;

-- Table: Bebidas
DROP TABLE IF EXISTS Bebidas;

CREATE TABLE Bebidas (
    codigoBarras INTEGER REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         PRIMARY KEY
                         NOT NULL,
    quantidade   INT     DEFAULT (330) 
                         CHECK (quantidade > 0) 
                         NOT NULL,
    tipo         STRING  DEFAULT ('Alcoolica') 
                         CHECK (tipo = 'Agua' OR 
                                tipo = 'Alcoolica' OR 
                                tipo = 'Sumo' OR 
                                tipo = 'Refrigerante') 
                         NOT NULL,
    tamanhoPack  INT     DEFAULT (1) 
                         CHECK (tamanhoPack > 0 AND 
                                tamanhoPack <= 32) 
);


-- Table: Charcutaria
DROP TABLE IF EXISTS Charcutaria;

CREATE TABLE Charcutaria (
    codigoBarras INT     PRIMARY KEY
                         REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         NOT NULL
                         DEFAULT (1),
    tipoCarne    STRING  NOT NULL
                         CHECK (tipoCarne = 'Branca' OR 
                                tipoCarne = 'Vermelha'),
    peso         INTEGER CHECK (peso > 0) 
                         DEFAULT (100) 
                         NOT NULL,
    embalado     BOOLEAN DEFAULT [no]
                         NOT NULL
);


-- Table: Cliente
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    NIF   INT    REFERENCES Pessoa (NIF) ON DELETE CASCADE
                                         ON UPDATE CASCADE
                 PRIMARY KEY
                 NOT NULL,
    email STRING CHECK (email LIKE '%@%.%') 
                 UNIQUE
);


-- Table: Encomenda
DROP TABLE IF EXISTS Encomenda;

CREATE TABLE Encomenda (
    idEncomenda      INTEGER  PRIMARY KEY ASC AUTOINCREMENT
                              CHECK (idEncomenda > 0),
    NIF              INTEGER  REFERENCES Cliente (NIF) ON DELETE CASCADE
                                                       ON UPDATE CASCADE
                              NOT NULL,
    idLoja           INTEGER  REFERENCES Loja (idLoja) ON DELETE CASCADE
                                                       ON UPDATE CASCADE
                              NOT NULL,
    data             DATETIME NOT NULL
                              DEFAULT (datetime('now') ),
    metodoPagamento  STRING   CHECK (metodoPagamento = 'Dinheiro' OR 
                                     metodoPagamento = 'Multibanco' OR 
                                     metodoPagamento = 'PayPal') 
                              DEFAULT Dinheiro
                              NOT NULL,
    idTransportadora INTEGER  REFERENCES Transportadora (idTransportadora) ON DELETE SET DEFAULT
                                                                           ON UPDATE SET DEFAULT,
    preçoFinal       REAL (2) NOT NULL
                              CHECK (preçoFinal > 0) 
                              DEFAULT (1) 
);


-- Table: Entrega
DROP TABLE IF EXISTS Entrega;

CREATE TABLE Entrega (
    idTransportadora INTEGER REFERENCES Transportadora (idTransportadora) ON DELETE CASCADE
                                                                          ON UPDATE CASCADE
                             NOT NULL,
    idEncomenda      INTEGER REFERENCES Encomenda (idEncomenda) ON DELETE CASCADE
                                                                ON UPDATE CASCADE
                             UNIQUE,
    morada           STRING  NOT NULL,
    PRIMARY KEY (
        idTransportadora,
        idEncomenda ASC
    )
);


-- Table: Funcionario
DROP TABLE IF EXISTS Funcionario;

CREATE TABLE Funcionario (
    NIF        INT     REFERENCES Pessoa (NIF) ON DELETE CASCADE
                                               ON UPDATE CASCADE
                       NOT NULL
                       PRIMARY KEY,
    disponivel BOOLEAN DEFAULT [no]
                       NOT NULL
);


-- Table: Lacticionios
DROP TABLE IF EXISTS Lacticionios;

CREATE TABLE Lacticionios (
    codigoBarras INTEGER  PRIMARY KEY
                         REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         NOT NULL,
    tamanhoPack  INTEGER NOT NULL
                         DEFAULT (1) 
                         CHECK (tamanhoPack > 0),
    quantidade   INTEGER CHECK (quantidade > 0) 
                         NOT NULL
                         DEFAULT (100),
    lactose      BOOLEAN NOT NULL
                         DEFAULT [yes]
);


-- Table: Limpeza
DROP TABLE IF EXISTS Limpeza;

CREATE TABLE Limpeza (
    codigoBarras INTEGER REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         PRIMARY KEY
                         NOT NULL,
    tamanhoPack  INTEGER CHECK (tamanhoPack > 0) 
                         DEFAULT (1) 
                         NOT NULL,
    peso         INTEGER CHECK (peso > 0) 
                         NOT NULL
                         DEFAULT (100) 
);


-- Table: Loja
DROP TABLE IF EXISTS Loja;

CREATE TABLE Loja (
    idLoja   INTEGER PRIMARY KEY ASC AUTOINCREMENT
                     DEFAULT (1) 
                     NOT NULL,
    nome     STRING  DEFAULT MIEICado
                     CHECK (nome LIKE '%MIEICado%'),
    morada   STRING  NOT NULL,
    telefone INTEGER CHECK (telefone > 0 AND 
                            telefone < 1000000000) 
                     DEFAULT (252598694) 
);


-- Table: Pessoa
DROP TABLE IF EXISTS Pessoa;

CREATE TABLE Pessoa (
    NIF       INT    PRIMARY KEY
                     CHECK (NIF >= 0 AND 
                            NIF <= 999999999) 
                     NOT NULL
                     UNIQUE,
    nome      STRING NOT NULL,
    morada    STRING,
    telemovel INT    CHECK (telemovel > 0 AND 
                            telemovel < 1000000000) 
                     UNIQUE
                     NOT NULL
);


-- Table: Produto
DROP TABLE IF EXISTS Produto;

CREATE TABLE Produto (
    codigoBarras INTEGER     NOT NULL
                             PRIMARY KEY AUTOINCREMENT
                             CHECK (codigoBarras > 0) 
                             DEFAULT (1),
    nome         STRING      NOT NULL,
    marca        STRING,
    preço        REAL (2, 2) CHECK (preço > 0) 
                             DEFAULT (1) 
                             NOT NULL,
    desconto     REAL        CHECK (desconto >= 0 AND 
                                    desconto <= 100) 
                             DEFAULT (0) 
                             NOT NULL
);


-- Table: QuantidadePedida
DROP TABLE IF EXISTS QuantidadePedida;

CREATE TABLE QuantidadePedida (
    codigoBarras INTEGER REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         NOT NULL,
    idEncomenda  INTEGER REFERENCES Encomenda (idEncomenda) ON DELETE CASCADE
                                                            ON UPDATE CASCADE
                         NOT NULL,
    quantidade   INTEGER NOT NULL
                         DEFAULT (1) 
                         CHECK (quantidade > 0),
    PRIMARY KEY (
        codigoBarras,
        idEncomenda ASC
    )
);


-- Table: Stock
DROP TABLE IF EXISTS Stock;

CREATE TABLE Stock (
    codigoBarras INTEGER REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         NOT NULL,
    idLoja       INTEGER REFERENCES Loja (idLoja) ON DELETE CASCADE
                                                  ON UPDATE RESTRICT
                         NOT NULL,
    stock        INTEGER DEFAULT (1) 
                         CHECK (stock >= 0) 
                         NOT NULL,
    PRIMARY KEY (
        codigoBarras,
        idLoja ASC
    )
);


-- Table: Suporte
DROP TABLE IF EXISTS Suporte;

CREATE TABLE Suporte (
    idPedido       INTEGER  PRIMARY KEY AUTOINCREMENT
                            NOT NULL,
    data           DATETIME NOT NULL
                            DEFAULT (datetime('now') ),
    funcionarioNIF INT      REFERENCES Funcionario (NIF) ON DELETE CASCADE
                                                         ON UPDATE CASCADE,
    clienteNIF     INT      REFERENCES Cliente (NIF) ON DELETE CASCADE
                                                     ON UPDATE CASCADE
                            NOT NULL
);


-- Table: Transportadora
DROP TABLE IF EXISTS Transportadora;

CREATE TABLE Transportadora (
    idTransportadora INTEGER PRIMARY KEY AUTOINCREMENT
                             CHECK (idTransportadora > 0) 
                             NOT NULL,
    nome             STRING  NOT NULL,
    telefone         INTEGER UNIQUE
                             NOT NULL
                             CHECK (telefone > 0 AND 
                                    telefone < 1000000000),
    preço            REAL    NOT NULL
                             DEFAULT (0) 
                             CHECK (preço >= 0) 
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
