-- 1. Definições

CREATE TABLE IF NOT EXISTS TIPO_EMPRESA(
    idtipo INTEGER GENERATED ALWAYS AS IDENTITY,
    nometipo VARCHAR(100),
    CONSTRAINT PK_TIPO_EMPRESA PRIMARY KEY (idtipo)
);

-- 2. Tabela Principal (Depende de TIPO_EMPRESA)

CREATE TABLE IF NOT EXISTS EMPRESA_GERAL(
    idempresa INTEGER GENERATED ALWAYS AS IDENTITY,
    tipo_estabelecimento VARCHAR(100),
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    data_abertura DATE,
    proprietarios TEXT,
    cnae VARCHAR(20),
    cadastur VARCHAR(50),
    num_cadastur VARCHAR(50),
    venc_cadastur DATE,
    endereco VARCHAR(255),
    bairro VARCHAR(100),
    localizacao VARCHAR(100),
    regiao VARCHAR(100),
    tel_comercial VARCHAR(20),
    email_comercial VARCHAR(150),
    site VARCHAR(255),
    redes_sociais TEXT,
    func_fixos INTEGER,
    func_temporarios INTEGER,
    idtipo INTEGER,
    CONSTRAINT PK_EMPRESA_GERAL PRIMARY KEY (idempresa),
    CONSTRAINT FK_EMPRESA_GERAL_TIPO FOREIGN KEY (idtipo) REFERENCES TIPO_EMPRESA(idtipo)
);

-- 3. Tabelas Dependentes de EMPRESA_GERAL

CREATE TABLE IF NOT EXISTS EMPRESA_PESQUISA(
    idpesquisa_emp INTEGER GENERATED ALWAYS AS IDENTITY,
    aceita_pesquisa BOOLEAN,
    tel_pesquisa VARCHAR(20),
    email_pesquisa VARCHAR(150),
    plano_emergencia BOOLEAN,
    mulheres_lideranca BOOLEAN,
    mulher_empreendedora BOOLEAN,
    camp_educ_ambiental BOOLEAN,
    uso_fontes_renovaveis BOOLEAN,
    selo_sustentabilidade BOOLEAN,
    camp_reducao_residuos BOOLEAN,
    praticas_gestao_sustentavel BOOLEAN,
    plano_recursos_hidricos BOOLEAN,
    plano_gestao_ambiental BOOLEAN,
    idempresa INTEGER,
    data DATE,
    CONSTRAINT PK_EMPRESA_PESQUISA PRIMARY KEY (idpesquisa_emp),
    CONSTRAINT FK_EMP_PESQ_EMPRESA FOREIGN KEY (idempresa) REFERENCES EMPRESA_GERAL(idempresa),
    CONSTRAINT UK_EMP_PESQUISA UNIQUE (idempresa, data)
);

CREATE TABLE IF NOT EXISTS PESQUISA_HOSPEDAGEM(
    idpesquisa INTEGER GENERATED ALWAYS AS IDENTITY,
    data DATE,
    taxaocup NUMERIC(5,2),
    diariamedia NUMERIC(10,2),
    qtdhospedes INTEGER,
    qtdleitos INTEGER,
    qtduhs INTEGER,
    idempresa INTEGER,
    CONSTRAINT PK_PESQUISA_HOSPEDAGEM PRIMARY KEY (idpesquisa),
    CONSTRAINT FK_PESQ_HOSP_EMPRESA FOREIGN KEY (idempresa) REFERENCES EMPRESA_GERAL(idempresa),
    CONSTRAINT UK_PESQUISA_HOSP UNIQUE (data, idempresa)
);

CREATE TABLE IF NOT EXISTS EMPRESA_SERVICOS(
    idservicos INTEGER GENERATED ALWAYS AS IDENTITY,
    idioma_ingles BOOLEAN,
    idioma_espanhol BOOLEAN,
    outro_idioma VARCHAR(100),
    equip_uhs TEXT,
    equip_recepcao TEXT,
    servicos_aeb TEXT,
    area_refeicoes BOOLEAN,
    sanitario_aeb BOOLEAN,
    alimentacao_diferenciada TEXT,
    area_eventos BOOLEAN,
    equip_eventos TEXT,
    aberto_publico BOOLEAN,
    equip_lazer TEXT,
    idempresa INTEGER,
    data DATE,
    CONSTRAINT PK_EMPRESA_SERVICOS PRIMARY KEY (idservicos),
    CONSTRAINT FK_EMP_SERV_EMPRESA FOREIGN KEY (idempresa) REFERENCES EMPRESA_GERAL(idempresa),
    CONSTRAINT UK_EMP_SERVICOS UNIQUE (idempresa, data)
);

CREATE TABLE IF NOT EXISTS EMPRESA_ACESSIBILIDADE(
    idacessibilidade INTEGER GENERATED ALWAYS AS IDENTITY,
    facilidades_pcd BOOLEAN,
    tipos_deficiencia TEXT,
    pessoal_capacitado BOOLEAN,
    rota_externa BOOLEAN,
    embarque_desembarque BOOLEAN,
    vaga_estacionamento BOOLEAN,
    area_circulacao BOOLEAN,
    escada BOOLEAN,
    rampa BOOLEAN,
    piso BOOLEAN,
    elevador BOOLEAN,
    alarme_emergencia BOOLEAN,
    locais_alarme TEXT,
    comunicacao_pcd TEXT,
    balcao_atendimento BOOLEAN,
    sanitario_adaptado BOOLEAN,
    telefone_acessivel BOOLEAN,
    sinalizacao_preferencial BOOLEAN,
    idempresa INTEGER,
    data DATE,
    CONSTRAINT PK_EMPRESA_ACESSIBILIDADE PRIMARY KEY (idacessibilidade),
    CONSTRAINT FK_EMP_ACESSIB_EMPRESA FOREIGN KEY (idempresa) REFERENCES EMPRESA_GERAL(idempresa),
    CONSTRAINT UK_EMP_ACESSIBILIDADE UNIQUE (idempresa, data)
);

CREATE TABLE IF NOT EXISTS EMPRESA_ESTRUTURA(
    idestrutura INTEGER GENERATED ALWAYS AS IDENTITY,
    qtd_uhs INTEGER,
    qtd_uhs_pcd INTEGER,
    total_leitos INTEGER,
    min_leitos_uh INTEGER,
    max_leitos_uh INTEGER,
    func_24h BOOLEAN,
    horario_checkin_checkout VARCHAR(100),
    sistema_reservas TEXT,
    formas_pagamento TEXT,
    estacionamento BOOLEAN,
    manobrista BOOLEAN,
    mensageiro BOOLEAN,
    area_fumantes BOOLEAN,
    pet_friendly BOOLEAN,
    idempresa INTEGER,
    data DATE,
    CONSTRAINT PK_EMPRESA_ESTRUTURA PRIMARY KEY (idestrutura),
    CONSTRAINT FK_EMP_ESTRUTURA_EMPRESA FOREIGN KEY (idempresa) REFERENCES EMPRESA_GERAL(idempresa),
    CONSTRAINT UK_EMP_ESTRUTURA UNIQUE (idempresa, data)
);

CREATE TABLE IF NOT EXISTS PESQUISA(
    idconsolidada INTEGER GENERATED ALWAYS AS IDENTITY,
    data DATE,
    taxaocupacaoreal NUMERIC(5,2),
    receitareal NUMERIC(15,2),
    qtdturistasreal INTEGER,
    idempresa INTEGER,
    CONSTRAINT PK_PESQUISA PRIMARY KEY (idconsolidada),
    CONSTRAINT FK_PESQUISA_EMPRESA FOREIGN KEY (idempresa) REFERENCES EMPRESA_GERAL(idempresa),
    CONSTRAINT UK_PESQUISA UNIQUE (data, idempresa)
);

-- 4. Pessoas

CREATE TABLE IF NOT EXISTS PESSOA_VISITANTE(
    idpessoa VARCHAR(11),
    senha VARCHAR(50) NOT NULL,
    CONSTRAINT PK_PESSOA_VISITANTE PRIMARY KEY (idpessoa)
);

CREATE TABLE IF NOT EXISTS PESSOA_ADMIN(
    idpessoa VARCHAR(11),
    senha VARCHAR(50) NOT NULL,
    CONSTRAINT PK_PESSOA_ADMIN PRIMARY KEY (idpessoa)
);

CREATE TABLE IF NOT EXISTS PESSOA_FUNCIONARIO(
    idpessoa VARCHAR(11),
    senha VARCHAR(50) NOT NULL,
    CONSTRAINT PK_PESSOA_FUNCIONARIO PRIMARY KEY (idpessoa)
);

CREATE TABLE IF NOT EXISTS PESSOA_EMPRESARIO(
    idpessoa VARCHAR(14),
    senha VARCHAR(50) NOT NULL,
    idempresa INTEGER,
    CONSTRAINT PK_PESSOA_EMPRESARIO PRIMARY KEY (idpessoa),
    CONSTRAINT FK_PESSOA_EMP_EMPRESA FOREIGN KEY (idempresa) REFERENCES EMPRESA_GERAL(idempresa),
    CONSTRAINT UK_PESSOA_EMPRESARIO UNIQUE (idempresa)
);