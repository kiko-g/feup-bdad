.mode	columns
.headers	on
.nullvalue	NULL

-- 6
-- Preco final medio das encomendas do cliente anterior

SELECT A.NIF, A.email, avg(preçoFinal) FROM
(Cliente INNER JOIN Encomenda ON Cliente.NIF = Encomenda.NIF)
AS A GROUP BY A.NIF;