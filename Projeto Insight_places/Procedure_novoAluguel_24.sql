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

---A principal evolução da novoAluguel_23 em relação às suas antecessoras é a capacidade de receber parâmetros externos,
---permitindo uma inserção de dados personalizada e flexível sem a necessidade de alterar o código interno da procedure.