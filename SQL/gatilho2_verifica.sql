.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;


.print ''
.print 'Preço da encomenda:'

INSERT INTO Encomenda(
                      idEncomenda,
                      NIF,
                      idLoja,
                      data,
                      metodoPagamento,
                      idTransportadora,
                      preçoFinal)
               VALUES(300,
                      856123909,
                      1,
                      DEFAULT,
                      'Dinheiro',
                      NULL,
                      0)
;

SELECT idEncomenda AS 'ID da Encomenda', preçoFinal AS 'Preco Final da Encomenda' 
  FROM Encomenda WHERE idEncomenda = 300;

.print ''
.print 'Preço da encomenda após adicao do produto Manteiga com quantidade 4:'

INSERT INTO QuantidadePedida(
                             codigoBarras,
                             idEncomenda,
                             quantidade)
                      VALUES(
                             12316,
                             300,
                             4)
;

SELECT idEncomenda AS 'ID da Encomenda', preçoFinal AS 'Preco Final da Encomenda' 
  FROM Encomenda WHERE idEncomenda = 300;

