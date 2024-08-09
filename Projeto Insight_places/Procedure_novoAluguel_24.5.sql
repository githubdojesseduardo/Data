CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_24`(vAluguel VARCHAR(10), vCliente VARCHAR(10), vHospedagem VARCHAR(10), vDataInicio DATE,
vDataFinal DATE, vPrecoUnitario DECIMAL(10,2))
BEGIN
    DECLARE vDias INTEGER DEFAULT 0;
    DECLARE VPrecoTotal DECIMAL(10,2);
    SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
    SET vPrecoTotal = vDias * vPrecoUnitario;
    INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, 
    vDataFinal, vPrecoTotal);
END

--O procedimento utiliza a função DATEDIFF para determinar o número de dias
-- entre as datas de início e fim do aluguel,
-- e multiplica o resultado pelo preço unitáriopara calcular o preço total, 
--evidenciando uma aplicação direta de lógica matemática e condicional no processo.