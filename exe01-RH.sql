CREATE DATABASE db_controleRH; -- Banco de dados de controle do RH
USE db_controleRH;

-- Criação da tabela
CREATE TABLE tb_colaboradores (
id BIGINT AUTO_INCREMENT, 
nome VARCHAR(255) NOT NULL,
cargo VARCHAR(255) NOT NULL,
telefone VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL, 
salario DECIMAL (6,3)NOT NULL,
pcd VARCHAR(255) ,
PRIMARY KEY (id)
);

SELECT * FROM tb_colaboradores; -- Selecionando a tabela (entidade)

-- Adicionando os registros das linhas  (tuplas)
INSERT INTO  tb_colaboradores (nome,cargo,telefone,email,salario,pcd) VALUES
("Sara Vasconcelos", "Gerente de Desenvolvimento de Software", "(11)-97233-8400","vasconcelossara11@gmail.com", 50.000,"não"),
("Lucas Ribeiro", "Desenvolvedora Backend", "(13)-97255-8200","lucas@gmail.com", 2.000, "sim"),
("Maria Josefina", "Desenvolvedora Frontend", "(12)-97433-9400","josefinamaria@gmail.com", 2.500, "não"),
("Leticia Silva", "Engenheiro de Software", "(35)-97213-2200","leticia@gmail.com", 8.000,"não"),
("Jose Bonifácio", "Analista de Dados Júnior", "(11)-92233-7400","bonifacio11@gmail.com", 1.600, "sim"),
("Tereza Augusta", "Desenvolvedora FullStack", "(11)-94233-6400","Tereza@gmail.com", 10.000, "sim"),
("Vanessa Lopes", "Desenvolvedora FullStack", "(84)-95233-7400","lopesvanessa@gmail.com", 10.000,"não"),
("João Miguel", "Porteiro", "(84)-95213-7420","joão@gmail.com", 2.500,"não"),
("Miriam Souza", "Jovem Aprendiz ", "(11)-95213-7420","miriam@gmail.com", 1.000,"não"),
("Michele Souza ", "Estagiaria", "(11)-95213-7420","michele@gmail.com", 1.400,"sim"),
("Priscila Souza ", "Auxiliar de Limpeza", "(84)-95213-7423","prisouza@gmail.com", 2.000,"não"),
("João Batista", "Educador", "(84)-93213-7420","batistajoao@gmail.com", 2.500,"sim");



SELECT * FROM tb_colaboradores;

SELECT * FROM tb_colaboradores WHERE salario > 2.000; -- Retorna todos os colaboradores que tem um salário maior que 2000
SELECT * FROM tb_colaboradores WHERE salario < 2.000; -- Retorna todos os colaboradores que tem um salário menor que 2000 

UPDATE tb_colaboradores SET  salario = 2.500 WHERE id = 17; -- Alterei o salário do colaborador com id 17
SELECT * FROM tb_colaboradores;
UPDATE tb_colaboradores SET  cargo = "Analista de dados Pleno" WHERE id = 17; -- Alterei o cargo do mesmo

UPDATE tb_colaboradores SET  salario = 100.000 WHERE id = 13; 
UPDATE tb_colaboradores SET  cargo = "CEO" WHERE id = 13; 
SELECT * FROM tb_colaboradores;



