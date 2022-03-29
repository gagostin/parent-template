package com.gago.rest.configurations;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.jdbc.datasource.init.DatabasePopulator;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

import javax.sql.DataSource;
import java.util.Arrays;
import java.util.List;

@Configuration
@Profile("h2db")
@PropertySource("classpath:rest/db.properties")
public class H2Configuration extends DatabaseConfiguration {

    @Value("${entities.location}")
    private String entitiesLocation;

    private final String drivers = "org.h2.Driver";
    private final String url = "jdbc:h2:mem:rest-db;DB_CLOSE_DELAY=-1;MODE=PostgreSQL;";
    private final String username = "SA";
    private final String password = "";
    private final String h2Dialect = "org.hibernate.dialect.H2Dialect";
    private final List<String> initScripts = Arrays.asList("rest-db/init.sql", "rest-db/testdata.sql");

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
        return h2Dialect;
    }

    @Override
    public void init(DataSource dataSource) {
        DatabasePopulator databasePopulator = new ResourceDatabasePopulator(initScripts.stream().map(ClassPathResource::new).toArray(Resource[]::new));
        DatabasePopulatorUtils.execute(databasePopulator, dataSource);
    }

}
