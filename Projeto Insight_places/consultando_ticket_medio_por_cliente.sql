SELECT cliente_id, AVG(preco_total) AS ticket_medio
FROM alugueis 
GROUP BY cliente_id; 