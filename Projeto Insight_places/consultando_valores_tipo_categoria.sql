 SELECT tipo,
 SUM(preco_total) ValorTotal,
 MAX(preco_total) MaiorValor,
 MIN(preco_total) MenorValor 
 FROM alugueis a 
 JOIN hospedagens h
 ON h.hospedagem_id =  a.hospedagem_id
 GROUP BY tipo