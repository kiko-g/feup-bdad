.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Incrementa o preço final da encomenda de acordo com a quantidade pedida e decrementa o stock da loja

CREATE IF NOT EXISTS TRIGGER preçoInsertQuantidade
AFTER INSERT ON QuantidadePedida
FOR EACH ROW
BEGIN
  SELECT 
  CASE 
  WHEN(NEW.quantidade > 0)
    UPDATE Encomenda
      SET preçoFinal += NEW.quantidade * (SELECT preço FROM Produto 
                          WHERE Produto.codigoBarras = NEW.codigoBarras) * (1 - (SELECT desconto FROM Produto 
                          WHERE Produto.codigoBarras = NEW.codigoBarras) / 100)
    WHERE NEW.idEncomenda = Encomenda.idEncomenda
    
    UPDATE Stock
      SET stock -= NEW.quantidade
      WHEN(stock < 0) RAISE(ROLLBACK, 'Quantidade indisponível')
    WHERE NEW.codigoBarras = Stock.codigoBarras
  END;

  SELECT
  CASE
  WHEN(NEW.quantidade <= 0)
    RAISE(ROLLBACK, 'Quantidade inválida')
  END;
END;
