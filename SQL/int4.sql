.mode	columns
.headers	on
.nullvalue	NULL

SELECT * FROM Produto
  WHERE codigoBarras IN (
    SELECT codigoBarras FROM Stock
      WHERE stock > 70
  )
;