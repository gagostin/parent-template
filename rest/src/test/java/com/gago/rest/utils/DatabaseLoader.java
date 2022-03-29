package com.gago.rest.utils;

import com.gago.rest.configurations.db.H2Configuration;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Import;

@TestConfiguration
@Import(H2Configuration.class)
public class DatabaseLoader {
}
