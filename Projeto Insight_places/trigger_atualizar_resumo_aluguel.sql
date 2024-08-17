USE `insight_places`;
DROP TRIGGER IF EXISTS `insight_places`.`AtualizarResumoAluguel`;

DELIMITER $$

CREATE TRIGGER AtualizarResumoAluguel
AFTER INSERT ON alugueis
FOR EACH ROW

BEGIN

DECLARE Desconto INT;
DECLARE ValorFinal DECIMAL (10, 2);


SET Desconto = CalcularDescontoporDias (NEW.aluguel_id);
SET ValorFinal = CalculaValorFinalComDesconto(NEW.aluguel_id);

INSERT INTO  resumo_aluguel (aluguel_id, cliente_id,valortotal,descontoaplicado,valorfinal)
VALUES (NEW.aluguel_id,NEW.cliente_id, NEW.preco_total, Desconto, ValorFinal);

END$$

DELIMITER ;

-- validação abaixo:

INSERT INTO alugueis (aluguel_id, cliente_id, hospedagem_id, data_inicio, data_fim, preco_total)
VALUES (10001, 42, 15, '2024-01-01', '2024-01-08', 3000.00);
SELECT * FROM resumo_aluguel;