DELIMITER $$
CREATE FUNCTION CalculaValorFinalComDesconto(aluguelID INT)
RETURNS DECIMAL (10,2) DETERMINISTIC
BEGIN
DECLARE valorTotal DECIMAL (10,2);
DECLARE vdesconto INT;
DECLARE valorFinal DECIMAL(10,2);

SELECT preco_total INTO valorTotal FROM alugueis WHERE aluguel_id = aluguelID;

SET vdesconto = CalcularDescontoporDias(aluguelID);
SET valorFinal = valorTotal - (valorTotal * vdesconto/100);

RETURN valorFinal;

END$$

DELIMITER ;

SELECT CalculaValorFinalComDesconto(1);