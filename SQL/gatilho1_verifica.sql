.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;


.print ''
.print 'Preço da encomenda: '

INSERT INTO Encomenda(
                      idEncomenda,
                      NIF,
                      idLoja,
                      data,
                      metodoPagamento,
                      idTransportadora,
                      preçoFinal)
               VALUES(10,
                      913453454,
                      1,
                      '2016-04-17 12:17:26',
                      'Dinheiro',
                      2,
                      0)
;

SELECT idEncomenda AS 'ID da Encomenda', preçoFinal AS 'Preco Final da Encomenda' 
  FROM Encomenda WHERE idEncomenda = 10;

.print ''
.print 'Preço da encomenda após adicao da taxa de transporte: '

INSERT INTO Transportadora(
                               idTransportadora,
                               nome,
                               telefone,
                               preço
                           )
                           VALUES (
                               2,
                               'TNT',
                               242465782,
                               4.0
                           );

SELECT idEncomenda AS 'ID da Encomenda', preçoFinal AS 'Preco Final da Encomenda' 
  FROM Encomenda WHERE idEncomenda = 10;