DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS commessa;

DROP SEQUENCE IF EXISTS event_id_seq;

CREATE TABLE IF NOT EXISTS commessa (
    key VARCHAR(3) NOT NULL,
    description VARCHAR(200) UNIQUE NOT NULL,
    color VARCHAR(50) UNIQUE NOT NULL,
    img VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY (key)
);

CREATE SEQUENCE event_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE TABLE IF NOT EXISTS event (
    event_id BIGINT DEFAULT nextval('event_id_seq'::regclass) NOT NULL,
    all_day BOOLEAN NOT NULL,
    start_date VARCHAR(50) NOT NULL,
    end_date VARCHAR(50) NOT NULL,
    editable BOOLEAN NOT NULL,
    user_id VARCHAR(100) NOT NULL,
    commessa_key VARCHAR(3) NOT NULL,
    PRIMARY KEY (event_id),
    CONSTRAINT fk_event_commessa_key FOREIGN KEY(commessa_key) REFERENCES commessa (key)
);