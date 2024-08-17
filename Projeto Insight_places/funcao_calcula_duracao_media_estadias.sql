DELIMITER $$

CREATE FUNCTION CalculaDuracaoMediaEstadias() 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total_dias INT;
    DECLARE total_estadias INT;
    
    SELECT SUM(DATEDIFF(data_fim, data_inicio)) INTO total_dias
    FROM alugueis;
    SELECT COUNT(*) INTO total_estadias
    FROM alugueis;
    RETURN ROUND(total_dias / total_estadias);
END$$

DELIMITER ;

SELECT CalculaDuracaoMediaEstadias()