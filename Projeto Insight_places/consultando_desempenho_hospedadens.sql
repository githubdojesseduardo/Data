SELECT UPPER(e.cidade) AS Cidade,
       AVG(a.nota) AS Media_Nota,
       COUNT(a.avaliacao_id) AS Total_Avaliacoes
FROM Avaliacoes a
JOIN Hospedagens h ON a.hospedagem_id = h.hospedagem_id
JOIN Enderecos e ON h.endereco_id = e.endereco_id
GROUP BY e.cidade;
