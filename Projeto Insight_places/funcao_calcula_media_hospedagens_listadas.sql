DELIMITER $$

CREATE FUNCTION CalculaOcupacaoMedia() 
RETURNS DECIMAL(5,2) DETERMINISTIC
BEGIN
    DECLARE TotalHospedagens INT;
    DECLARE TotalOcupadas INT;
    DECLARE OcupacaoMedia DECIMAL(5,2);

    -- Contagem total de hospedagens
    SELECT COUNT(*) INTO TotalHospedagens FROM  hospedagens;

    -- Contagem total de aluguéis (ocupações)
    SELECT COUNT(*) INTO TotalOcupadas FROM alugueis;

    -- Cálculo da ocupação média
    SET OcupacaoMedia = (TotalOcupadas / TotalHospedagens) * 100;

    RETURN OcupacaoMedia;
END$$

DELIMITER ;

SELECT CalculaOcupacaoMedia() 