.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Incrementa o preço final da encomenda de acordo com a quantidade pedida e decrementa o stock da loja

CREATE TRIGGER precoInsertQuantidade
AFTER INSERT ON QuantidadePedida
FOR EACH ROW
BEGIN
  SELECT 
  CASE 
  WHEN(NEW.quantidade > 0)
    UPDATE Encomenda
      SET precoFinal += NEW.quantidade * (SELECT preco FROM Produto 
                          WHERE Produto.codigoBarras = NEW.codigoBarras) * (1 - (SELECT desconto FROM Produto 
                          WHERE Produto.codigoBarras = NEW.codigoBarras) / 100)
    WHERE NEW.idEncomenda = Encomenda.idEncomenda
    
    UPDATE Stock
      SET stock -= NEW.quantidade
      WHEN(stock < 0) RAISE(ROLLBACK, 'Quantidade indisponivel')
    WHERE NEW.codigoBarras = Stock.codigoBarras
  --END;

  SELECT
  CASE
  WHEN(NEW.quantidade <= 0) RAISE(ROLLBACK, 'Quantidade invalida')
  END;
--END;