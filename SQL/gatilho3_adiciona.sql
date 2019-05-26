.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

--Inserir na tabela de Stock o produto e por stock = 0 para cada loja

CREATE TRIGGER insertProduto
AFTER INSERT ON Produto
FOR EACH ROW
BEGIN
  INSERT INTO Stock(codigoBarras, idLoja, stock)
  SELECT NEW.codigoBarras, Loja.idLoja , 0
    FROM Loja;
END;
