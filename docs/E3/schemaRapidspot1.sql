DROP DATABASE IF EXISTS rapidspot;
CREATE DATABASE rapidspot;
USE rapidspot;

CREATE TABLE empresa (
    id_empresa INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(16) NOT NULL UNIQUE,
    codigo_atualizado_em DATETIME,
    PRIMARY KEY (id_empresa)
);

CREATE TABLE utilizador (
    id_utilizador INT AUTO_INCREMENT,
    id_empresa INT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    palavra_passe VARCHAR(255) NOT NULL,
    perfil ENUM('condutor', 'administrador') NOT NULL DEFAULT 'condutor',
    PRIMARY KEY (id_utilizador),
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

CREATE TABLE estacionamento (
    id_estacionamento INT AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    id_administrador INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    morada VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_estacionamento),
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa),
    FOREIGN KEY (id_administrador) REFERENCES utilizador(id_utilizador)
);

CREATE TABLE condutor (
    id_condutor INT AUTO_INCREMENT,
    id_utilizador INT NOT NULL,
    id_estacionamento INT NOT NULL,
    PRIMARY KEY (id_condutor),
    UNIQUE (id_utilizador, id_estacionamento),
    FOREIGN KEY (id_utilizador) REFERENCES utilizador(id_utilizador),
    FOREIGN KEY (id_estacionamento) REFERENCES estacionamento(id_estacionamento)
);

CREATE TABLE vaga (
    id_vaga INT AUTO_INCREMENT,
    id_estacionamento INT NOT NULL,
    numero VARCHAR(10) NOT NULL,
    piso INT NOT NULL DEFAULT 0,
    estado ENUM('livre', 'ocupada') NOT NULL DEFAULT 'livre',
    PRIMARY KEY (id_vaga),
    UNIQUE (id_estacionamento, piso, numero),
    FOREIGN KEY (id_estacionamento) REFERENCES estacionamento(id_estacionamento)
);

CREATE TABLE senha (
    id_senha INT AUTO_INCREMENT,
    id_condutor INT NOT NULL,
    id_vaga INT,
    codigo CHAR(6) NOT NULL,
    tipo ENUM('entrada', 'saida') NOT NULL,
    criada_em DATETIME NOT NULL,
    usada_em DATETIME,
    PRIMARY KEY (id_senha),
    FOREIGN KEY (id_condutor) REFERENCES condutor(id_condutor),
    FOREIGN KEY (id_vaga) REFERENCES vaga(id_vaga)
);

CREATE TABLE pedido_outra_vaga (
    id_pedido INT AUTO_INCREMENT,
    id_condutor INT NOT NULL,
    id_vaga INT NOT NULL,
    motivo ENUM('ocupada_ou_obstruida', 'veiculo_nao_cabe', 'outro') NOT NULL,
    descricao VARCHAR(255),
    estado ENUM('por_analisar', 'analisado') NOT NULL DEFAULT 'por_analisar',
    criado_em DATETIME NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_condutor) REFERENCES condutor(id_condutor),
    FOREIGN KEY (id_vaga) REFERENCES vaga(id_vaga)
);