.mode	columns
.headers	on
.nullvalue	NULL

SELECT A.NIF, A.email, avg(preçoFinal) FROM
  (Cliente INNER JOIN Encomenda ON Cliente.NIF = Encomenda.NIF) AS A
GROUP BY A.NIF
;