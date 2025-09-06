-- Criação da tabela filmes
CREATE TABLE filmes(
	id INT NOT NULL,             -- identificador único do filme
    titulo VARCHAR(20),          -- título do filme (limite 20 caracteres → pode ser pouco!)
    gerenero VARCHAR(20),        -- (erro de digitação → corrigido abaixo)
    duracao INT                  -- duração do filme em minutos
);

-- Definindo a chave primária
ALTER TABLE filmes 
ADD PRIMARY KEY (id);

-- Adicionando nova coluna para produtora
ALTER TABLE filmes
ADD produtora VARCHAR(20);

-- Corrigindo erro de digitação de "gerenero" para "genero"
ALTER TABLE filmes
CHANGE gerenero genero VARCHAR(20);

-- Inserindo registros na tabela
INSERT INTO filmes (id, titulo, genero, duracao, produtora)	
VALUES 
    (1,'Alto da compadecida','Comédia', 104, 'Globo filmes'),
	(2,'Lisbela e o prisioneiro','Comédia romântica', 106, 'Globo filmes'), 
    (3,'Batman Begins','Ação/Aventura', 240, 'Wanner bros'),
    (4,'Batman o Cavaleiro das Trevas','Ação', 100, 'Wanner bros');

-- Atualizando um registro (mudando título do filme id=2)
UPDATE filmes 
SET titulo = 'Lisbela'
WHERE id = 2;

-- Removendo um registro (id=4)
DELETE FROM filmes
WHERE id = 4;

-- Selecionando todos os registros
SELECT * FROM filmes;

-- Filmes com duração entre 100 e 150 minutos
SELECT * FROM filmes 
WHERE duracao BETWEEN 100 AND 150; 

-- Filmes cujo título começa com "A"
SELECT * FROM filmes 
WHERE titulo LIKE 'A%';	

-- Filmes de gêneros específicos
SELECT * FROM filmes 
WHERE genero IN ('Ação/Aventura', 'Comédia'); 

-- Valor máximo de id
SELECT MAX(id)
FROM filmes;

-- Valor mínimo de id
SELECT MIN(id)
FROM filmes;

-- Média dos ids
SELECT AVG(id)
FROM filmes;

-- Soma dos ids
SELECT SUM(id) 
FROM filmes;

-- Agrupando por gênero e contando quantos filmes há em cada
SELECT genero, COUNT(*)
FROM filmes 
GROUP BY genero;

-- Agrupando por gênero e mostrando apenas os que têm mais de 1 filme
SELECT genero, COUNT(*)
FROM filmes
GROUP BY genero 
HAVING COUNT(*) > 1;
