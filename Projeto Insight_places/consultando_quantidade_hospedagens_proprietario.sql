USE insight_places;


SELECT 
	p.nome AS proprietario,
    COUNT(DISTINCT h.hospedagem_id) AS total_hospedagens
FROM
	hospedagens h
JOIN
	proprietarios p ON h.proprietario_id = p.proprietario_id
GROUP BY
	p.proprietario_id
ORDER BY
	total_hospedagens  DESC;