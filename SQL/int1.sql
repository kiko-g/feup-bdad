.mode	columns
.headers	on
.nullvalue	NULL

-- 1 Todos os clientes que ja fizeram um pedido de apoio

<<<<<<< HEAD
SELECT idPedido, data, funcionarioNIF, clienteNIF, email, nome, morada, telemovel
  FROM (Suporte INNER JOIN Cliente
=======
CREATE VIEW viewClientsWithTickets AS
SELECT idPedido, data, funcionarioNIF, clienteNIF, email, nome, morada, telemovel FROM
  (Suporte
  INNER JOIN Cliente
>>>>>>> 8b4d0b64d2ffd774cfd967c5c9d5bb2fa34b5604
  ON Cliente.NIF = Suporte.clienteNIF) AS A INNER JOIN Pessoa
  ON Pessoa.NIF = A.NIF;
