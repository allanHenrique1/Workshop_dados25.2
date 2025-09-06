CREATE TABLE filmes(
	id int NOT NULL,
    titulo varchar(20),
    gerenero varchar(20),
    duracao int
);

ALTER TABLE filmes 
ADD PRIMARY KEY (id);

ALTER TABLE filmes
ADD produtora VARCHAR(20);

ALTER TABLE filmes
CHANGE gerenero genero VARCHAR(20);

INSERT INTO 
filmes (id,titulo,genero,duracao,produtora)	
VALUES (1,'Alto da compadecida','Comédia', 104, 'Globo filmes'),
	   (2,'Lisbela e o prisioneiro','Comédia romântica', 106, 'Globo filmes'), 
       (3, 'Batman Begins','Ação/Aventura', 240,'Wanner bros'),
       (4, 'Batman o Cavaleiro das Trevas','Ação', 100,'Wanner bros');

UPDATE filmes 
SET titulo = 'Lisbela'
WHERE id = 2;

DELETE FROM filmes
WHERE id = 4;

SELECT * FROM filmes;

SELECT * FROM filmes 
WHERE duracao BETWEEN  100 AND 150; 

SELECT * FROM filmes 
WHERE titulo LIKE 'A%';	

SELECT * FROM filmes 
WHERE genero IN ('Ação/Aventura', 'Comédia'); 

SELECT MAX(id)
FROM filmes;

SELECT MIN(id)
FROM filmes;

SELECT AVG(id)
FROM filmes;

SELECT SUM(id) 
FROM filmes;

SELECT genero, COUNT(*)
FROM filmes 
GROUP BY genero;

SELECT genero, COUNT(*)
FROM filmes
GROUP BY genero 
HAVING COUNT(*) > 1;