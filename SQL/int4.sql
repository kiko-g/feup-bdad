.mode columns
.headers ON
.nullvalue NULL

-- 4
-- Todos os produtos com stock maior que 70
.print ''
.print ''

SELECT * FROM Produto
  WHERE codigoBarras IN (
    SELECT codigoBarras FROM Stock
      WHERE stock > 70);

.print ''      