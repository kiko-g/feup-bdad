.mode	columns
.headers	on
.nullvalue	NULL

SELECT * FROM Encomenda
  WHERE idEncomenda IN (
    SELECT idEncomenda FROM
      Entrega, (Cliente INNER JOIN Pessoa 
        ON Cliente.NIF = Pessoa.NIF) AS A
          WHERE Entrega.morada = A.morada
  )
;