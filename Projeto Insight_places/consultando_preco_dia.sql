USE insight_places;

SELECT 
	a.hospedagem_id,
    a.preco_total,
    DATEDIFF(a.data_fim, a.data_inicio) AS dias_aluguel,
    a.preco_total / DATEDIFF(a.data_fim, a.data_inicio) AS preco_dia
FROM
	alugueis a 
ORDER BY
	preco_dia DESC;
;