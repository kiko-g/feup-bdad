.mode columns
.headers ON
.nullvalue NULL

-- 7
-- Todos os funcionarios que ja atenderam um pedido de apoio
-- INCOMPLETE

SELECT * FROM Funcionario
WHERE NIF IN (SELECT funcionarioNIF FROM Suporte);