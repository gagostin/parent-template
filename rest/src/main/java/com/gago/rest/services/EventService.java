package com.gago.rest.services;

import com.gago.rest.models.Commessa;
import com.gago.rest.models.Event;
import com.gago.rest.models.requests.EventRequest;
import com.gago.rest.repositories.EventRepository;
import com.gago.rest.utils.exceptions.NotFoundException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Component
@Slf4j
public class EventService {

    @Autowired
    private EventRepository eventRepository;

    @Autowired
    private CommessaService commessaService;

    public List<Event> findAll() {
        log.info("getAll method started");
        List<Event> events = eventRepository.findAll();
        log.info("getAll method ended with a response of {} event", events.size());
        return events;
    }

    @Transactional
    public List<Long> create(String userId, List<EventRequest> events) throws NotFoundException {
        log.info("create method started with request of {} events", events.size());

        List<Event> eventsToSave = new ArrayList<>();
        for(EventRequest eventRequest : events) {
            Commessa commessa = commessaService.find(eventRequest.getCommessaKey());
            log.info("Commessa {} found successfully", eventRequest.getCommessaKey());

            Event event = eventRequest.buildEvent(userId, commessa);
            log.info("Event {} correctly created from request {}", event, eventRequest);
            eventsToSave.add(event);
        }
        Iterable<Event> createdEvents = eventRepository.saveAll(eventsToSave);

        List<Long> ids = new ArrayList<>();
        createdEvents.forEach(createdEvent -> ids.add(createdEvent.getId()));

        log.info("create method ended. Ids of events created: {}", ids);
        return ids;
    }
}
