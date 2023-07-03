-- sql05.sql: Listar os Funcionarios que não estejam relacionados a um Pedido;
/* 
	A consulta usa LEFT JOIN para combinar a tabela staff com a tabela orders com base no staff_id 
	retornando os dados que existem na primeira tabela e os dados da intersecção com a segunda tabela.
	Em seguida, é utilizado o "WHERE o.staff_id IS NULL" para filtrar registros em que não há correspondência na tabela orders.
*/

SELECT s.staff_id, s.first_name, s.last_name
FROM staffs s
LEFT JOIN orders o ON s.staff_id = o.staff_id
WHERE o.staff_id IS NULL;
