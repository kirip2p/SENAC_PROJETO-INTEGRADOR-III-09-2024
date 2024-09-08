-- 1. Desativar o Safe Update Mode
SET SQL_SAFE_UPDATES = 0;

-- 2. Desabilitar as verificações de chave estrangeira temporariamente
SET FOREIGN_KEY_CHECKS = 0;

-- Inserção de dados

-- Inserir dados na tabela cidade
INSERT INTO cidade (pais, estado, populacao, territorio_m2) VALUES
('Brasil', 'SP', 12000000, 50000.00),
('Brasil', 'RJ', 7000000, 40000.00),
('Brasil', 'MG', 6000000, 60000.00),
('Brasil', 'RS', 5000000, 30000.00),
('Brasil', 'BA', 4000000, 70000.00),
('Brasil', 'PR', 3500000, 80000.00),
('Brasil', 'CE', 3000000, 90000.00),
('Brasil', 'PE', 2500000, 100000.00),
('Brasil', 'GO', 2000000, 110000.00),
('Brasil', 'MT', 1500000, 120000.00);

-- Inserir dados na tabela endereco
INSERT INTO endereco (cidade_id, bairro, rua, numero, cep) VALUES
(1, 'Centro', 'Rua A', '101', '01001-000'),
(2, 'Zona Sul', 'Rua B', '202', '02002-000'),
(3, 'Zona Norte', 'Rua C', '303', '03003-000'),
(4, 'Centro', 'Rua D', '404', '04004-000'),
(5, 'Bairro Novo', 'Rua E', '505', '05005-000'),
(6, 'Centro', 'Rua F', '606', '06006-000'),
(7, 'Zona Oeste', 'Rua G', '707', '07007-000'),
(8, 'Zona Leste', 'Rua H', '808', '08008-000'),
(9, 'Bairro Antigo', 'Rua I', '909', '09009-000'),
(10, 'Zona Sul', 'Rua J', '010', '10010-000');

-- Inserir dados na tabela saeb
INSERT INTO saeb (id_saeb, contato, responsavel, ano, nome_avaliacao, data) VALUES
(1, '123456789', 'Ana Silva', 2024, 'Avaliação A', '2024-01-15'),
(2, '234567890', 'Carlos Oliveira', 2024, 'Avaliação B', '2024-02-15'),
(3, '345678901', 'Maria Santos', 2024, 'Avaliação C', '2024-03-15'),
(4, '456789012', 'Pedro Lima', 2024, 'Avaliação D', '2024-04-15'),
(5, '567890123', 'Lucas Pereira', 2024, 'Avaliação E', '2024-05-15'),
(6, '678901234', 'Juliana Costa', 2024, 'Avaliação F', '2024-06-15'),
(7, '789012345', 'Fernanda Almeida', 2024, 'Avaliação G', '2024-07-15'),
(8, '890123456', 'Roberto Silva', 2024, 'Avaliação H', '2024-08-15'),
(9, '901234567', 'Tatiane Souza', 2024, 'Avaliação I', '2024-09-15'),
(10, '012345678', 'Bruno Rodrigues', 2024, 'Avaliação J', '2024-10-15');

-- Inserir dados na tabela fundeb
INSERT INTO fundeb (id_fundeb, descricao, valor_distribuido, ano, recebimento_uniao, recebimento_estados, recebimento_municipio) VALUES
(1, 'Descrição 1', 1000000.00, 2024, 200000.00, 300000.00, 500000.00),
(2, 'Descrição 2', 2000000.00, 2024, 300000.00, 400000.00, 1500000.00),
(3, 'Descrição 3', 1500000.00, 2024, 250000.00, 350000.00, 1000000.00),
(4, 'Descrição 4', 1800000.00, 2024, 280000.00, 370000.00, 1120000.00),
(5, 'Descrição 5', 1600000.00, 2024, 270000.00, 360000.00, 1030000.00),
(6, 'Descrição 6', 1700000.00, 2024, 290000.00, 380000.00, 1020000.00),
(7, 'Descrição 7', 1900000.00, 2024, 310000.00, 390000.00, 1200000.00),
(8, 'Descrição 8', 1400000.00, 2024, 260000.00, 340000.00, 800000.00),
(9, 'Descrição 9', 1300000.00, 2024, 240000.00, 330000.00, 760000.00),
(10, 'Descrição 10', 1500000.00, 2024, 250000.00, 320000.00, 930000.00);

-- Inserir dados na tabela escola_municipal
INSERT INTO escola_municipal (capacidade_alunos, nivel_educacao, id_saeb, id_fundeb, numero_professores, nome, endereco_id) VALUES
(500, 'Fundamental', 1, 1, 30, 'Escola A', 1),
(400, 'Médio', 2, 2, 25, 'Escola B', 2),
(450, 'Fundamental', 3, 3, 28, 'Escola C', 3),
(600, 'Médio', 4, 4, 35, 'Escola D', 4),
(550, 'Fundamental', 5, 5, 32, 'Escola E', 5),
(500, 'Médio', 6, 6, 30, 'Escola F', 6),
(450, 'Fundamental', 7, 7, 28, 'Escola G', 7),
(600, 'Médio', 8, 8, 35, 'Escola H', 8),
(550, 'Fundamental', 9, 9, 32, 'Escola I', 9),
(500, 'Médio', 10, 10, 30, 'Escola J', 10);

-- Inserir dados na tabela avaliacao
INSERT INTO avaliacao (id_saeb, id_escola) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserir dados na tabela repasado_recebido
INSERT INTO repasado_recebido (id_fundeb, id_escola) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- 4. Reativar as verificações de chave estrangeira
SET FOREIGN_KEY_CHECKS = 1;

-- 5. Reativar o Safe Update Mode
SET SQL_SAFE_UPDATES = 1;