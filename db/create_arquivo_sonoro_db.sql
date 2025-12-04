CREATE SCHEMA IF NOT EXISTS arquivo_sonoro;

SET search_path TO arquivo_sonoro, public;

CREATE TABLE IF NOT EXISTS arquivo_sonoro.criaturas
(
    id           SERIAL PRIMARY KEY,
    nome         VARCHAR(150) NOT NULL UNIQUE,
    classe       VARCHAR(50)  NOT NULL,
    nivel_ameaca INTEGER      NOT NULL CHECK ( nivel_ameaca BETWEEN 1 AND 5)
);

CREATE TABLE IF NOT EXISTS arquivo_sonoro.habitats
(
    id       SERIAL PRIMARY KEY,
    nome     VARCHAR(150) NOT NULL UNIQUE,
    tipo     VARCHAR(50)  NOT NULL,
    dimensao VARCHAR(50)  NOT NULL
);

CREATE TABLE IF NOT EXISTS arquivo_sonoro.gravacoes
(
    id             BIGSERIAL PRIMARY KEY,
    critatura_id   INTEGER        NOT NULL REFERENCES arquivo_sonoro.criaturas (id),
    habitat_id     INTEGER        NOT NULL REFERENCES arquivo_sonoro.habitats (id),
    data_gravacao  TIMESTAMP      NOT NULL,
    frequencia_hz  NUMERIC(10, 2) NOT NULL CHECK ( frequencia_hz > 0 ),
    intensidade_db NUMERIC(5, 2)  NOT NULL,
    pesquisador    VARCHAR(150)   NOT NULL
);