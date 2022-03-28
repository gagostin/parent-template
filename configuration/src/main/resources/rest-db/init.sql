DROP TABLE IF EXISTS test;

CREATE SEQUENCE test_id_seq;
CREATE TABLE IF NOT EXISTS test (
    test_id INTEGER NOT NULL DEFAULT nextval('test_id_seq'),
    test_key VARCHAR(50) UNIQUE NOT NULL,
    test_value VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY (test_id)
);
ALTER SEQUENCE test_id_seq OWNED BY test.test_id;