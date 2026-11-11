USE rapidspot;

-- 1. empresa
INSERT INTO empresa (nome, codigo, codigo_atualizado_em) VALUES
('TechRibatejo, Lda', 'TECH2026', '2026-10-01 09:00:00'),
('Logística do Tejo, SA', 'LOGTEJO01', NULL);

-- 2. utilizador (2 administradores e 6 condutores)
INSERT INTO utilizador (id_empresa, nome, email, palavra_passe, perfil) VALUES
(1, 'Carla Mendes', 'carla.mendes@techribatejo.pt', '$2y$10$exemploHashCarla000000000000000000000000000000000000', 'administrador'),
(2, 'Paulo Rocha', 'paulo.rocha@logtejo.pt', '$2y$10$exemploHashPaulo000000000000000000000000000000000000', 'administrador'),
(1, 'Ana Silva', 'ana.silva@techribatejo.pt', '$2y$10$exemploHashAna00000000000000000000000000000000000000', 'condutor'),
(1, 'Rui Costa', 'rui.costa@techribatejo.pt', '$2y$10$exemploHashRui0000000000000000000000000000000000000000', 'condutor'),
(1, 'João Gonçalves', 'joao.goncalves@techribatejo.pt', '$2y$10$exemploHashJoao0000000000000000000000000000000000000', 'condutor'),
(2, 'Inês Marques', 'ines.marques@logtejo.pt', '$2y$10$exemploHashInes00000000000000000000000000000000000000', 'condutor'),
(2, 'Tiago Lopes', 'tiago.lopes@logtejo.pt', '$2y$10$exemploHashTiago000000000000000000000000000000000000', 'condutor'),
(NULL, 'Sofia Pereira', 'sofia.pereira@gmail.com', '$2y$10$exemploHashSofia000000000000000000000000000000000000', 'condutor');

-- 3. estacionamento
INSERT INTO estacionamento (id_empresa, id_administrador, nome, cidade, morada) VALUES
(1, 1, 'Parque TechRibatejo', 'Santarém', 'Rua Pedro de Santarém, 12'),
(2, 2, 'Parque Logística do Tejo', 'Cartaxo', 'Zona Industrial do Cartaxo, Lote 4');

-- 4. condutor
INSERT INTO condutor (id_utilizador, id_estacionamento) VALUES
(3, 1), (4, 1), (5, 1), (6, 2), (7, 2);

-- 5. vaga (o parque 2 está cheio)
INSERT INTO vaga (id_estacionamento, numero, piso, estado) VALUES
(1, '1', 0, 'ocupada'), (1, '2', 0, 'livre'), (1, '3', 0, 'ocupada'),
(1, '4', 0, 'livre'),   (1, '1', 1, 'livre'), (1, '2', 1, 'livre'),
(2, '1', 0, 'ocupada'), (2, '2', 0, 'ocupada');

-- 6. senha
INSERT INTO senha (id_condutor, id_vaga, codigo, tipo, criada_em, usada_em) VALUES
(1, 1, 'A7K2P9', 'entrada', '2026-11-09 08:00:00', '2026-11-09 08:05:00'),
(2, 2, 'R3M8Q1', 'entrada', '2026-11-09 07:30:00', '2026-11-09 07:33:00'),
(2, 2, 'R9T4W6', 'saida',   '2026-11-09 12:00:00', '2026-11-09 12:02:00'),
(3, 3, 'J5H1Z8', 'entrada', '2026-11-09 08:40:00', '2026-11-09 08:42:00'),
(2, NULL, 'X2C6V4', 'entrada', '2026-11-08 18:00:00', NULL),
(4, 7, 'I8N3B5', 'entrada', '2026-11-09 08:10:00', '2026-11-09 08:12:00'),
(5, 8, 'T1L7D2', 'entrada', '2026-11-09 08:20:00', '2026-11-09 08:21:00');

-- 7. pedido_outra_vaga
INSERT INTO pedido_outra_vaga (id_condutor, id_vaga, motivo, descricao, estado, criado_em) VALUES
(3, 3, 'ocupada_ou_obstruida', 'Está um carro na vaga sem senha.', 'por_analisar', '2026-11-09 08:45:00'),
(1, 5, 'veiculo_nao_cabe', NULL, 'analisado', '2026-11-07 09:00:00');

-- ===== Consultas de verificação =====
SELECT * FROM empresa;
SELECT * FROM utilizador;
SELECT * FROM estacionamento;
SELECT * FROM condutor;
SELECT * FROM vaga;
SELECT * FROM senha;
SELECT * FROM pedido_outra_vaga;

-- Vagas livres do estacionamento 1
SELECT COUNT(*) AS vagas_livres
FROM vaga
WHERE id_estacionamento = 1 AND estado = 'livre';

-- Primeira vaga livre do estacionamento 1
SELECT id_vaga, piso, numero
FROM vaga
WHERE id_estacionamento = 1 AND estado = 'livre'
ORDER BY piso, numero
LIMIT 1;

-- Entradas e saídas do estacionamento 1
SELECT utilizador.nome, senha.tipo, vaga.piso, vaga.numero, senha.usada_em
FROM senha
JOIN condutor ON senha.id_condutor = condutor.id_condutor
JOIN utilizador ON condutor.id_utilizador = utilizador.id_utilizador
JOIN vaga ON senha.id_vaga = vaga.id_vaga
WHERE condutor.id_estacionamento = 1 AND senha.usada_em IS NOT NULL
ORDER BY senha.usada_em;

-- Pedidos de outra vaga por analisar
SELECT pedido_outra_vaga.id_pedido, utilizador.nome, vaga.piso, vaga.numero,
       pedido_outra_vaga.motivo, pedido_outra_vaga.criado_em
FROM pedido_outra_vaga
JOIN condutor ON pedido_outra_vaga.id_condutor = condutor.id_condutor
JOIN utilizador ON condutor.id_utilizador = utilizador.id_utilizador
JOIN vaga ON pedido_outra_vaga.id_vaga = vaga.id_vaga
WHERE pedido_outra_vaga.estado = 'por_analisar';