/*usei o comando create database para criar um banco de dados*/
CREATE DATABASE biblioteca_pessoal_1s2026;
/*usei o codigo use para mostrar qual biblioteca usar*/
USE  biblioteca_pessoal_1s2026;
SHOW TABLES;

CREATE TABLE usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(255) NOT NULL, 
email VARCHAR(128) NOT NULL UNIQUE, 
data_cadastro DATE DEFAULT(CURRENT_DATE) NOT NULL
);






