-- sql04.sql: Agrupar a quantidade de vendas que uma determinada Marca por Loja:
/*
Nessa consulta, foi necessário realizar a junções entre as tabelas: brands, products, order_items, orders e stores para obter as informações desejadas. 
Os resultados foram agrupados pelo nome da marca (brand_name) e pelo nome da loja (store_name) na clausula group_by.
A contagem foi realizada pela função COUNT(oi.order_id) retornando a quantidade de vendas (pedidos) de uma determinada marca por loja.
*/

SELECT b.brand_name, s.store_name, COUNT(oi.order_id) AS quantidade_vendas
FROM brands b
JOIN products p ON b.brand_id = p.brand_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN stores s ON o.store_id = s.store_id
GROUP BY b.brand_name, s.store_name;
