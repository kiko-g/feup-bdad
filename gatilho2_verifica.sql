//update do stock

CREATE TRIGGER preco_V_Encomenda
AFTER INSERT ON Encomenda
BEGIN
  DECLARE @PCount REAL;

  SET @PCount = preçoFinal - (SELECT preço FROM Transportadora 
                        WHERE Transportadora.idTransportadora = NEW.idTransportadora)
                        + NEW.quantidade * (SELECT preço FROM Produto 
                        WHERE Produto.codigoBarras = (SELECT codigoBarras FROM Entrega WHERE Entrega.idEncomenda = NEW.idEncomenda))
                         * (1 - (SELECT desconto FROM Produto 
                        WHERE Produto.codigoBarras = (SELECT codigoBarras FROM Entrega WHERE Entrega.idEncomenda = NEW.idEncomenda)) / 100)
  IF @PCount = 0
    END;
  SELECT raise(rollback, 'Preço Invalido');
END;

CREATE TRIGGER preco_V_Update_Encomenda
AFTER UPDATE ON Encomenda
FOR EACH ROW
WHEN(NEW.idTransportadora IS NOT NULL)
BEGIN
  UPDATE Encomenda
    SET preçoFinal -= (SELECT preço FROM Transportadora 
                        WHERE Transportadora.idTransportadora = NEW.idTransportadora)
  WHERE NEW.idEncomenda = Encomenda.idEncomenda
END;
