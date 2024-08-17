

SELECT 
TRIM(nome) Nome,
CONCAT(SUBSTRING(cpf, 1, 3),SUBSTRING(cpf, 4, 3),SUBSTRING(cpf, 7, 3),SUBSTRING(cpf, 10, 5))AS CPF_Mascarado 
FROM 
clientes;