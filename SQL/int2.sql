.mode	columns
.headers	on
.nullvalue	NULL

-- 2 Produto mais vendido do mês passado

CREATE VIEW IF NOT EXISTS EncomendasMesPassado AS
SELECT idEncomenda FROM Encomenda
WHERE strftime('%Y-%m', data) = strftime('%Y-%m', 'now', '-1 month');

CREATE VIEW IF NOT EXISTS numeroComprasProduto AS
SELECT codigoBarras, SUM(quantidade) AS 'quantidade'
FROM EncomendasMesPassado INNER JOIN QuantidadePedida ON 
  EncomendasMesPassado.idEncomenda = QuantidadePedida.idEncomenda
GROUP BY codigoBarras;


SELECT A.codigoBarras AS 'Codigo de Barras', nome AS 'Nome', marca AS 'Marca', preço AS 'Preço', desconto AS 'Desconto'
  FROM (Produto INNER JOIN (SELECT numeroComprasProduto.codigoBarras, MAX('quantidade') FROM numeroComprasProduto) AS maxProduto 
                          ON maxProduto.codigoBarras = Produto.codigoBarras) AS A;
