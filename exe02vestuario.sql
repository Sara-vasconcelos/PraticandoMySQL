CREATE DATABASE  db_ecommerce;
USE db_ecommerce;

CREATE TABLE tb_vestuario (
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
quantidade int,
tamanho VARCHAR(10) NOT NULL,
sexo VARCHAR(255) NOT NULL,
preco DECIMAL(6,2) NOT NULl,
PRIMARY KEY (id)
);

SELECT * FROM tb_vestuario; -- Selecionando a tabela (entidade)

INSERT INTO  tb_vestuario (nome,quantidade,tamanho,sexo,preco) VALUES
("Calça Jeans",30, "M","Masculino", 300.00),
("Calça Jeans",30, "P","Feiminino", 200.00),
("Vestido",20, "GG","Feiminino", 55.00),
("Vestido",40, "P","Feiminino", 55.00),
("Short de linho",5, "M","Masculino", 100.00),
("Saia jeans",15, "G","Feiminino", 80.00),
("Camisa Social",30, "M","Masculino", 300.00),
("Blusa de linho",35, "M","Feiminino", 50.00);
SELECT * FROM tb_vestuario;


ALTER TABLE tb_vestuario ADD cor VARCHAR(255);

UPDATE tb_vestuario SET cor = "preto" WHERE id = 1 OR id = 6;
UPDATE tb_vestuario SET cor = "Azul" WHERE id = 2;
UPDATE tb_vestuario SET cor = "Bege" WHERE id = 5;
UPDATE tb_vestuario SET cor = "Vinho" WHERE id = 3 OR id =7;
UPDATE tb_vestuario SET cor = "preto" WHERE id = 4 OR id = 8;

UPDATE tb_vestuario SET preco = 550 WHERE id = 1 OR id =7;
UPDATE tb_vestuario SET preco = 600 WHERE id = 3 OR id =6;

SELECT * FROM tb_vestuario WHERE preco > 500;
SELECT * FROM tb_vestuario WHERE preco < 500;

