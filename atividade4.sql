SELECT * FROM autor;
SELECT * FROM livro WHERE id_autor = 4;

SELECT * FROM categoria;
SELECT * FROM livro WHERE id_categoria = 4;

UPDATE categoria 
SET nome = 'censurado' WHERE nome = 'filosofia';

SELECT * FROM livro;
DELETE FROM livro
WHERE categoria = 'censurado';

SET SQL_SAFE_UPDATES = 1;
