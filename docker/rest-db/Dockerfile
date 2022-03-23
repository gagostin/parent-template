FROM postgres:13.3

COPY resources/init.sql /docker-entrypoint-initdb.d/01-init.sql
COPY resources/testdata.sql /docker-entrypoint-initdb.d/02-testdata.sql