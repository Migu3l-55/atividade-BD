DROP DATABASE IF EXISTS jdbcAtividade;
CREATE DATABASE jdbcAtividade;
USE  jdbcAtividade;

CREATE TABLE aluno (
	numero INT NOT NULL UNIQUE,
    nome VARCHAR(80),
    curso VARCHAR(20),
    nota1 REAL,
    nota2 REAL, 
    nota3 REAL,
    nota4 REAL
);