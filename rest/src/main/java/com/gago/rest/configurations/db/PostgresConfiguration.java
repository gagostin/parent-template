package com.gago.rest.configurations.db;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;

@Configuration
@PropertySource("classpath:rest/db.properties")
@Profile("!h2db")
public class PostgresConfiguration extends DatabaseConfiguration{

    @Value("${entities.location}")
    private String entitiesLocation;

    @Value("${postgres.drivers}")
    private String drivers;

    @Value("${postgres.url}")
    private String url;

    @Value("${postgres.username}")
    private String username;

    @Value("${postgres.password}")
    private String password;

    @Value("${postgres.dialect}")
    private String postgresDialect;

    @Override
    public String drivers() {
        return drivers;
    }

    @Override
    public String url() {
        return url;
    }

    @Override
    public String username() {
        return username;
    }

    @Override
    public String password() {
        return password;
    }

    @Override
    public String entitiesLocation() {
        return entitiesLocation;
    }

    @Override
    public String dialect() {
        return postgresDialect;
    }

    @Override
    public void init(DataSource dataSource) {
        // All initialization scripts will be run externally by the Docker orchestrator
        return;
    }

}
