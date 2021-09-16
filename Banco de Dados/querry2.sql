/* 7. 5 SQLs de consulta
	a. Pelo menos 2 com algum tipo de junção
	b. Pelo menos 1 com usando count() e group by()
	c. 1 SQL para construção de nota fiscal */ 
    
INSERT INTO pedido_item(item, quantidade_item)
VALUES (1, 1), (2, 2), (3, 1), (5, 2), (4, 2);

INSERT INTO pedido(item_pedido, data_pedido, cliente_pedido) 
VALUES ('1', '2021-04-15', '4'), ('2', '2021-04-15', '4'), ('3', '2021-04-12', '5'), ('4', '2021-06-07', '4'), 
('5', '2021-05-30', '3'); 

--Busca por pedido do cliente

SELECT nome_cliente, item_pedido, nome_produto, quantidade_item, valor, data_pedido FROM pedido AS p
INNER JOIN pedido_item AS i 
ON (i.id = p.id)
INNER JOIN cliente AS c
ON (c.id = p.id)
INNER JOIN produto AS o 
ON (o.id = p.item_pedido);

--Busca de qual funcionário inseriu o produto

SELECT nome_produto, estoque, inserido_por FROM produto

UPDATE produto 
SET estoque = '20' WHERE estoque = '15';

UPDATE produto 
SET inserido_por = '1' WHERE inserido_por = '1'

SELECT nome_funcionario, nome_produto, estoque FROM produto AS p
INNER JOIN funcionario AS f
ON (p.inserido_por = f.id);

--Busca por produtos plus size 

SELECT nome_produto, estoque, count(*) FROM produto
GROUP BY nome_produto, estoque, categoria_produto 
HAVING categoria_produto > 4
ORDER BY nome_produto;

--Consulta de qual cliente fez pedido online (para saber para qual email enviar nota)

SELECT nome_usuario, email, user_usuario FROM pedido AS p 
INNER JOIN usuario AS a 
ON(p.cliente_pedido = a.id)
ORDER BY nome_usuario;

--Construção de nota fiscal 

SELECT nome_cliente, cpf, data_pedido, item_pedido, nome_produto, valor FROM cliente AS c
INNER JOIN pedido AS p 
ON (p.id = c.id)
INNER JOIN produto AS pr
ON (p.id = pr.id)
ORDER BY nome_cliente;