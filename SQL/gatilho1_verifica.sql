.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Cliente NIF = 969762934:'

SELECT NIF, morada AS 'Morada' FROM Pessoa
WHERE NIF = 969762934;

.print ''
.print 'Preço da nova encomenda com ID da Transportadora = 2:'

INSERT INTO Encomenda(idEncomenda, NIF, idLoja, idTransportadora, preçoFinal) VALUES(10, 969762934, 1, 2, 0);

SELECT idEncomenda AS 'ID da Encomenda', NIF, preçoFinal AS 'Preco Final da Encomenda' 
  FROM Encomenda WHERE idEncomenda = 10;

.print ''
.print 'Preço da transportadora:'

SELECT idTransportadora AS 'ID da Transportadora', preço AS 'Preço' 
  FROM Transportadora WHERE idTransportadora = 2;

.print ''
.print 'Novo Tuplo em Entrega:'

SELECT idTransportadora AS 'ID da Transportadora', idEncomenda AS 'ID da Encomenda',
        morada AS 'Morada da Entrega'
FROM Entrega WHERE idEncomenda = 10;

