.mode	columns
.headers	on
.nullvalue	NULL

-- 8 Número de produtos vendidos por secção

.print ''
.print ''

CREATE VIEW IF NOT EXISTS vendidosBebidas AS
SELECT SUM(QuantidadePedida.quantidade) AS 'nVendidosB' FROM Bebidas, QuantidadePedida
WHERE Bebidas.codigoBarras = QuantidadePedida.codigoBarras;

CREATE VIEW IF NOT EXISTS vendidosCharcutaria AS
SELECT SUM(QuantidadePedida.quantidade) AS 'nVendidosC' FROM Charcutaria, QuantidadePedida
WHERE Charcutaria.codigoBarras = QuantidadePedida.codigoBarras;

CREATE VIEW IF NOT EXISTS vendidosLimpeza AS
SELECT SUM(QuantidadePedida.quantidade) AS 'nVendidosLim' FROM Limpeza, QuantidadePedida
WHERE Limpeza.codigoBarras = QuantidadePedida.codigoBarras;

CREATE VIEW IF NOT EXISTS vendidosLacticinios AS
SELECT SUM(QuantidadePedida.quantidade) AS 'nVendidosLac' FROM Lacticinios, QuantidadePedida
WHERE Lacticinios.codigoBarras = QuantidadePedida.codigoBarras;

SELECT nVendidosB AS 'Nº de Bebidas Vendidas', nVendidosC AS 'Nº de Produtos de Charcutaria Vendidos',
       nVendidosLac AS 'Nº de Lacticínios Vendidos', nVendidosLim AS 'Nº de Produtos de Limpeza Vendidos'
FROM vendidosBebidas, vendidosLacticinios, vendidosCharcutaria, vendidosLimpeza;

.print ''