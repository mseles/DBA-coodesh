-- sql03.sql: Listar os Produtos sem Estoque:

/* 
	A consulta usa um LEFT JOIN para combinar a tabela products com a tabela stocks com base no product_id 
	retornando os dados que existem na primeira tabela e os dados da intersecção com a segunda tabela.
	Em seguida, é utilizado o "WHERE s.quantity = 0" para filtrar apenas os produtos que estão sem estoque.
*/

SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN stocks s ON p.product_id = s.product_id
WHERE s.quantity = 0;
