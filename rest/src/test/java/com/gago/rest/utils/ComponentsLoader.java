package com.gago.rest.utils;

import com.gago.rest.configurations.db.H2Configuration;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;

@TestConfiguration
@ComponentScan(basePackages = {
        "com.gago.rest.models",
        "com.gago.rest.repositories",
        "com.gago.rest.services",
        "com.gago.rest.utils.*",
})
@Import(H2Configuration.class)
public class ComponentsLoader {
}
