.mode columns
.headers on
.nullvalue NULL

-- inserir uma encomenda
-- preço final = preço da transportadora

-- acrescentar um tuplo na classe entrega, pôr o id da encomanda, id da transportadora e morada do cliente

PRAGMA foreign_keys = ON;

CREATE TRIGGER insertEncomenda
AFTER INSERT ON Encomenda
FOR EACH ROW
WHEN(NEW.idTransportadora IS NOT NULL)
BEGIN
  UPDATE Encomenda
    SET preçoFinal = (SELECT preço FROM Transportadora 
                        WHERE Transportadora.idTransportadora = NEW.idTransportadora)
  WHERE NEW.idEncomenda = Encomenda.idEncomenda;
  INSERT INTO Entrega(idTransportadora, idEncomenda, morada)
              VALUES (NEW.idTransportadora, NEW.idEncomenda, (SELECT morada from Pessoa WHERE Pessoa.NIF = NEW.NIF));
END;
    