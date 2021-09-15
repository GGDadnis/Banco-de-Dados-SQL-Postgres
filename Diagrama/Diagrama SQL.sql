CREATE TABLE "pedido_item" (
  "id" serial PRIMARY KEY,
  "item" int,
  "quantidade_item" int
);

CREATE TABLE "pedido" (
  "id" serial PRIMARY KEY,
  "item_pedido" int,
  "data_pedido" date,
  "cliente_pedido" int
);

CREATE TABLE "nota" (
  "id" serial PRIMARY KEY,
  "nota_produto" int,
  "nota_cliente" int,
  "nota_usuario" int
);

CREATE TABLE "cliente" (
  "id" serial PRIMARY KEY,
  "nome_cliente" vatchar(50),
  "usuario_cliente" varchar(50),
  "email" varchar(50),
  "cpf" varchar(11),
  "nascimento" date,
  "endereco" varchar(50)
);

CREATE TABLE "categoria" (
  "id" serial PRIMARY KEY,
  "nome" varchar(50),
  "descricao_categoria" varchar(100)
);

CREATE TABLE "produto" (
  "id" serial PRIMARY KEY,
  "nome_produto" varchar(50),
  "descricao_produto" varchar(50),
  "estoque" int,
  "fabricacao" date,
  "valor" money,
  "categoria_produto" int,
  "inserido_por" int,
  "cor" varchar(20)
);

CREATE TABLE "funcionario" (
  "id" serial,
  "nome_funcionario" varchar(50),
  "cpf_funcionario" varchar(11)
);

CREATE TABLE "usuario" (
  "id" serial,
  "nome_usuario" varchar(50),
  "user_usuario" varchar(50),
  "email" varchar(50),
  "senha" varchar(50),
  "cpf" varchar(11),
  "nascimento" date,
  "endereco" varchar(50)
);

ALTER TABLE "funcionario" ADD FOREIGN KEY ("id") REFERENCES "produto" ("inserido_por");

ALTER TABLE "produto" ADD FOREIGN KEY ("id") REFERENCES "pedido_item" ("item");

ALTER TABLE "pedido_item" ADD FOREIGN KEY ("id") REFERENCES "pedido" ("item_pedido");

ALTER TABLE "cliente" ADD FOREIGN KEY ("id") REFERENCES "pedido" ("cliente_pedido");

ALTER TABLE "pedido" ADD FOREIGN KEY ("id") REFERENCES "nota" ("nota_produto");

ALTER TABLE "cliente" ADD FOREIGN KEY ("id") REFERENCES "nota" ("nota_cliente");

ALTER TABLE "usuario" ADD FOREIGN KEY ("id") REFERENCES "nota" ("nota_usuario");

ALTER TABLE "categoria" ADD FOREIGN KEY ("id") REFERENCES "produto" ("categoria_produto");
