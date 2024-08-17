SELECT tipo, SUM(DATEDIFF(data_fim, data_inicio)) as TotalDias
FROM alugueis a
JOIN hospedagens h 
ON a.hospedagem_id = h.hospedagem_id
GROUP BY tipo;