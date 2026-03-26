CREATE DATABASE biblioteca;
USE biblioteca;


CREATE TABLE usuario(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(255) NOT NULL, 
    email VARCHAR(128) NOT NULL UNIQUE, 
    data_cadastro DATE DEFAULT(CURRENT_DATE) NOT NULL
);


ALTER TABLE usuario
MODIFY COLUMN data_cadastro TIMESTAMP NOT NULL;

ALTER TABLE usuario
ADD COLUMN data_atualizacao TIMESTAMP NOT NULL;


CREATE TABLE livro(
    id_livro INT PRIMARY KEY AUTO_INCREMENT, 
    sinopse TEXT, 
    autor VARCHAR(128) NOT NULL, 
    editora VARCHAR(128) NOT NULL, 
    categoria VARCHAR(128) NOT NULL, 
    ano_publicacao DATE NOT NULL
);

ALTER TABLE livro
DROP COLUMN autor,
DROP COLUMN editora,
DROP COLUMN categoria;


ALTER TABLE livro
ADD COLUMN titulo VARCHAR(255) NOT NULL,
ADD COLUMN lido BOOLEAN NOT NULL,
ADD COLUMN data_cadastro TIMESTAMP NOT NULL,
ADD COLUMN data_atualizacao TIMESTAMP NOT NULL,
ADD COLUMN id_usuario INT,
ADD COLUMN id_autor INT,
ADD COLUMN id_editora INT,
ADD COLUMN id_categoria INT;



CREATE TABLE categoria(
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(128) NOT NULL UNIQUE,
    descricao TEXT NOT NULL,
    data_cadastro TIMESTAMP NOT NULL,
    data_atualizacao TIMESTAMP NOT NULL
);


CREATE TABLE autor(
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    ano_nascimento YEAR NOT NULL,
    ano_morte YEAR,
    apresentacao TEXT NOT NULL,
    data_cadastro TIMESTAMP NOT NULL,
    data_atualizacao TIMESTAMP NOT NULL
);


CREATE TABLE editora(
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    cidade VARCHAR(64) NOT NULL,
    estado VARCHAR(64) NOT NULL,
    pais VARCHAR(64) NOT NULL,
    data_cadastro TIMESTAMP NOT NULL, 
    data_atualizacao TIMESTAMP NOT NULL
);


ALTER TABLE livro
ADD CONSTRAINT fk_livro_usuario
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
ON DELETE CASCADE;

ALTER TABLE livro
ADD CONSTRAINT fk_livro_autor
FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
ON DELETE RESTRICT;

ALTER TABLE livro
ADD CONSTRAINT fk_livro_editora
FOREIGN KEY (id_editora) REFERENCES editora(id_editora)
ON DELETE RESTRICT;

ALTER TABLE livro
ADD CONSTRAINT fk_livro_categoria
FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
ON DELETE RESTRICT;

SHOW TABLES;





