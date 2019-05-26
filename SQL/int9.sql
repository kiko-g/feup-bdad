.mode	columns
.headers	on
.nullvalue	NULL

-- 9 Ordenar clientes por número de encomendas
.print ''
.print ''


SELECT NIF, email, Encomendas AS 'Número de Encomendas' FROM (SELECT ClienteEncomenda.NIF, email, COUNT(idEncomenda) AS 'Encomendas'
    FROM (Cliente INNER JOIN Encomenda ON Cliente.NIF = Encomenda.NIF) AS ClienteEncomenda
  GROUP BY ClienteEncomenda.NIF)
ORDER BY Encomendas DESC;

.print ''