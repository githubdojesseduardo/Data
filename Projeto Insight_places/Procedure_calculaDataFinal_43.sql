USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`calculaDataFinal_43`;
DELIMITER $$
USE `insight_places`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `calculaDataFinal_43`(vDataInicio DATE, INOUT vDataFinal DATE, vDias INTEGER)
BEGIN
DECLARE vContador INTEGER;
DECLARE vDiaSemana INTEGER;
SET vContador = 1;
SET vDataFinal = vDataInicio;
WHILE vContador < vDias
DO
       SET vDiaSemana = (SELECT DAYOFWEEK(STR_TO_DATE(vDataFinal,'%Y-%m-%d')));
       IF (vDiaSemana <> 7 AND vDiaSemana <> 1) THEN
           SET vContador = vContador + 1;
       END IF;
       SET vDataFinal = (SELECT vDataFinal + INTERVAL 1 DAY) ;
END WHILE;       
END$$
DELIMITER ;