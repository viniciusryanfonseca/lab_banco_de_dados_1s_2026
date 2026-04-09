/**  */

/** DELETA O SCHEMA DO BD SE EXISTIR */
DROP DATABASE IF EXISTS  biblioteca_pessoal_1s2026;

/** CRIA E SELECIONA UM SCHEMA DE BD */
CREATE DATABASE biblioteca_pessoal_1s2026;
USE biblioteca_pessoal_1s2026;

/** CRIA TABELAS, RELAÇÕES E RESTRIÇÕES */
CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE categoria(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) UNIQUE,
    descricao TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE autor(
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    ano_nascimento INT,
    ano_morte INT,
    apresentacao TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE editora(
	id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    cidade VARCHAR(255),
    estado VARCHAR(255),
    pais VARCHAR(255),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE livro(
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_autor INT,
    id_editora INT,
    id_categoria INT, 
    titulo VARCHAR(255) NOT NULL,
    sinopse TEXT,
    ano_publicacao INT,
    lido BOOLEAN DEFAULT(0),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	CONSTRAINT fk_usuario_livro FOREIGN KEY (id_usuario) 
    REFERENCES usuario(id_usuario)
    ON DELETE CASCADE,
    
    CONSTRAINT fk_autor_livro FOREIGN KEY (id_autor) 
    REFERENCES autor(id_autor)
    ON DELETE RESTRICT,
    
    CONSTRAINT fk_editora_livro FOREIGN KEY (id_editora) 
    REFERENCES editora(id_editora)
    ON DELETE RESTRICT,
    
    CONSTRAINT fk_categoria_livro FOREIGN KEY (id_categoria) 
    REFERENCES categoria(id_categoria)
    ON DELETE RESTRICT
);


INSERT INTO usuario (nome, email, senha) VALUES
('Ana Silva', 'ana@email.com', '123'),
('Bruno Souza', 'bruno@email.com', '123'),
('Carla Mendes', 'carla@email.com', '123');

/** CATEGORIAS */
INSERT INTO categoria (nome, descricao) VALUES
('Ficção Científica', 'Livros com temas futuristas e científicos'),
('Fantasia', 'Mundos imaginários e mágicos'),
('Romance', 'Histórias centradas em relações humanas'),
('Clássicos', 'Obras consagradas da literatura'),
('Suspense', 'Narrativas de tensão e mistério'),
('Filosofia', 'Reflexões filosóficas');

/** AUTORES */
INSERT INTO autor (nome, ano_nascimento, ano_morte) VALUES
('George Orwell', 1903, 1950),
('J.R.R. Tolkien', 1892, 1973),
('Jane Austen', 1775, 1817),
('Machado de Assis', 1839, 1908),
('Agatha Christie', 1890, 1976),
('Isaac Asimov', 1920, 1992),
('Fyodor Dostoevsky', 1821, 1881),
('J.K. Rowling', 1965, NULL),
('Stephen King', 1947, NULL),
('Aldous Huxley', 1894, 1963);

/** EDITORAS */
INSERT INTO editora (nome, cidade, estado, pais) VALUES
('Penguin Books', 'Londres', NULL, 'Reino Unido'),
('HarperCollins', 'Nova York', 'NY', 'EUA'),
('Companhia das Letras', 'São Paulo', 'SP', 'Brasil'),
('Editora Record', 'Rio de Janeiro', 'RJ', 'Brasil'),
('Rocco', 'Rio de Janeiro', 'RJ', 'Brasil');

/** LIVROS (42 REGISTROS) */

/** Usuário 1 */
INSERT INTO livro (id_usuario, id_autor, id_editora, id_categoria, titulo, ano_publicacao, lido) VALUES
(1,1,1,4,'1984',1949,1),
(1,1,1,1,'Animal Farm',1945,1),
(1,2,1,2,'The Hobbit',1937,1),
(1,2,1,2,'The Lord of the Rings',1954,0),
(1,3,1,3,'Pride and Prejudice',1813,1),
(1,3,1,3,'Sense and Sensibility',1811,0),
(1,4,3,4,'Dom Casmurro',1899,1),
(1,4,3,4,'Memórias Póstumas de Brás Cubas',1881,0),
(1,5,2,5,'Murder on the Orient Express',1934,1),
(1,5,2,5,'And Then There Were None',1939,0),
(1,6,2,1,'Foundation',1951,1),
(1,6,2,1,'I, Robot',1950,0),
(1,7,1,6,'Crime and Punishment',1866,1),
(1,7,1,6,'The Brothers Karamazov',1880,0);

/** Usuário 2 */
INSERT INTO livro (id_usuario, id_autor, id_editora, id_categoria, titulo, ano_publicacao, lido) VALUES
(2,8,5,2,'Harry Potter and the Sorcerer''s Stone',1997,1),
(2,8,5,2,'Harry Potter and the Chamber of Secrets',1998,1),
(2,8,5,2,'Harry Potter and the Prisoner of Azkaban',1999,0),
(2,9,2,5,'The Shining',1977,1),
(2,9,2,5,'It',1986,0),
(2,9,2,5,'Misery',1987,1),
(2,10,1,1,'Brave New World',1932,1),
(2,10,1,1,'Island',1962,0),
(2,1,1,1,'Homage to Catalonia',1938,0),
(2,6,2,1,'The Caves of Steel',1953,1),
(2,6,2,1,'The Naked Sun',1957,0),
(2,5,2,5,'Death on the Nile',1937,1),
(2,3,1,3,'Emma',1815,0),
(2,4,3,4,'Quincas Borba',1891,1);

/** Usuário 3 */
INSERT INTO livro (id_usuario, id_autor, id_editora, id_categoria, titulo, ano_publicacao, lido) VALUES
(3,7,1,6,'Notes from Underground',1864,1),
(3,7,1,6,'The Idiot',1869,0),
(3,2,1,2,'Silmarillion',1977,0),
(3,2,1,2,'Unfinished Tales',1980,0),
(3,8,5,2,'Harry Potter and the Goblet of Fire',2000,1),
(3,8,5,2,'Harry Potter and the Order of the Phoenix',2003,0),
(3,9,2,5,'Carrie',1974,1),
(3,9,2,5,'Pet Sematary',1983,0),
(3,10,1,1,'Doors of Perception',1954,1),
(3,6,2,1,'Prelude to Foundation',1988,0),
(3,6,2,1,'Forward the Foundation',1993,0),
(3,5,2,5,'The ABC Murders',1936,1),
(3,4,3,4,'Helena',1876,0),
(3,3,1,3,'Mansfield Park',1814,1);


SELECT * FROM usuario;
SELECT * FROM autor;
SELECT * FROM editora;
SELECT * FROM categoria;




