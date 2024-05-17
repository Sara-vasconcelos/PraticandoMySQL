CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_pizzas(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
sabor VARCHAR(255) NOT NULL,
preco DECIMAL(6,2) NOT NULL,
quantidade int,
tamanho VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);

SELECT * FROM tb_pizzas;

INSERT INTO tb_pizzas(nome,sabor,preco,quantidade,tamanho)VALUES
("Americana", "Presunto,Ovos,Mussarela,Bacon",50.00,10,"Média"), -- pizza salgada 1
("Baiana", "Presunto,Calabresa,Mussarela,Bacon",5.00,8,"Pequena"), -- esfiha salgada 2
("Baby", "Frango,Calabresa,Mussarela,Bacon,Requeijão",6.00,15,"Grande"), --  esfiha salgada 3
("Paulista", "Presunto,Brócolis,Mussarela,Bacon",25.00,8,"Broto"), -- pizza salgada 4
("Brasileira", "Milho,Frango,Mussarela,Ervilha",55.00,9,"Média"), -- esfiha salgada 5
("Moda do Cliente", "Escolha do cliente",110.00,5,"Grande"), -- pizza salgada  6
("Caipira", "Presunto,Frango,Milho,Requeijão",45.00,10,"Média"), -- pizza salgada 7
("Prestigio", "Coco, Chocolate",10.00,3,"Média"),-- esfiha doce 8
("Moranguinho", "Morango, Chocolate branco",7.00,8,"Grande"),-- esfiha doce 9
("Romeu e Julieta ", "Mussarela,Goiabada",35.00,8,"Broto"), -- pizza doce 10
("ChocoMango", "Chocolate , Morango",40.00,8,"Broto"); -- pizza doce 11

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
descricao VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

SELECT * FROM tb_categorias;

INSERT INTO tb_categorias (descricao) VALUES
("Esfiha Doce"),
("Esfiha Salgada"),
("Pizza Doce"),
("Pizza Salgada ");

ALTER TABLE tb_pizzas ADD categoriaid BIGINT;
SELECT * FROM tb_pizzas;



-- Relacionamento 
-- References : Pergunta qual é a referencia , ou seja , ela veio de onde?
ALTER TABLE  tb_pizzas ADD CONSTRAINT fk_pizzas_categorias
FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id);

UPDATE tb_pizzas SET categoriaid = 4 WHERE id = 1;
UPDATE tb_pizzas SET categoriaid = 2 WHERE id = 2;
UPDATE tb_pizzas SET categoriaid = 2 WHERE id = 3;
UPDATE tb_pizzas SET categoriaid = 4 WHERE id = 4;
UPDATE tb_pizzas SET categoriaid = 2 WHERE id = 5;
UPDATE tb_pizzas SET categoriaid = 4 WHERE id = 6;
UPDATE tb_pizzas SET categoriaid = 4 WHERE id = 7;
UPDATE tb_pizzas SET categoriaid = 1 WHERE id = 8;
UPDATE tb_pizzas SET categoriaid = 1 WHERE id = 9;
UPDATE tb_pizzas SET categoriaid = 3 WHERE id = 10;
UPDATE tb_pizzas SET categoriaid = 3 WHERE id = 11;

UPDATE tb_pizzas SET preco = 5.00 WHERE id = 5;
SELECT * FROM tb_pizzas;

SELECT nome, sabor,preco, quantidade, tamanho , tb_categorias.descricao
FROM tb_pizzas INNER JOIN tb_categorias  -- junta as tabelas  , pegando o que tem em comum 
ON tb_pizzas.categoriaid = tb_categorias.id; -- faz a comparação e pega somente se estiver certo

-- Quero selecionar apenas as PIZZAS salgadas e doces que o preço é maior que 45
-- Primeiro eu faço a  pesquisa com o INNER JOIN  para fazer o relcionamento 
-- Depois eu faço o filtro onde eu pego apenas as linhas que tem Pizza salgada e Doce 
SELECT nome, sabor,preco, quantidade, tamanho , tb_categorias.descricao 
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoriaid = tb_categorias.id
WHERE tb_categorias.descricao LIKE "%pizza%" AND preco > 45; -- O like ignora se a letra é maiuscula ou minuscula 
-- %pizza% vai buscar todos os campos que tem pizza no nome , depois pega o que o preço for maior que 45  

SELECT nome, sabor,preco, quantidade, tamanho , tb_categorias.descricao 
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoriaid = tb_categorias.id
WHERE tb_categorias.descricao LIKE "%pizza%" AND preco BETWEEN 50 AND 100; -- intervalo

SELECT nome, sabor,preco, quantidade, tamanho , tb_categorias.descricao 
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoriaid = tb_categorias.id
WHERE tb_categorias.descricao LIKE "%pizza%" AND  nome LIKE "%m%"; -- Buscou somente pizzas e tem o M no nome 

SELECT nome, sabor,preco, quantidade, tamanho , tb_categorias.descricao 
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoriaid = tb_categorias.id
WHERE tb_categorias.descricao LIKE "%doce%" AND descricao LIKE  "%pizza%";

SELECT * FROM tb_pizzas;





