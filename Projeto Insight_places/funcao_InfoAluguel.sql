USE `insight_places`;
DROP FUNCTION IF EXISTS `insight_places`.`InfoAluguel`;

DELIMITER $$
CREATE FUNCTION InfoAluguel(IDaluguel INT)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE nomeCliente VARCHAR(100);
    DECLARE precoTotal  DECIMAL(10, 2);
    DECLARE dias INT;
    DECLARE valorDiaria DECIMAL(10, 2);
    DECLARE resultado VARCHAR(255);
    
    SELECT c.nome, a.preco_total, DATEDIFF(data_fim,data_inicio)
    INTO nomeCliente, precoTotal, dias
    FROM alugueis a
    JOIN clientes c
    ON a.cliente_id = c.cliente_id
    WHERE a.aluguel_id = IDaluguel;
    
    SET valorDiaria = precoTotal / dias;
    
    SET resultado = CONCAT('Nome: ' , nomeCliente, ',Valor Diário: R$', FORMAT(valorDiaria,2));
    
    RETURN resultado;
    
    
END$$
DELIMITER ;

SELECT InfoAluguel(1)