package com.gago.rest.services;

import com.gago.rest.models.Commessa;
import com.gago.rest.utils.ComponentsLoader;
import com.gago.rest.utils.DatabaseLoader;
import com.gago.rest.utils.exceptions.NotFoundException;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
@SpringBootTest(classes = {ComponentsLoader.class, DatabaseLoader.class})
@ActiveProfiles("h2db")
public class CommessaServiceIT {

    @Autowired
    private CommessaService service;

    @org.junit.jupiter.api.Test
    void findAllSuccessfully() {
        List<Commessa> commesse = service.findAll();
        assertNotNull(commesse);
        assertFalse(commesse.isEmpty());
        assertEquals(6, commesse.size());
    }

    @org.junit.jupiter.api.Test
    void findByKeySuccessfully() throws NotFoundException {
        Commessa commessa = service.find("SMW");
        assertNotNull(commessa);
        assertEquals("SMW", commessa.getKey());
        assertEquals("red", commessa.getColor());
        assertEquals("Smart Working", commessa.getDescription());
        assertEquals("home.jpeg", commessa.getImg());
    }

    @org.junit.jupiter.api.Test
    void findByKeyReturnsNotFound() {
        assertThrows(NotFoundException.class, () -> service.find("NAN"));
    }

}
