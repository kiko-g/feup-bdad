.mode columns
.headers ON
.nullvalue NULL

-- 3 
-- Todos os clientes que ja recorreram a uma transportadora especificada ('Runner' neste caso)

.print ''

SELECT * FROM Cliente
  WHERE Cliente.NIF IN(
    SELECT NIF FROM Encomenda
      WHERE idTransportadora IN (
        SELECT idTransportadora FROM Transportadora
          WHERE nome LIKE 'Runner'));

.print ''
          