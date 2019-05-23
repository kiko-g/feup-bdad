.mode	columns
.headers	on
.nullvalue	NULL

SELECT * FROM Cliente
  WHERE Cliente.NIF IN (
    SELECT NIF FROM Encomenda
      WHERE idTransportadora IN (
        SELECT idTransportadora FROM Transportadora
          WHERE nome LIKE 'Runner'
      )
  );