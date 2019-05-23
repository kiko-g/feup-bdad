.mode	columns
.headers	on
.nullvalue	NULL

SELECT * FROM Encomenda
  WHERE Encomenda.idEncomenda IN (SELECT Encomenda.idEncomenda FROM
  QuantidadePedida, Encomenda, Produto
  WHERE QuantidadePedida.idEncomenda = Encomenda.idEncomenda
  AND QuantidadePedida.codigoBarras = Produto.codigoBarras
  AND Produto.nome = 'Amaciador'
  AND Encomenda.data LIKE '2019-04%');
