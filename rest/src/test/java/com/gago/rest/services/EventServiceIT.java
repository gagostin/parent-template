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
        List<Event> events = service.findAll("54eb2f58-9503-4b29-8920-722d571026a4");
        assertNotNull(events);
        assertFalse(events.isEmpty());
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

        List<Event> events = service.findAll("54eb2f58-9503-4b29-8920-722d571026a4");
        assertNotNull(events);
        assertFalse(events.isEmpty());
        assertTrue(events.stream().anyMatch(e -> e.getEventId().equals(ids.get(0))));
        assertTrue(events.stream().anyMatch(e -> e.getEventId().equals(ids.get(1))));
    }

    @org.junit.jupiter.api.Test
    void creationFailsForCommessaNotFound() {
        assertThrows(NotFoundException.class, () -> service.create("54eb2f58-9503-4b29-8920-722d571026a4", List.of(
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
        Event event = service.find("54eb2f58-9503-4b29-8920-722d571026a4", 1L);

        assertNotNull(event);
        assertEquals(1, event.getEventId());
        assertEquals(false, event.getAllDay());
        assertEquals("2020-06-21T09:00:00+02:00", event.getStartDate());
        assertEquals("2020-06-21T18:00:00+02:00", event.getEndDate());
        assertEquals(true, event.getEditable());
        assertEquals("54eb2f58-9503-4b29-8920-722d571026a4", event.getUserId());

        assertNotNull(event.getCommessa());
        assertEquals("SMW", event.getCommessa().getKey());
    }

    @org.junit.jupiter.api.Test
    void findEventFailsForNotFound() {
        assertThrows(NotFoundException.class, () -> service.find("54eb2f58-9503-4b29-8920-722d571026a4", 0L));
    }

    @org.junit.jupiter.api.Test
    void deleteSuccessfully() throws NotFoundException {
        service.delete("54eb2f58-9503-4b29-8920-722d571026a4", 2L);

        assertThrows(NotFoundException.class, () -> service.find("54eb2f58-9503-4b29-8920-722d571026a4", 2L));
    }

    @org.junit.jupiter.api.Test
    void deleteEventFailsForNotFound() {
        assertThrows(NotFoundException.class, () -> service.delete("54eb2f58-9503-4b29-8920-722d571026a4", 0L));
    }

    @org.junit.jupiter.api.Test
    void updateSuccessfully() throws NotFoundException {
        Event original = service.find("54eb2f58-9503-4b29-8920-722d571026a4", 3L);
        assertNotNull(original);
        assertEquals("2023-06-21T18:00:00+02:00", original.getEndDate());
        assertNotNull(original.getCommessa());
        assertEquals("SMW", original.getCommessa().getKey());

        Event updated = service.update("54eb2f58-9503-4b29-8920-722d571026a4", 3L,
                EventRequest.builder()
                        .endDate("2023-06-21T14:00:00+02:00")
                        .commessaKey("CLI")
                        .build());
        assertNotNull(updated);
        assertEquals("2023-06-21T14:00:00+02:00", updated.getEndDate());
        assertNotNull(updated.getCommessa());
        assertEquals("CLI", updated.getCommessa().getKey());
    }

    @org.junit.jupiter.api.Test
    void updateEventFailsForNotFound() {
        assertThrows(NotFoundException.class, () -> service.update("54eb2f58-9503-4b29-8920-722d571026a4", 0L, EventRequest.builder().build()));
    }

    @org.junit.jupiter.api.Test
    void updateEventFailsForCommessaNotFound() {
        assertThrows(NotFoundException.class, () -> service.update("54eb2f58-9503-4b29-8920-722d571026a4", 3L,
                EventRequest.builder()
                        .commessaKey("NAN")
                        .build()));
    }

}
