SET search_path TO cartografia, public;

CREATE TABLE IF NOT EXISTS cartografia.territorios
(
    id          SERIAL PRIMARY KEY,
    nome        VARCHAR(150) NOT NULL UNIQUE,
    tipo        VARCHAR(50)  NOT NULL,
    risco_nivel INTEGER      NOT NULL CHECK ( risco_nivel BETWEEN 0 AND 5)
);

CREATE TABLE IF NOT EXISTS cartografia.cartografos
(
    id          SERIAL PRIMARY KEY,
    nome        VARCHAR(150) NOT NULL,
    senioridade VARCHAR(20)  NOT NULL CHECK ( senioridade IN ('junior', 'pleno', 'senior') )
);

CREATE TABLE IF NOT EXISTS cartografia.versoes_territorio
(
    id                  BIGSERIAL PRIMARY KEY,
    territorio_id       INTEGER        NOT NULL REFERENCES cartografia.territorios (id),
    data_ref            DATE           NOT NULL,
    pos_x               NUMERIC(10, 3) NOT NULL,
    pos_y               NUMERIC(10, 3) NOT NULL,
    nivel_instabilidade INTEGER        NOT NULL CHECK ( nivel_instabilidade BETWEEN 0 AND 10),
    cartografo_id       INTEGER        NOT NULL REFERENCES cartografia.cartografos (id),

    CONSTRAINT chk_instabilidade_territorio CHECK ( nivel_instabilidade <= 5 OR territorio_id IS NOT NULL)
);

CREATE TABLE IF NOT EXISTS cartografia.visitas_territorio
(
    id            BIGSERIAL PRIMARY KEY,
    territorio_id INTEGER NOT NULL REFERENCES cartografia.territorios (id),
    data_visita   DATE    NOT NULL,
    visitantes    INTEGER NOT NULL CHECK ( visitantes >= 0 )
);