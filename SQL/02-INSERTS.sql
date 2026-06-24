INSERT INTO TIPO_EMPRESA (nometipo) VALUES 
('Parque Aquático'),
('Resort'),
('Pousada'),
('Agência de Turismo');

INSERT INTO EMPRESA_GERAL (
    tipo_estabelecimento, 
    razao_social, 
    nome_fantasia, 
    data_abertura, 
    proprietarios, 
    cnae, 
    cadastur, 
    num_cadastur, 
    venc_cadastur, 
    endereco, 
    bairro, 
    localizacao, 
    regiao, 
    tel_comercial, 
    email_comercial, 
    site, 
    redes_sociais, 
    func_fixos, 
    func_temporarios, 
    idtipo
) VALUES 
(
    'Parque Aquático Termal', 
    'Clube Thermas dos Laranjais', 
    'Thermas dos Laranjais', 
    '1987-01-01', 
    'Diretoria Executiva do Clube', 
    '9321-2/00', 
    'Ativo', 
    '26.012345.10.0001-9', 
    '2027-12-31', 
    'Avenida do Folclore, 1543', 
    'Jardim Santa Ifigênia', 
    'Urbana', 
    'Noroeste Paulista', 
    '(17) 3279-3500', 
    'contato@termas.com.br', 
    'www.termas.com.br', 
    '@thermasdoslaranjaisoficial', 
    500, 
    150, 
    1 -- 'Parque Aquático'
),
(
    'Resort com Parque Aquático', 
    'Hot Beach Suites Olimpia Empreendimento Imobiliario', 
    'Hot Beach Resort', 
    '2017-06-28', 
    'Grupo Ferrasa', 
    '5510-8/01', 
    'Ativo', 
    '26.987654.10.0001-0', 
    '2028-05-20', 
    'Avenida Governador Adhemar Pereira de Barros, 1700', 
    'Distrito Industrial', 
    'Urbana', 
    'Noroeste Paulista', 
    '(17) 3279-1009', 
    'reservas@hotbeach.com.br', 
    'www.hotbeach.com.br', 
    '@hotbeach.oficial', 
    300, 
    80, 
    2 -- 'Resort'
),
(
    'Resort de Múltiplas Propriedades', 
    'Olimpia Park Resort Spe Ltda', 
    'Enjoy Olímpia Park Resort', 
    '2018-05-01', 
    'Enjoy Hotéis e Resorts', 
    '5510-8/01', 
    'Ativo', 
    '26.111222.10.0001-5', 
    '2026-10-15', 
    'Avenida Aurora Forti Neves, 1030', 
    'Jardim Glória', 
    'Urbana', 
    'Noroeste Paulista', 
    '(17) 3042-1042', 
    'atendimento@enjoyhoteis.com.br', 
    'www.enjoyhoteis.com.br', 
    '@enjoyolimpiaparkresort', 
    250, 
    100, 
    2 -- 'Resort'
),
(
    'Pousada', 
    'Recanto das Águas Hospedagem Ltda', 
    'Pousada Recanto das Águas', 
    '2015-10-12', 
    'Maria Silva, João Carlos Silva', 
    '5510-8/01', 
    'Ativo', 
    '26.444555.10.0001-8', 
    '2026-12-01', 
    'Rua Síria, 550', 
    'Centro', 
    'Urbana', 
    'Noroeste Paulista', 
    '(17) 3281-2233', 
    'contato@pousadarecanto.com.br', 
    'www.pousadarecanto.com.br', 
    '@pousadarecantoolimpia', 
    10, 
    5, 
    3 -- Referência ao tipo 'Pousada'
);

INSERT INTO PESQUISA_HOSPEDAGEM (
    data, 
    taxaocup, 
    diariamedia, 
    qtdhospedes, 
    qtdleitos, 
    qtduhs, 
    idempresa
) VALUES 
-- ==========================================================
-- EMPRESA 2: Hot Beach Resort (Resort Premium)
-- ==========================================================
-- Registro 1: Data de abertura (Junho/2017)
('2017-06-28', 75.0, 800.00, 600, 400, 100, 2),
-- Registro 2: Abr/2025 (Baixa temporada, 400 leitos originais)
('2025-04-30', 60.0, 900.00, 500, 400, 100, 2),
-- Registro 3: Jul/2025 (Alta temporada de inverno. Reflete expansão para 450 leitos)
('2025-07-31', 90.0, 1350.00, 850, 450, 115, 2),
-- Registro 4: Out/2025 (Média temporada)
('2025-10-31', 70.0, 1050.00, 650, 450, 115, 2),
-- ==========================================================
-- EMPRESA 3: Enjoy Olímpia Park (Resort de Grande Porte)
-- ==========================================================
-- Registro 1: Data de abertura (Maio/2018)
('2018-05-15', 80.0, 650.00, 1200, 900, 450, 3),
-- Registro 2: Abr/2025 (Baixa temporada)
('2025-04-30', 55.0, 600.00, 1000, 900, 450, 3),
-- Registro 3: Jul/2025 (Alta temporada)
('2025-07-31', 88.0, 950.00, 1500, 900, 450, 3),
-- Registro 4: Out/2025 (Média temporada - expansão para 1000 leitos só ocorre em Novembro)
('2025-10-31', 65.0, 700.00, 1200, 900, 450, 3),
-- ==========================================================
-- EMPRESA 4: Pousada Recanto das Águas (Hospedagem Econômica)
-- ==========================================================
-- Registro 1: Data de abertura oficial conforme EMPRESA_GERAL (Outubro/2015)
('2015-10-12', 60.0, 250.00, 35, 60, 20, 4),
-- Registro 2: Abr/2025 (Baixa temporada, estrutura original)
('2025-04-30', 50.0, 200.00, 30, 60, 20, 4),
-- Registro 3: Jul/2025 (Alta temporada. Reflete os novos chalés com 90 leitos)
('2025-07-31', 92.0, 400.00, 80, 90, 30, 4),
-- Registro 4: Out/2025 (Reflete a otimização com beliches totalizando 110 leitos)
('2025-10-31', 80.0, 300.00, 95, 110, 30, 4);

INSERT INTO EMPRESA_ESTRUTURA (
    qtd_uhs, 
    qtd_uhs_pcd, 
    total_leitos, 
    min_leitos_uh, 
    max_leitos_uh, 
    func_24h, 
    horario_checkin_checkout, 
    sistema_reservas, 
    formas_pagamento, 
    estacionamento, 
    manobrista, 
    mensageiro, 
    area_fumantes, 
    pet_friendly, 
    idempresa, 
    data
) VALUES 
-- ==========================================================
-- EMPRESA 2: Hot Beach Resort (Evolução de 400 para 450 leitos)
-- ==========================================================
-- Registro 1: Estrutura inicial reportada em Janeiro/2025
(
    100, 
    5, 
    400, 
    2, 
    6, 
    TRUE, 
    'Check-in 14:00 / Check-out 12:00', 
    'Omnibees', 
    'Cartão de Crédito, Pix, Boleto', 
    TRUE, 
    TRUE, 
    TRUE, 
    FALSE, 
    FALSE, 
    2, 
    '2025-01-10' 
),
-- Registro 2: Expansão do hotel reportada em Junho/2025
(
    115, 
    6, 
    450, 
    2, 
    6, 
    TRUE, 
    'Check-in 14:00 / Check-out 12:00', 
    'Omnibees', 
    'Cartão de Crédito, Pix, Boleto', 
    TRUE, 
    TRUE, 
    TRUE, 
    FALSE, 
    FALSE, 
    2, 
    '2025-06-15' 
),
-- ==========================================================
-- EMPRESA 3: Enjoy Olímpia Park (Evolução de 900 para 1000 leitos)
-- ==========================================================
-- Registro 1: Estrutura inicial reportada em Fevereiro/2025
(
    450, 
    10, 
    900, 
    2, 
    7, 
    TRUE, 
    'Check-in 14:00 / Check-out 11:00', 
    'Sistema Próprio', 
    'Cartão de Crédito, Pix', 
    TRUE, 
    FALSE, 
    FALSE, 
    TRUE, 
    TRUE, 
    3, 
    '2025-02-05' 
),
-- Registro 2: Construção de nova torre reportada em Novembro/2025
(
    500, 
    12, 
    1000, 
    2, 
    7, 
    TRUE, 
    'Check-in 14:00 / Check-out 11:00', 
    'Sistema Próprio', 
    'Cartão de Crédito, Pix', 
    TRUE, 
    FALSE, 
    FALSE, 
    TRUE, 
    TRUE, 
    3, 
    '2025-11-20' 
),
-- ==========================================================
-- EMPRESA 4: Pousada Recanto das Águas
-- ==========================================================
-- Registro 1: Estrutura inicial reportada no começo do ano (Janeiro/2025)
(
    20, 
    1, 
    60, 
    2, 
    4, 
    TRUE, 
    'Check-in 14:00 / Check-out 12:00', 
    'Booking.com, Telefone', 
    'Cartão de Crédito, Pix, Dinheiro', 
    TRUE, 
    FALSE, 
    FALSE, 
    TRUE, 
    TRUE, 
    4, 
    '2025-01-15'
),
-- Registro 2: Construção de novos chalés (Maio/2025)
-- Aumentou de 20 para 30 quartos (UHs) e de 60 para 90 leitos. Adicionou sistema de reserva pelo WhatsApp.
(
    30, 
    2, 
    90, 
    2, 
    4, 
    TRUE, 
    'Check-in 14:00 / Check-out 12:00', 
    'Booking.com, Telefone, WhatsApp', 
    'Cartão de Crédito, Pix, Dinheiro', 
    TRUE, 
    FALSE, 
    FALSE, 
    TRUE, 
    TRUE, 
    4, 
    '2025-05-20'
),
-- Registro 3: Preparação para alta temporada (Outubro/2025)
-- Adicionou beliches nos chalés maiores. O número de quartos continuou 30, mas os leitos pularam de 90 para 110.
(
    30, 
    2, 
    110, 
    2, 
    5, 
    TRUE, 
    'Check-in 14:00 / Check-out 12:00', 
    'Booking.com, Telefone, WhatsApp', 
    'Cartão de Crédito, Pix, Dinheiro', 
    TRUE, 
    FALSE, 
    FALSE, 
    TRUE, 
    TRUE, 
    4, 
    '2025-10-05'
);

INSERT INTO PESSOA_VISITANTE (idpessoa, senha) 
VALUES ('111222333', 'testesenha');

INSERT INTO PESSOA_ADMIN (idpessoa, senha) 
VALUES ('444555666', 'testesenha');

INSERT INTO PESSOA_FUNCIONARIO (idpessoa, senha) 
VALUES ('777888999', 'testesenha');

INSERT INTO PESSOA_EMPRESARIO (idpessoa, senha, idempresa) VALUES
('53208583000107', 'testesenha', 1);