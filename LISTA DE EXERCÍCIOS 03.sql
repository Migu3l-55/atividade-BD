DROP DATABASE  IF EXISTS 20221164010017_Lista_Exercicio;
CREATE DATABASE 20221164010017_Lista_Exercicio;
USE 20221164010017_Lista_Exercicio;
-- Miguel da Silva Mendonça

-- 1
CREATE TABLE Sala (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    numero INT NOT NULL UNIQUE,
    nome_completo VARCHAR(80) NOT NULL UNIQUE,
    nome_curto VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE Usuario (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE Permissao (
	id_Sala INT NOT NULL,
    id_Usuario INT NOT NULL,
	expirar_acesso DATE,
		FOREIGN KEY (id_Sala) REFERENCES Sala(id) ON DELETE RESTRICT ON UPDATE CASCADE,
		FOREIGN KEY (id_Usuario) REFERENCES Usuario(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 2
INSERT INTO Usuario (nome, cpf) VALUES
('Felipe', '11111111111'), 
('Marcelo', '22222222222'),
('Mizael', '33333333333'),
('Leonardo', '44444444444');

INSERT INTO Sala (numero, nome_completo, nome_curto) VALUES
(21, 'Laboratório de Manutenção e Arquitetura de Computadores', 'LAMAC'),
(46, 'Laboratório de Informática 1', 'LabInfo1'),
(48, 'Laboratório de Informática 2', 'LabInfo2');

-- 3
INSERT INTO Permissao (id_Usuario, id_sala, expirar_acesso) VALUES 
((SELECT id FROM Usuario WHERE Usuario.cpf = '11111111111'), (SELECT id FROM Sala WHERE Sala.numero = 21), '2020-12-31'),
((SELECT id FROM Usuario WHERE Usuario.cpf = '11111111111'), (SELECT id FROM Sala WHERE Sala.numero = 46), '2020-12-31'),
((SELECT id FROM Usuario WHERE Usuario.cpf = '11111111111'), (SELECT id FROM Sala WHERE Sala.numero = 48), '2020-12-31'),
((SELECT id FROM Usuario WHERE Usuario.cpf = '22222222222'), (SELECT id FROM Sala WHERE Sala.numero = 21), '2020-12-31'),
((SELECT id FROM Usuario WHERE Usuario.cpf = '22222222222'), (SELECT id FROM Sala WHERE Sala.numero = 46), '2020-12-31'),
((SELECT id FROM Usuario WHERE Usuario.cpf = '22222222222'), (SELECT id FROM Sala WHERE Sala.numero = 48), '2020-12-31'),

((SELECT id FROM Usuario WHERE Usuario.cpf = '33333333333'), (SELECT id FROM Sala Where Sala.numero = 21), null);

-- 4
SELECT nome, cpf FROM Usuario INNER JOIN Permissao ON Usuario.id = Permissao.id_Usuario AND Permissao.id_Sala = (SELECT id FROM Sala WHERE Sala.numero = 21);

-- 5 
SELECT numero, nome_curto FROM Sala INNER JOIN Permissao ON Sala.id = Permissao.id_Sala AND Permissao.id_Usuario = (SELECT id FROM Usuario WHERE Usuario.cpf = '11111111111');

-- 6
SELECT nome, cpf FROM Usuario INNER JOIN Permissao;