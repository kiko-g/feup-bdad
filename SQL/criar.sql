.mode	columns
.headers	on
.nullvalue	NULL

--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = on;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS Suporte;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS QuantidadePedida;
DROP TABLE IF EXISTS Entrega;
DROP TABLE IF EXISTS Charcutaria;
DROP TABLE IF EXISTS Bebidas;
DROP TABLE IF EXISTS Lacticinios;
DROP TABLE IF EXISTS Limpeza;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Transportadora;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Encomenda;
DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Loja;


-- Table: Loja
CREATE TABLE Loja (
    idLoja   INTEGER PRIMARY KEY ASC AUTOINCREMENT
                     DEFAULT (1) 
                     NOT NULL,
    nome     STRING  DEFAULT MIEICado
                     CONSTRAINT conter_MIEICado CHECK (nome LIKE '%MIEICado%'),
    morada   STRING  NOT NULL,
    telefone INTEGER CONSTRAINT telefone_maior_zero_menor_max CHECK (telefone > 0 AND 
                                                                     telefone < 1000000000) 
                     DEFAULT (252598694) 
);

-- Table: Pessoa
CREATE TABLE Pessoa (
    NIF       INT    PRIMARY KEY
                     CONSTRAINT intervalo_NIF CHECK (NIF >= 0 AND 
                                                     NIF <= 999999999) 
                     NOT NULL
                     UNIQUE,
    nome      STRING NOT NULL,
    morada    STRING,
    telemovel INT    CONSTRAINT telemovel_maior_zero_menor_max CHECK (telemovel > 0 AND 
                                                                      telemovel < 1000000000) 
                     UNIQUE
                     NOT NULL
);

-- Table: Encomenda
CREATE TABLE Encomenda (
    idEncomenda      INTEGER  PRIMARY KEY ASC AUTOINCREMENT
                              CONSTRAINT id_maior_zero CHECK (idEncomenda > 0),
    NIF              INTEGER  REFERENCES Cliente (NIF) ON DELETE CASCADE
                                                       ON UPDATE CASCADE
                              NOT NULL,
    idLoja           INTEGER  REFERENCES Loja (idLoja) ON DELETE CASCADE
                                                       ON UPDATE CASCADE
                              NOT NULL,
    data             DATETIME NOT NULL
                              DEFAULT (datetime('now') ),
    metodoPagamento  INTEGER  NOT NULL
                              DEFAULT (0) 
                              CONSTRAINT metodoPagamento_tipo CHECK (metodoPagamento >= 0 AND 
                                                                     metodoPagamento <= 2),
    idTransportadora INTEGER  REFERENCES Transportadora (idTransportadora) ON DELETE SET DEFAULT
                                                                           ON UPDATE SET DEFAULT,
    preçoFinal       REAL (2) NOT NULL
                              CONSTRAINT preçoFinal_positivo CHECK (preçoFinal >= 0) 
                              DEFAULT (0) 
);

-- Table: Produto
CREATE TABLE Produto (
    codigoBarras INTEGER     NOT NULL
                             PRIMARY KEY AUTOINCREMENT
                             CONSTRAINT codigoBarras_positivo CHECK (codigoBarras > 0) 
                             DEFAULT (1),
    nome         STRING      NOT NULL,
    marca        STRING,
    preço        REAL (2, 2) CONSTRAINT preço_positivo CHECK (preço > 0) 
                             DEFAULT (1) 
                             NOT NULL,
    desconto     REAL        CONSTRAINT desconto_positivo_menor_cem CHECK (desconto >= 0 AND 
                                                                           desconto <= 100) 
                             DEFAULT (0) 
                             NOT NULL
);

-- Table: Transportadora
CREATE TABLE Transportadora (
    idTransportadora INTEGER PRIMARY KEY AUTOINCREMENT
                             CONSTRAINT id_maior_zero CHECK (idTransportadora > 0) 
                             NOT NULL,
    nome             STRING  NOT NULL,
    telefone         INTEGER UNIQUE
                             NOT NULL
                             CONSTRAINT telefone_maior_zero_menor_max CHECK (telefone > 0 AND 
                                                                             telefone < 1000000000),
    preço            REAL    NOT NULL
                             DEFAULT (0) 
                             CONSTRAINT preço_positivo CHECK (preço >= 0) 
);

-- Table: Bebidas
CREATE TABLE Bebidas (
    codigoBarras INTEGER REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         PRIMARY KEY
                         NOT NULL,
    quantidade   INT     DEFAULT (0) 
                         CHECK (quantidade > 0) 
                         NOT NULL,
    tipo         INTEGER DEFAULT (3) 
                         NOT NULL
                         CHECK (tipo >= 0 AND 
                                tipo <= 3),
    tamanhoPack  INT     DEFAULT (1) 
                         CHECK (tamanhoPack > 0 AND 
                                tamanhoPack <= 32) 
);

-- Table: Charcutaria
CREATE TABLE Charcutaria (
    codigoBarras INT     PRIMARY KEY
                         REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         NOT NULL
                         DEFAULT (1),
    tipoCarne    INTEGER DEFAULT (0) 
                         NOT NULL
                         CHECK (tipoCarne >= 0 AND 
                                tipoCarne <= 1),
    peso         INTEGER CHECK (peso > 0) 
                         DEFAULT (100) 
                         NOT NULL,
    embalado     BOOLEAN DEFAULT [no]
                         NOT NULL
);

-- Table: Cliente
CREATE TABLE Cliente (
    NIF   INT    REFERENCES Pessoa (NIF) ON DELETE CASCADE
                                         ON UPDATE CASCADE
                 PRIMARY KEY
                 NOT NULL,
    email STRING CONSTRAINT email_with_at CHECK (email LIKE '%@%.%') 
                 UNIQUE
);

-- Table: Entrega
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
CREATE TABLE Funcionario(
    NIF INTEGER REFERENCES Pessoa (NIF) ON DELETE CASCADE
                                               ON UPDATE CASCADE
                       NOT NULL
                       PRIMARY KEY,
    disponivel BOOLEAN DEFAULT false
                       NOT NULL

-- possivel conflito "near line 173"
-- default (false) 
-- versus                   
-- default false
);

-- Table: Lacticinios
CREATE TABLE Lacticinios (
    codigoBarras INTEGER PRIMARY KEY
                         REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         NOT NULL,
    tamanhoPack  INTEGER NOT NULL
                         DEFAULT (1) 
                         CONSTRAINT tamanhoPack_maior_zero CHECK (tamanhoPack > 0),
    quantidade   INTEGER CONSTRAINT quantidade_maior_zero CHECK (quantidade > 0) 
                         NOT NULL
                         DEFAULT (100),
    lactose      BOOLEAN NOT NULL
                         DEFAULT yes
);

-- Table: Limpeza
CREATE TABLE Limpeza (
    codigoBarras INTEGER REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         PRIMARY KEY
                         NOT NULL,
    tamanhoPack  INTEGER CONSTRAINT tamanho_maior_zero CHECK (tamanhoPack > 0) 
                         DEFAULT (1) 
                         NOT NULL,
    peso         INTEGER CONSTRAINT peso_maior_zero CHECK (peso > 0) 
                         NOT NULL
                         DEFAULT (100) 
);

-- Table: QuantidadePedida
CREATE TABLE QuantidadePedida (
    codigoBarras INTEGER REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         NOT NULL,
    idEncomenda  INTEGER REFERENCES Encomenda (idEncomenda) ON DELETE CASCADE
                                                            ON UPDATE CASCADE
                         NOT NULL,
    quantidade   INTEGER NOT NULL
                         DEFAULT (0) 
                         CONSTRAINT quantidade_positiva CHECK (quantidade > 0),
    PRIMARY KEY (
        codigoBarras,
        idEncomenda ASC
    )
);

-- Table: Stock
CREATE TABLE Stock (
    codigoBarras INTEGER REFERENCES Produto (codigoBarras) ON DELETE CASCADE
                                                           ON UPDATE CASCADE
                         NOT NULL,
    idLoja       INTEGER REFERENCES Loja (idLoja) ON DELETE CASCADE
                                                  ON UPDATE RESTRICT
                         NOT NULL,
    stock        INTEGER DEFAULT (0) 
                         CONSTRAINT stock_positiva CHECK (stock >= 0) 
                         NOT NULL,
    PRIMARY KEY (
        codigoBarras,
        idLoja ASC
    )
);

-- Table: Suporte
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

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;