.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print ''
.print 'Preço da encomenda:'

INSERT INTO Encomenda(
                      idEncomenda,
                      NIF,
                      idLoja,
                      preçoFinal)
               VALUES(300,
                      856123909,
                      1,
                      0)
;

SELECT idEncomenda AS 'ID da Encomenda', preçoFinal AS 'Preco da Encomenda' 
  FROM Encomenda WHERE idEncomenda = 300;

.print ''
.print 'Preço da encomenda após adicao do produto Manteiga com quantidade 4 e preço 1.25:'

INSERT INTO QuantidadePedida(
                             codigoBarras,
                             idEncomenda,
                             quantidade)
                      VALUES(
                             12316,
                             300,
                             4)
;

SELECT idEncomenda AS 'ID da Encomenda', preçoFinal AS 'Preco da Encomenda' 
  FROM Encomenda WHERE idEncomenda = 300;

.print ''
.print ''