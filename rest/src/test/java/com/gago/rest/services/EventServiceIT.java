package com.gago.rest.services;

import com.gago.rest.models.Commessa;
import com.gago.rest.models.Event;
import com.gago.rest.models.requests.EventRequest;
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
public class EventServiceIT {

    @Autowired
    private EventService service;

    @org.junit.jupiter.api.Test
    void findAllSuccessfully() {
        List<Event> events = service.findAll();
        assertNotNull(events);
        assertFalse(events.isEmpty());
        assertEquals(1, events.size());
    }

    @org.junit.jupiter.api.Test
    void createSuccessfully() throws NotFoundException {
        List<Long> ids = service.create("54eb2f58-9503-4b29-8920-722d571026a4", List.of(
                EventRequest.builder()
                        .allDay(false)
                        .startDate("2020-06-21T09:00:00+02:00")
                        .endDate("2020-06-21T13:00:00+02:00")
                        .editable(true)
                        .commessaKey("SMW")
                        .build(),
                EventRequest.builder()
                        .allDay(false)
                        .startDate("2020-06-21T14:00:00+02:00")
                        .endDate("2020-06-21T18:00:00+02:00")
                        .editable(true)
                        .commessaKey("PAR")
                        .build()
        ));
        assertNotNull(ids);
        assertFalse(ids.isEmpty());
        assertEquals(2, ids.size());

        List<Event> events = service.findAll();
        assertNotNull(events);
        assertFalse(events.isEmpty());
        assertTrue(events.stream().anyMatch(e -> e.getId().equals(ids.get(0))));
        assertTrue(events.stream().anyMatch(e -> e.getId().equals(ids.get(1))));
    }

}
