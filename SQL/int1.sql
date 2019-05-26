.mode columns
.headers on
.nullvalue	NULL

-- 1 Info de todos os clientes que ja fizeram um pedido de apoio

.print ''
.print ''

SELECT idPedido, data, funcionarioNIF, clienteNIF, email, nome, morada, telemovel FROM
  (Suporte
  INNER JOIN Cliente
  ON Cliente.NIF = Suporte.clienteNIF) AS A INNER JOIN Pessoa
  ON Pessoa.NIF = A.NIF;

.print ''
.print ''