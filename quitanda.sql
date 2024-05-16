CREATE DATABASE db_quitanda;
-- criando um banco de dados 
-- isso é um comentário
USE db_quitanda;

-- criando tabelas 
CREATE TABLE tb_produtos (
id BIGINT AUTO_INCREMENT, -- vai incrementar 1 sempre que for adicionado um registro , então automaticamente vai gerar um novo ID
-- bigint suporta uma grande quantidade de dados
nome VARCHAR(255) NOT NULL, -- not null quer dizer que não pode ser nulo esse campo
-- 255 é o tamanho do campo , ou seja , quantos caracteres no max  esse nome tem 
quantidade int,
datavalidade DATE,
preco DECIMAL NOT NULL, -- se eu quiser já posso colocar (10,2) na frente de DECIMAL : 10 digitos antes da virgula e 2 após a virgula , 
PRIMARY KEY(id) -- chave primária , e dentro dos () eu coloco qual dado acima será a chave , no caso será ID
);

-- inserindo dados na tabela 
INSERT INTO  tb_produtos ( -- essa ordem tem que ser a mesma que está na tabela acima 
nome,                       -- a chave primaria não está aqui porque ela é auto increment
quantidade,
datavalidade,
preco)

VALUES ("Tomate",20, "2024-12-31", 8.00); -- o que for texto é entre aspas duplas, data é considerado text
                                          -- numeros decimais eu coloco o ponto ao invés de virgula
                                          -- a data é em formato americano ANO-MES-DIA
                                          
-- inserindo varias linhas
INSERT INTO  tb_produtos ( nome,quantidade,datavalidade,preco)
VALUES 
("Maçã", 20, "2023-12-15", 5.00),
("Laranja", 50, "2023-12-15", 10.00),
("Banana", 200, "2023-12-15", 12.00),
("Uva", 1200, "2023-12-15", 30.00),
("Pêra", 500, "2023-12-15", 2.99);

-- exebindo os dados da tabela

SELECT * FROM tb_produtos; -- Está selecionando tudo que está na tabela 

-- exibir apenas uma coluna da tabela 
-- SELECT sempre retorna dados 
-- primeiro coloco o nome da coluna e depois a tabela
SELECT nome FROM tb_produtos; 
-- duas colunas 
SELECT nome , preco FROM tb_produtos;

-- esse AS na frente da coluna que quero renomear
-- a coluna preco está sem o Ç , então eu renomei deixando para exibir com o nome o PREÇO 
-- Entre aspas posso colocar 1 ou mais palavras 
SELECT nome , preco  AS "preço do produto" FROM tb_produtos;

-- exbir apenas uma linha (tupla)
-- uso o where para buscar um campo especifico

SELECT * FROM tb_produtos WHERE id = 1;

-- operadores relacionais
SELECT * FROM tb_produtos WHERE id > 1;
SELECT * FROM tb_produtos WHERE id <= 1;
SELECT * FROM tb_produtos WHERE nome = "tomate";
SELECT * FROM tb_produtos WHERE nome = "maçã";

-- operadores lógicos
SELECT * FROM tb_produtos WHERE preco > 5 AND quantidade > 201;

-- posso selecionar a coluna que eu quero e as linhas que eu quero bsucar dentro delas 
SELECT nome , quantidade  FROM tb_produtos WHERE preco > 5 AND quantidade > 100;
SELECT nome , quantidade  FROM tb_produtos WHERE preco > 5 OR quantidade > 100;

-- posso colocar entre () o que eu quero priorizar 
SELECT nome , quantidade  FROM tb_produtos WHERE (preco > 5 OR quantidade > 201) AND nome <> "Tomate";

-- alteração de estrutura de uma tabela
-- entre (), vai dizer que tem até 6 digitos antes da virgula , e  dois depois da virgula 
-- usar a palavra MODIFY para indicar o que quero modificar e na frente o que eu quero
 -- mas posso colocar direto na criação tabela 
ALTER TABLE tb_produtos MODIFY preco DECIMAL(6,2) ;
SELECT * FROM tb_produtos;

-- incluir nova coluna 
ALTER TABLE tb_produtos ADD descricao VARCHAR(255);

-- Alterar um registro do banco de dados 
-- NUNCA esquecer o WHERE para garantir que estou alterando o dado certo
-- Lembrando que se eu não colocar a  informação da quantidade de casas decimais por exemplo no inicio da criação da tabela 
-- eu preciso usar esse UPDATE para arrumar manualmente , se não ele continuará retornando o valor arredondado 
-- exemplo p: pera = 2.99 , altero para casa decidial(6,2) pera agora vale 3.00 
-- ou seja , ele apenas arredondou e acrescentou as casas após a virgula
-- para isso não acontecer tenho duas opções 
-- Ou colocar direto na crianção ta tabela 
-- ou fazer o update depois alterando o dado 
-- UPDATE altera dados e ALTER altero a ESTRUTURA
UPDATE tb_produtos SET preco = 8.99 WHERE id = 1;
UPDATE tb_produtos SET preco = 2.99 WHERE id = 10;
SELECT * FROM tb_produtos;

-- trava de segurança caso precise SET SQL_SAFE_UPDATES = 0; se eu quiser ativar novamente eu coloco no lgar do 0 o 1 

-- Apagando dados da tabela 
DELETE FROM tb_produtos WHERE id = 2 ; 
SELECT * FROM tb_produtos;
DELETE FROM tb_produtos WHERE id > 1 AND id < 6 ; -- apaguei varias linhas que estavam aparecendo tomate repetido 

-- apaga a tabela 
DROP TABLE td_produtos;

-- DROP DATABASE db_quitanda APAGA O BANCO DE DADOS INTEIRO






