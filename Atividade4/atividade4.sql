SELECT * FROM autor;
SELECT * FROM livro WHERE id_autor = 8;

SELECT * FROM livro; 
SELECT * FROM categoria;
SELECT * FROM livro WHERE id_categoria = 6;

UPDATE categoria 
SET nome = 'censurado' WHERE nome = 'filosofia';

SELECT * FROM livro;
DELETE FROM livro
WHERE categoria = 'censurado';

