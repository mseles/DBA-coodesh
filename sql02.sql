-- sql02:Listar os Produtos que não tenham sido comprados:

/* 
	A consulta usa um LEFT JOIN para combinar a tabela products com a tabela order_items com base no product_id 
	retornando os dados que existem na primeira tabela e os dados da intersecção com a segunda tabela.
	Em seguida, é utilizado o "WHERE oi.product_id IS NULL" para filtrar apenas os registros em que não há correspondência 
	na tabela order_items, ou seja, os produtos que não foram comprados.
*/

SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
