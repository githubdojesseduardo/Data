
DELIMITER $$
CREATE FUNCTION contar_hospedagens_por_tipo(tipo_hospedagem VARCHAR(255))
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM hospedagens WHERE tipo = tipo_hospedagem;
    RETURN total;
END$$

DELIMITER ;

SELECT contar_hospedagens_por_tipo('hotel')