CREATE SCHEMA `Desafio_Dia`;
USE Desafio_dia; 

CREATE TABLE pessoa (
	nome VARCHAR(100) NOT NULL,
    data_nasc DATE, 
    sexo VARCHAR(10), 
    cpf VARCHAR(50),
    PRIMARY KEY(cpf)
);

CREATE TABLE telefone (
	numero VARCHAR(11), 
    operadora VARCHAR(10),
    plano VARCHAR(50),
    modelo VARCHAR(50),
    PRIMARY KEY(numero)
);

ALTER TABLE telefone
ADD cpf CHAR(11);

ALTER TABLE telefone
ADD CONSTRAINT fk_pessoa
FOREIGN KEY (cpf) REFERENCES pessoa(cpf);

INSERT INTO pessoa (cpf, nome, data_nasc, sexo)
VALUES 
('11111111111', 'Ana Souza', '1995-03-15', 'Feminino'),
('22222222222', 'Bruno Lima', '1988-07-22', 'Masculino'),
('33333333333', 'Carla Mendes', '2000-12-01', 'Feminino'),
('44444444444', 'Diego Oliveira', '1992-05-09', 'Masculino'),
('55555555555', 'Eduarda Silva', '1999-08-17', 'Feminino'),
('66666666666', 'Felipe Costa', '1991-10-30', 'Masculino'),
('77777777777', 'Gabriela Rocha', '1997-01-25', 'Feminino'),
('88888888888', 'Henrique Santos', '1985-11-11', 'Masculino'),
('99999999999', 'Isabela Martins', '1993-04-14', 'Feminino'),
('10101010101', 'João Pedro', '2001-09-05', 'Masculino'); 

INSERT INTO telefone (numero, operadora, plano, modelo, cpf)
VALUES
('11987654321', 'Vivo', 'Pré-pago', 'iPhone 13', '11111111111'),
('21912345678', 'Claro', 'Pós-pago', 'Samsung S21', '22222222222'),
('31955554444', 'Tim', 'Controle', 'Motorola G10', '33333333333'),
('41933332222', 'Oi', 'Pré-pago', 'Xiaomi Redmi 9', '44444444444'),
('51977778888', 'Vivo', 'Pós-pago', 'iPhone 12', '55555555555'),
('61922223333', 'Claro', 'Controle', 'Samsung A32', '66666666666'),
('71911112222', 'Tim', 'Pré-pago', 'Motorola Edge', '77777777777'),
('81944445555', 'Oi', 'Pós-pago', 'Xiaomi Poco X3', '88888888888'),
('91966667777', 'Vivo', 'Controle', 'iPhone 14', '99999999999'),
('11999998888', 'Claro', 'Pré-pago', 'Samsung S20', '10101010101');

UPDATE telefone
SET plano = 'Pós-pago'
WHERE numero = '11987654321';

DELETE FROM pessoa
WHERE cpf = '10101010101';

DELETE FROM telefone
WHERE cpf = '10101010101';

SELECT * FROM pessoa;

SELECT COUNT(*) AS total_telefones FROM telefone;

SELECT MIN(YEAR(CURDATE()) - YEAR(data_nasc)) AS idade_minima FROM pessoa;

SELECT MAX(YEAR(CURDATE()) - YEAR(data_nasc)) AS idade_maxima FROM pessoa;

SELECT sexo, COUNT(*) AS total
FROM pessoa
GROUP BY sexo;

SELECT operadora, COUNT(*) AS total_telefones
FROM telefone
GROUP BY operadora;

SELECT p.nome, t.numero, t.operadora, t.plano
FROM pessoa p
JOIN telefone t ON p.cpf = t.cpf;




