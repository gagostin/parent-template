package com.gago.rest.services;

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
        List<Event> events = service.findAll("e8bf1bce-112d-434a-bafa-a8f7defcce8c");
        assertNotNull(events);
        assertFalse(events.isEmpty());
    }

    @org.junit.jupiter.api.Test
    void createSuccessfully() throws NotFoundException {
        List<Long> ids = service.create("e8bf1bce-112d-434a-bafa-a8f7defcce8c", List.of(
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

        List<Event> events = service.findAll("e8bf1bce-112d-434a-bafa-a8f7defcce8c");
        assertNotNull(events);
        assertFalse(events.isEmpty());
        assertTrue(events.stream().anyMatch(e -> e.getEventId().equals(ids.get(0))));
        assertTrue(events.stream().anyMatch(e -> e.getEventId().equals(ids.get(1))));
    }

    @org.junit.jupiter.api.Test
    void creationFailsForCommessaNotFound() {
        assertThrows(NotFoundException.class, () -> service.create("e8bf1bce-112d-434a-bafa-a8f7defcce8c", List.of(
                EventRequest.builder()
                        .allDay(false)
                        .startDate("2020-06-21T09:00:00+02:00")
                        .endDate("2020-06-21T13:00:00+02:00")
                        .editable(true)
                        .commessaKey("NAN")
                        .build()
        )));
    }

    @org.junit.jupiter.api.Test
    void findSuccessfully() throws NotFoundException {
        Event event = service.find("e8bf1bce-112d-434a-bafa-a8f7defcce8c", 1L);

        assertNotNull(event);
        assertEquals(1, event.getEventId());
        assertEquals(false, event.getAllDay());
        assertEquals("2020-06-21T09:00:00+02:00", event.getStartDate());
        assertEquals("2020-06-21T18:00:00+02:00", event.getEndDate());
        assertEquals(true, event.getEditable());
        assertEquals("e8bf1bce-112d-434a-bafa-a8f7defcce8c", event.getUserId());

        assertNotNull(event.getCommessa());
        assertEquals("SMW", event.getCommessa().getKey());
    }

    @org.junit.jupiter.api.Test
    void findEventFailsForNotFound() throws NotFoundException {
        assertThrows(NotFoundException.class, () -> service.find("e8bf1bce-112d-434a-bafa-a8f7defcce8c", 0L));
    }

    @org.junit.jupiter.api.Test
    void deleteSuccessfully() throws NotFoundException {
        service.delete("e8bf1bce-112d-434a-bafa-a8f7defcce8c", 2L);

        assertThrows(NotFoundException.class, () -> service.find("e8bf1bce-112d-434a-bafa-a8f7defcce8c", 2L));
    }

    @org.junit.jupiter.api.Test
    void deleteEventFailsForNotFound() throws NotFoundException {
        assertThrows(NotFoundException.class, () -> service.delete("e8bf1bce-112d-434a-bafa-a8f7defcce8c", 0L));
    }

}
