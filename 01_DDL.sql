-- ========================
-- CRIAÇÃO DAS TABELAS
-- ========================

CREATE TABLE especie (
    id_especie      INTEGER NOT NULL,
    nome_especie    VARCHAR2(30) NOT NULL,
    nome_cientifico VARCHAR2(50) NOT NULL,
    alimentacao     VARCHAR2(50) NOT NULL,
    habitat         VARCHAR2(30) NOT NULL,
    CONSTRAINT especie_pk PRIMARY KEY (id_especie),
    CONSTRAINT especie_nome_cientifico_un UNIQUE (nome_cientifico)
);

CREATE TABLE jaula (
    id_jaula       INTEGER NOT NULL,
    temperatura    NUMBER(4) NOT NULL,
    status_limpeza VARCHAR2(15) NOT NULL,
    setor          VARCHAR2(30) NOT NULL,
    CONSTRAINT jaula_pk PRIMARY KEY (id_jaula),
    CONSTRAINT chk_status_limpeza CHECK (status_limpeza IN ('Limpa', 'Suja', 'Manutenção')),
    CONSTRAINT chk_temperatura CHECK (temperatura BETWEEN -20 AND 100)
);

CREATE TABLE animal (
    id_animal          INTEGER NOT NULL,
    nome               VARCHAR2(30) NOT NULL,
    data_nascimento    DATE NOT NULL,
    jaula_id_jaula     INTEGER NOT NULL,
    especie_id_especie INTEGER NOT NULL,
    CONSTRAINT animal_pk PRIMARY KEY (id_animal)
);

CREATE TABLE visitante (
    id_visitante INTEGER NOT NULL,
    nome         VARCHAR2(50) NOT NULL,
    idade        VARCHAR2(3) NOT NULL,
    cidade       VARCHAR2(30) NOT NULL,
    estado       VARCHAR2(30) NOT NULL,
    data_visita  DATE NOT NULL,
    CONSTRAINT visitante_pk PRIMARY KEY (id_visitante)
);

CREATE TABLE feedback (
    id_feedback            INTEGER NOT NULL,
    nota_experiencia       INTEGER NOT NULL,
    comentario             VARCHAR2(255),
    visitante_id_visitante INTEGER NOT NULL,
    CONSTRAINT feedback_pk PRIMARY KEY (id_feedback),
    CONSTRAINT chk_nota_experiencia CHECK (nota_experiencia BETWEEN 0 AND 10)
);

CREATE TABLE zoologico (
    id_zoo     INTEGER NOT NULL,
    nome_zoo   VARCHAR2(100) NOT NULL,
    cidade_zoo VARCHAR2(100) NOT NULL,
    estado_zoo VARCHAR2(50) NOT NULL,
    CONSTRAINT zoologico_pk PRIMARY KEY (id_zoo),
    CONSTRAINT zoologico_nome_un UNIQUE (nome_zoo)
);

CREATE TABLE totem (
    id_totem         INTEGER NOT NULL,
    localizacao      VARCHAR2(100) NOT NULL,
    zoologico_id_zoo INTEGER NOT NULL,
    CONSTRAINT totem_pk PRIMARY KEY (id_totem),
    CONSTRAINT totem_localizacao_un UNIQUE (localizacao)
);

CREATE TABLE visitante_zoo (
    zoologico_id_zoo       INTEGER NOT NULL,
    visitante_id_visitante INTEGER NOT NULL
);

CREATE TABLE zoo_jaula (
    jaula_id_jaula   INTEGER NOT NULL,
    zoologico_id_zoo INTEGER NOT NULL
);

-- ========================
-- CHAVES ESTRANGEIRAS
-- ========================

ALTER TABLE animal
    ADD CONSTRAINT animal_especie_fk FOREIGN KEY (especie_id_especie)
        REFERENCES especie (id_especie)
        ON DELETE CASCADE;

ALTER TABLE animal
    ADD CONSTRAINT animal_jaula_fk FOREIGN KEY (jaula_id_jaula)
        REFERENCES jaula (id_jaula)
        ON DELETE CASCADE;

ALTER TABLE feedback
    ADD CONSTRAINT feedback_visitante_fk FOREIGN KEY (visitante_id_visitante)
        REFERENCES visitante (id_visitante)
        ON DELETE CASCADE;

ALTER TABLE totem
    ADD CONSTRAINT totem_zoologico_fk FOREIGN KEY (zoologico_id_zoo)
        REFERENCES zoologico (id_zoo)
        ON DELETE CASCADE;

ALTER TABLE visitante_zoo
    ADD CONSTRAINT visitante_zoo_visitante_fk FOREIGN KEY (visitante_id_visitante)
        REFERENCES visitante (id_visitante)
        ON DELETE CASCADE;

ALTER TABLE visitante_zoo
    ADD CONSTRAINT visitante_zoo_zoologico_fk FOREIGN KEY (zoologico_id_zoo)
        REFERENCES zoologico (id_zoo)
        ON DELETE CASCADE;

ALTER TABLE zoo_jaula
    ADD CONSTRAINT zoo_jaula_jaula_fk FOREIGN KEY (jaula_id_jaula)
        REFERENCES jaula (id_jaula)
        ON DELETE CASCADE;

ALTER TABLE zoo_jaula
    ADD CONSTRAINT zoo_jaula_zoologico_fk FOREIGN KEY (zoologico_id_zoo)
        REFERENCES zoologico (id_zoo)
        ON DELETE CASCADE;
