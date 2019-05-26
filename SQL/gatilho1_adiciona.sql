.mode columns
.headers on
.nullvalue NULL

-- inserir uma encomenda
-- preço final = preço da transportadora
-- criar a classe entrega, acrescentar um coiso nessa classe e pôr o id da encomanda, id da transportadora e morada do cliente

PRAGMA foreign_keys = ON;

CREATE TRIGGER preco_Encomenda
AFTER INSERT ON Encomenda
FOR EACH ROW
BEGIN
CASE
WHEN(NEW.idTransportadora IS NOT NULL)
  UPDATE Encomenda
    SET preçoFinal = (SELECT preço FROM Transportadora 
                        WHERE Transportadora.idTransportadora = NEW.idTransportadora)
  WHERE NEW.idEncomenda = Encomenda.idEncomenda

AFTER INSERT ON Encomenda
FOR EACH ROW
BEGIN
CASE
WHEN(NEW.idTransportadora IS NOT NULL)
    INSERT INTO Entrega 
    VALUES (NEW.idTransportadora, NEW.idEncomenda, SELECT morada from cliente WHERE cliente.nif = NEW.nif)
END;

    