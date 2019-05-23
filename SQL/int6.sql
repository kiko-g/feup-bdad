.mode	columns
.headers	on
.nullvalue	NULL

-- 6
-- Preco final medio das encomendas do cliente anterior

SELECT ONE.NIF, ONE.email, avg(preçoFinal) FROM
(Cliente INNER JOIN Encomenda ON Cliente.NIF = Encomenda.NIF)
AS ONE
GROUP BY ONE.NIF;