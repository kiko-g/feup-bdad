.mode	columns
.headers ON
.nullvalue	NULL

-- 5
-- Todas as encomendas feitas para o endereço de um cliente

SELECT * FROM Encomenda
  WHERE idEncomenda IN (
    SELECT idEncomenda FROM
      Entrega, (Cliente INNER JOIN Pessoa 
        ON Cliente.NIF = Pessoa.NIF) AS A
          WHERE Entrega.morada = A.morada
  )
;