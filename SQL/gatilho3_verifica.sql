.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print 'Estado do Stock:'

SELECT Stock.idLoja AS 'ID da Loja', Stock.codigoBarras AS 'Codigo de Barras', 
        Stock.stock AS 'Quantidade em Stock' 
FROM Stock; 

.print ''
.print 'Apos adicionar o produto com codigo de barras 123187529 aos Produtos:'

INSERT INTO Produto(
                    codigoBarras,
                    nome,
                    marca,
                    preço,
                    desconto)
            VALUES( 123187529,
                    'Pasta de Dentes',
                    'Colgate',
                    10.5,
                    0
                  )
;

SELECT Stock.idLoja AS 'ID da Loja', Stock.codigoBarras AS 'Codigo de Barras', 
        Stock.stock AS 'Quantidade em Stock' 
FROM Stock; 
