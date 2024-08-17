-- Menos de 4 dias = 0%
-- 4 a 6 dias = 5% de desconto
-- 7 a 9 dias = 10% de desconto
-- 10 ou mais dias = 15% de desconto

DELIMITER $$
CREATE FUNCTION CalcularDescontoporDias(aluguelID INT)
RETURNS INT DETERMINISTIC
BEGIN
DECLARE vDesconto INT;
SELECT 
	CASE 
		WHEN DATEDIFF(data_fim, data_inicio) BETWEEN 4 AND 6 THEN 5
		WHEN DATEDIFF(data_fim, data_inicio) BETWEEN 7 AND 9 THEN 10
		WHEN DATEDIFF(data_fim, data_inicio) >=10 THEN 15
		ELSE 0
	END 
	INTO vDesconto    
FROM alugueis
WHERE aluguel_id = aluguelID;
RETURN vDesconto;

END$$
DELIMITER ;

SELECT CalcularDescontoporDias(1)