.mode	columns
.headers	on
.nullvalue	NULL

-- 6
-- Preco final medio das encomendas dos clientes

SELECT Cliente.NIF, email, avg(preçoFinal) AS 'Preço Final médio' 
FROM Cliente, Encomenda 
WHERE Cliente.NIF = Encomenda.NIF
AS A GROUP BY A.NIF;
