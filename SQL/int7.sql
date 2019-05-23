.mode	columns
.headers	on
.nullvalue	NULL

SELECT * FROM Funcionario
  WHERE NIF IN (SELECT funcionarioNIF FROM Suporte)
;