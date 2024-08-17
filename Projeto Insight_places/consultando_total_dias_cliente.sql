SELECT TRIM(nome) AS Nome, datediff(data_fim, data_inicio) as TotalDias
FROM alugueis a
JOIN clientes c
ON a.cliente_id = c.cliente_id;