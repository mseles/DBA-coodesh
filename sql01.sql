-- sql01: sql01.sql: Listar todos Clientes que não tenham realizado uma compra:
/*
  A consulta usa um LEFT JOIN para combinar a tabela customers com a tabela orders com base no customer_id 
   retornando os dados que existem na primeira tabela e os dados da intersecção com a segunda tabela.
   Em seguida, é utilizado o "WHERE o.customer_id IS NULL" para filtrar apenas os registros em que não há correspondência 
    na tabela orders, ou seja, os clientes sem pedidos.
*/

SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
