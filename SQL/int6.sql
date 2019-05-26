.mode	columns
.headers	on
.nullvalue	NULL

-- 6
-- Preco medio das encomendas de cada cliente
.print ''
.print ''

SELECT Cliente.NIF, email, avg(preçoFinal) AS 'Preço Final medio' 
FROM Cliente, Encomenda 
WHERE Cliente.NIF = Encomenda.NIF
GROUP BY Cliente.NIF;

.print ''