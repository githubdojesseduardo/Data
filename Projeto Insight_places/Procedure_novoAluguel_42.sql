
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`novoAluguel_42`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_42`(vAluguel VARCHAR(10), vClienteNome VARCHAR(150), vHospedagem VARCHAR(10), vDataInicio DATE,
vDias INTEGER, vPrecoUnitario DECIMAL(10,2))
BEGIN
    DECLARE vCliente VARCHAR(10);
    DECLARE vDataFinal DATE;
    DECLARE VPrecoTotal DECIMAL(10,2);
    DECLARE VNumCliente INTEGER;
    DECLARE vMensagem VARCHAR(100);
    DECLARE  vContador INTEGER;
    DECLARE  vDiaSemana INTEGER;
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
        SET vMensagem = 'Problema de chave estrangeira associado a alguma entidade da base.';
        SELECT vMensagem;
    END;
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);
    CASE 
    WHEN vNumCliente = 0 THEN
		SET   vMensagem = 'Este Cliente não pode ser usado para incluir o aluguel porque não existe.';
        SELECT vMensagem;
    WHEN vNumCliente = 1 THEN
		-- SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
        SET vContador =1;
        SET vDataFinal = vDataInicio;
		WHILE  vContador < vDias
        DO
			SET vDiaSemana =(SELECT DAYOFWEEK(STR_TO_DATE('2023-01-01' , '%Y-%m-%d')));
            IF (vDiaSemana <> 7 AND vDiaSemana <> 1) THEN
				SET vContador = vContador +1;
            END IF;
				SET vDataFinal = (SELECT vDataInicio + INTERVAL vDias DAY);         
        END WHILE;
		SET vPrecoTotal = vDias * vPrecoUnitario;
		SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
		INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, 
		vDataFinal, vPrecoTotal);
		SET vMensagem = 'Aluguel incluido na base com sucesso.';
		SELECT vMensagem;
	WHEN vNumCliente > 1 THEN
		SET vMensagem = 'Este cliente não pode ser usado para incluir aluguel pelo nome.';
		SELECT vMensagem;
    END CASE;
END$$
DELIMITER ;

CALL novoAluguel_42('10011','Gabriela Pires','8635','2023-04-05',5,40);
SELECT * FROM alugueis WHERE aluguel_id ='10011'

