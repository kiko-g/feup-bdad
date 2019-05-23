CREATE TRIGGER preco_Encomenda
AFTER INSERT ON Encomenda
FOR EACH ROW
WHEN(NEW.idTransportadora IS NOT NULL)
BEGIN
  UPDATE Encomenda
    SET preçoFinal = (SELECT preço FROM Transportadora 
                        WHERE Transportadora.idTransportadora = NEW.idTransportadora)
  WHERE NEW.idEncomenda = Encomenda.idEncomenda
END;

CREATE TRIGGER preco_B_Update_Encomenda
AFTER INSERT ON Encomenda
FOR EACH ROW
WHEN(NEW.idTransportadora IS NOT NULL)
BEGIN
  UPDATE Encomenda
    SET preçoFinal -= (SELECT preço FROM Transportadora 
                        WHERE Transportadora.idTransportadora = NEW.idTransportadora)
  WHERE NEW.idEncomenda = Encomenda.idEncomenda
END;

CREATE TRIGGER preco_A_Update_Encomenda
AFTER INSERT ON Encomenda
FOR EACH ROW
WHEN(NEW.idTransportadora IS NOT NULL)
BEGIN
  UPDATE Encomenda
    SET preçoFinal += (SELECT preço FROM Transportadora 
                        WHERE Transportadora.idTransportadora = NEW.idTransportadora)
  WHERE NEW.idEncomenda = Encomenda.idEncomenda
END;

CREATE TRIGGER preco_Insert_Quantidade
AFTER INSERT ON QuantidadePedida
FOR EACH ROW
WHEN(NEW.quantidade <> 0)
BEGIN
  UPDATE Encomenda
    SET preçoFinal += NEW.quantidade * (SELECT preço FROM Produto 
                        WHERE Produto.codigoBarras = NEW.codigoBarras) * (1 - (SELECT desconto FROM Produto 
                        WHERE Produto.codigoBarras = NEW.codigoBarras) / 100)
  WHERE NEW.idEncomenda = Encomenda.idEncomenda
END;

CREATE TRIGGER preco_B_Update_Quantidade
BEFORE UPDATE ON QuantidadePedida
FOR EACH ROW
WHEN(NEW.quantidade <> 0)
BEGIN
  UPDATE Encomenda
    SET preçoFinal -= NEW.quantidade * (SELECT preço FROM Produto 
                        WHERE Produto.codigoBarras = NEW.codigoBarras) * (1 - (SELECT desconto FROM Produto 
                        WHERE Produto.codigoBarras = NEW.codigoBarras) / 100)
  WHERE NEW.idEncomenda = Encomenda.idEncomenda
END;

CREATE TRIGGER preco_A_Update_Quantidade
AFTER UPDATE ON QuantidadePedida
FOR EACH ROW
WHEN(NEW.quantidade <> 0)
BEGIN
  UPDATE Encomenda
    SET preçoFinal += NEW.quantidade * (SELECT preço FROM Produto 
                        WHERE Produto.codigoBarras = NEW.codigoBarras) * (1 - (SELECT desconto FROM Produto 
                        WHERE Produto.codigoBarras = NEW.codigoBarras) / 100)
  WHERE NEW.idEncomenda = Encomenda.idEncomenda
END;

CREATE TRIGGER preco_B_Delete_Quantidade
BEFORE DELETE ON QuantidadePedida
FOR EACH ROW
WHEN(NEW.quantidade <> 0)
BEGIN
  UPDATE Encomenda
    SET preçoFinal -= NEW.quantidade * (SELECT preço FROM Produto 
                        WHERE Produto.codigoBarras = NEW.codigoBarras) * (1 - (SELECT desconto FROM Produto 
                        WHERE Produto.codigoBarras = NEW.codigoBarras) / 100)
  WHERE NEW.idEncomenda = Encomenda.idEncomenda
END;
