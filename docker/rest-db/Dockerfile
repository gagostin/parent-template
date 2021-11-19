FROM postgres:13.3

COPY docker/rest-db/resources/init.sql /docker-entrypoint-initdb.d/01-init.sql
COPY docker/rest-db/resources/testdata.sql /docker-entrypoint-initdb.d/02-testdata.sql