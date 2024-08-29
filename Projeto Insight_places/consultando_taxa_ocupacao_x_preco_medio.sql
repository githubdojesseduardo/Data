SELECT
    p.nome AS proprietario,
    ROUND(AVG(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)), 2) AS preco_medio_diario,
    ROUND((SUM(DATEDIFF(a.data_fim, a.data_inicio)) / (DATEDIFF(MAX(a.data_fim), MIN(a.data_inicio)) * COUNT(DISTINCT h.hospedagem_id))) * 100, 2) AS taxa_ocupacao
FROM
    proprietarios p
JOIN
    hospedagens h ON p.proprietario_id = h.proprietario_id
JOIN
    alugueis a ON h.hospedagem_id = a.hospedagem_id
GROUP BY
    p.proprietario_id;