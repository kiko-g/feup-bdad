.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Incrementa o preço final da encomenda de acordo com a quantidade pedida e decrementa o stock da loja

CREATE TRIGGER insertQuantidade
AFTER INSERT ON QuantidadePedida
FOR EACH ROW
WHEN(NEW.quantidade > 0) BEGIN
    UPDATE Encomenda SET preçoFinal = preçoFinal + NEW.quantidade * (SELECT preço FROM Produto WHERE Produto.codigoBarras = NEW.codigoBarras) * 
                                            (1 - (SELECT desconto FROM Produto WHERE Produto.codigoBarras = NEW.codigoBarras) / 100)
    WHERE NEW.idEncomenda = Encomenda.idEncomenda;

    UPDATE Stock SET stock = stock - NEW.quantidade
    WHERE NEW.codigoBarras = Stock.codigoBarras;
END;
