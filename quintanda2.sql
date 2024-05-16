CREATE DATABASE db_quitanda2;
USE db_quitanda2;

-- CRIAR A TABELA DE PRODUTOS
CREATE TABLE tb_produtos2(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade INT,
    datavalidade DATE,
    preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id)
);

SELECT * FROM tb_produtos2;

INSERT INTO tb_produtos2(nome, quantidade, datavalidade, preco) VALUES 
("tomate",100, "2023-12-15", 8.00),
("maçã",20, "2023-12-15", 5.00),
("laranja",50, "2023-12-15", 10.00),
("banana",200, "2023-12-15", 12.00),
("uva",1200, "2023-12-15", 30.00),
("pêra",500, "2023-12-15", 2.99);

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
descricao VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);
SELECT * FROM tb_categorias;
INSERT INTO tb_categorias (descricao) VALUES 
("Frutas"),
("Verduras"),
("Legumes"),
("Temperos"),
("Ovos"),
("Outros");

-- a chave estrangeira tem que ter o mesmo tipo da chave primaria 
-- nesse caso a categoriaid vai ser a chave estrangeira que vai vim da tabela CATEGORIA , e esse campo precisa ter o mesmo tipo que o id dessa tabela 
-- Ou seja , os dois são BIGINT 
ALTER TABLE tb_produtos2 ADD categoriaid BIGINT;
SELECT * FROM tb_produtos2;

-- alter table também faz relacionamento
-- constraint : regra ou trava 
-- fk abreviação em ingles  para criar uma chave instrageira
-- fk_produtos_categorias : dessa forma está dizendo que é uma chave estrangeira que está dentro de  produtos e veio de categorias
-- é apenas uma forma padrão de escrever
-- forein key : tem que colocar qual é o nome da chave estrangeira
-- References : Pergunta qual é a referencia , ou seja , ela veio de onde?

ALTER TABLE tb_produtos2 ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id);

SELECT * FROM tb_produtos2;

-- aqui ele está acrescentando o id 3 que é da tabela categoria , na linha da tabela produto que tem ID igual a 1 , os outros seguem a mesma lógica
UPDATE tb_produtos2 SET categoriaid = 3 WHERE id = 1;
UPDATE tb_produtos2 SET categoriaid = 1 WHERE id = 2;
UPDATE tb_produtos2 SET categoriaid = 1 WHERE id = 3;
UPDATE tb_produtos2 SET categoriaid = 1 WHERE id = 4;
UPDATE tb_produtos2 SET categoriaid = 1 WHERE id = 5;
UPDATE tb_produtos2 SET categoriaid = 1 WHERE id = 6;

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos2 (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Grapefruit", 3000, "2022-03-13", 50.00, 1);

INSERT INTO tb_produtos2 (nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos2 (nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

SELECT * FROM tb_produtos2;

-- vai ordernar a coluna preco , e ASC vai deixar o mais menor para o maior 
-- DESC do maior para o menor 
-- Se eu não passar nem ASC nem DESC , ele ordena por padrão do menor para o maior 

SELECT * FROM tb_produtos2 ORDER BY preco ASC;
-- AVG é a média 
-- dentro de () eu coloco onde eu quero fazer a media 
-- Media , é o nome que criei 
SELECT AVG(preco) Media from tb_produtos2;

-- vai selecionar tudo que começa com MA , e termina com qualquer coisa (%)
-- Lembrando que é usado com string 
SELECT * FROM tb_produtos2 WHERE nome LIKE "ma%";
-- LIKE : Tipo
-- vai selecionar todos que tem o ra no nome , mas que começa e termina com qualquer coisa 
SELECT * FROM tb_produtos2 WHERE nome LIKE "%ra%";

-- Seleciona da tabela produto na coluna nome , onde tem ra no nome , e preco seja menor que 10 e depois ordene
SELECT * FROM tb_produtos2 WHERE nome LIKE "%ra%" AND preco < 10 ORDER BY preco ASC;


-- seleciona nome,preco,qauntidade da tabela de produtos e tbm a descricao que está na tabela categoria 
-- e pegue somente na tabela categoria , onde a tb_categoriaid seja igual ao id que tem na tabela de categoria  
-- entao ele apaga os produtos 

SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos2 INNER JOIN tb_categorias  -- junta as tabelas  , pegando o que tem em comum 
ON tb_produtos2.categoriaid = tb_categorias.id; -- faz a comparação e pega somente se estiver certo



SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos2 LEFT JOIN tb_categorias  -- Trás o que tem antes do join , então no caso vem todos os produtos da tabela produtos  até os que não tem descrição
ON tb_produtos2.categoriaid = tb_categorias.id; -- faz a comparação e pega somente se estiver certo

SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos2 RIGHT  JOIN tb_categorias  -- Trás tudo
ON tb_produtos2.categoriaid = tb_categorias.id; -- faz a comparação e pega somente se estiver certo


-- vai fazer a mesma coisa que os anteriores , porém vai selecionar as categorias e trazer a média por grupo.

SELECT tb_categorias.Descricao ,  AVG(Preco) Preço_Médio
FROM tb_produtos2 INNER JOIN tb_categorias 
ON tb_categorias.Id = tb_produtos2.CategoriaId
GROUP BY tb_categorias.Descricao;


