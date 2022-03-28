package com.gago.rest.services;

import com.gago.rest.models.Test;
import com.gago.rest.utils.ComponentsLoader;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
@SpringBootTest(classes = ComponentsLoader.class)
@ActiveProfiles("h2db")
public class TestServiceIT {

    @Autowired
    private TestService service;

    @org.junit.jupiter.api.Test
    void findAllSuccessfully() {
        List<Test> tests = service.findAll();
        assertNotNull(tests);
        assertFalse(tests.isEmpty());
        assertEquals(1, tests.size());
    }

}
