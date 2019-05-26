.mode columns
.headers on
.nullvalue NULL

-- 10 Nome do funcionário que respondeu a mais pedidos de apoio
.print ''
.print ''

SELECT nome AS 'Nome', MAX(nPedidos) AS 'Número de Pedidos de Apoio'
FROM (SELECT nome, COUNT(Suporte.funcionarioNIF) AS 'nPedidos' 
FROM Pessoa, Suporte
WHERE Suporte.funcionarioNIF = Pessoa.NIF
GROUP BY Suporte.funcionarioNIF);

.print ''