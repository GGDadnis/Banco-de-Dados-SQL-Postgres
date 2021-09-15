CREATE DATABASE camisas;

CREATE TABLE funcionario(
	id SERIAL PRIMARY KEY,
	nome_funcionario VARCHAR(50),
  	cpf_funcionario VARCHAR(11)
);

CREATE TABLE categoria(
id SERIAL PRIMARY KEY,
  nome VARCHAR(50),
  descricao_categoria VARCHAR(100)
);

CREATE TABLE produto(
	id SERIAL PRIMARY KEY,
	nome_produto VARCHAR(50),
	descricao_produto VARCHAR(200),
  	estoque int,
	fabricacao date,
  	valor money,
  	categoria_produto int,
	inserido_por int REFERENCES funcionario(id)
);

CREATE TABLE cliente(
  id SERIAL PRIMARY KEY,
  nome_cliente VARCHAR(50)NOT NULL,
  usuario_cliente VARCHAR(50)NOT NULL,
  email VARCHAR(50)NOT NULL,
  cpf VARCHAR(11)NOT NULL,
  nascimento date,
  endereco VARCHAR(50)
);

CREATE TABLE usuario(
  id SERIAL PRIMARY KEY,
  nome_usuario VARCHAR(50)NOT NULL,
  user_usuario VARCHAR(50)NOT NULL,
  email VARCHAR(50)NOT NULL,
  senha VARCHAR(32)NOT NULL,
  cpf VARCHAR(11)NOT NULL,
  nascimento date,
  endereco VARCHAR(50)
);

CREATE TABLE pedido_item(
  ID SERIAL PRIMARY KEY,
  item int REFERENCES produto(id),
  quantidade_item int
);

CREATE TABLE pedido(
  ID Serial Primary Key,
  item_pedido int REFERENCES pedido_item(id),
  data_pedido date,
  cliente_pedido int REFERENCES cliente(id)
);

CREATE TABLE nota(
 id SERIAL PRIMARY KEY,
nota_produto int REFERENCES pedido(id),
nota_cliente int REFERENCES cliente(id),
nota_usuario int REFERENCES usuario(id)
);

ALTER TABLE produto DROP COLUMN categoria_produto;
ALTER TABLE produto
ADD categoria_produto int REFERENCES categoria(id);

ALTER TABLE produto
ADD cor VARCHAR(20);

INSERT INTO categoria(nome, descricao_categoria)
VALUES
('Infantil','Para vestimentas que vão dos tamanhos 0 a 12'),
('Infantojuvenil','Para vestimentas que vão dos tamanhos 12 ao 17'),
('Feminino','Para vestimentas femininas que vão dos tamanhos PP ao G'),
('Masculino','Para vestimentas masculinas que vão dos tamanhos PP ao G'),
('Feminino Plus Size','Para vestimentas femininas que vão dos tamanhos GG ao EGG'),
('Masculino Plus Size','Para vestimentas masculinas que vão dos tamanhos GG ao EGG');

INSERT INTO funcionario(nome_funcionario, cpf_funcionario)
VALUES
('Arthur','12345678901'), ('Beatriz','23456789012'), ('Guilherme','34567890123'), 
('Gustavo','45678901234'), ('Karina','56789012345'), ('Nuria','67890123456');

INSERT INTO produto(nome_produto, descricao_produto,cor, estoque, fabricacao, valor, categoria_produto, inserido_por)
VALUES
('Polo Manga Curta Fem tam M Azul M', 'Polo feminina de manga curta com 3 botoes, fabricada em algodao, tamanho M','Azul Marinho', '10', '2021-07-30', '49.90', '3', '6'),
('Blusa Manga Longa Masc tam GG Preta', 'Blusa de moletom Masculina de manga longa, fabricada em algodao, tamamnho GG','Preta', '5', '2021-06-25', '79.90', '6', '4'),
('Camisa V Manga longa Masc tam G vinho' , 'Camisa com gola V Masculina de manga longa, fabricada em algodao, tamanho G','Vinho', '10', '2021-05-14', '39.90', '4','2'),
('Camiseta regata herois inf tam 10 branca', 'Camiseta regata infantil estampada com herois, fabricada em algodao, tamanho 10','Branca', '15', '2021-03-04', '19.90', '1','1'),
('Camisa malha Manga Curta Fem tam EG Verde P', 'Camisa de malha simples Feminina, de manga curta, fabricada em algodao tamanho GG','Verde Pastel', '5', '2021-08-24', '29.90', '5','3'), 
('Camisa V Manga longa Masc tam G vinho' , 'Camisa com gola V Masculina de manga longa, fabricada em algodao, tamanho G','Vinho', '10', '2021-05-14', '39.90', '4','2');

UPDATE produto 
SET valor = '49,90' WHERE valor = '49.90';

UPDATE produto
SET valor = '79,90' WHERE valor = '79.90';

UPDATE produto
SET valor = '39,90' WHERE valor = '39.90';

UPDATE produto
SET valor = '19,90' WHERE valor = '19.90';

UPDATE produto
SET valor = '29,90' WHERE valor = '29.90';

UPDATE produto SET valor = '25,90' where valor = '29,90';

DELETE FROM produto WHERE id = 6;

INSERT INTO cliente(nome_cliente, usuario_cliente, email, cpf, nascimento, endereco)
VALUES
('Alberto Rezende','albrez85','albertorez88@gmail.com','14725836914','1988-12-12','rua das Macieiras, 42, Pomares, RJ'),
('Roberto Carvalho','robcar75','robertocarvalho_silva@gmail.com','25825836974','1975-10-14','rua das Pereiras, 900, Pomarlandia, SP'),
('Eduardo Galvão','edugal79','edugalvao79@gmail.com','36936547879','1979-06-24','rua das Castranheiras, 47, Duque de Caxias, RJ'),
('Fernada Montenegro','fefem1925','fefemontenegro@gmail.com','35715985212','1925-02-14','Rua 25 de Março, 325 ap 142, Rio de Janeiro, RJ'),
('Adalgiza Berckgamp','adberck','adalgizaberck@gmail.com','46791346789','1947-08-13','Rua Fernando de Noronha, 47 ap 124, Petropolis, RJ');

INSERT INTO usuario(nome_usuario, user_usuario, email, senha, cpf, nascimento, endereco)
VALUES
('Alberto Rezende','albrez85','albertorez88@gmail.com', 'asdqwe123','14725836914','1988-12-12','rua das Macieiras, 42, Pomares, RJ'),
('Roberto Carvalho','robcar75','robertocarvalho_silva@gmail.com', 'abcd12345','25825836974','1975-10-14','rua das Pereiras, 900, Pomarlandia, SP'),
('Eduardo Galvão','edugal79','edugalvao79@gmail.com','123456789','36936547879','1979-06-24','rua das Castranheiras, 47, Duque de Caxias, RJ'),
('Fernada Montenegro','fefem1925','fefemontenegro@gmail.com','9876543210','35715985212','1925-02-14','Rua 25 de Março, 325 ap 142, Rio de Janeiro, RJ'),
('Adalgiza Berckgamp','adberck','adalgizaberck@gmail.com','a1b2c3d4','46791346789','1947-08-13','Rua Fernando de Noronha, 47 ap 124, Petropolis, RJ')








