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

    public List<Event> findAll(String userId) {
        log.info("getAll method started");
        List<Event> events = eventRepository.findByUserId(userId);
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
        createdEvents.forEach(createdEvent -> ids.add(createdEvent.getEventId()));

        log.info("create method ended. Ids of events created: {}", ids);
        return ids;
    }

    public Event find(String userId, Long eventId) throws NotFoundException {
        log.info("find method started with eventId = {}", eventId);

        Event event = eventRepository.findByUserIdAndEventId(userId, eventId);
        if(event == null) {
            log.error("Event with userId {} and eventId {} not found", userId, eventId);
            throw new NotFoundException(String.format("Event with userId %s and eventId %s not found", userId, eventId));
        }


        return event;
    }

    @Transactional
    public void delete(String userId, Long eventId) throws NotFoundException {
        log.info("delete method started with userId = {} and eventId = {}", userId, eventId);

        Event event = eventRepository.findByUserIdAndEventId(userId, eventId);
        if(event == null) {
            log.error("Event with userId {} and eventId {} not found", userId, eventId);
            throw new NotFoundException(String.format("Event with userId %s and eventId %s not found", userId, eventId));
        }

        eventRepository.deleteByEventId(event.getEventId());
        log.info("delete method ended successfully");
    }

    public Event update(String userId, Long eventId, EventRequest eventRequest) throws NotFoundException {
        log.info("update method started with userId = {}, eventId = {} and request = {}", userId, eventId, eventRequest);

        Event event = eventRepository.findByUserIdAndEventId(userId, eventId);
        if(event == null) {
            log.error("Event with userId {} and eventId {} not found", userId, eventId);
            throw new NotFoundException(String.format("Event with userId %s and eventId %s not found", userId, eventId));
        }

        Commessa commessa = event.getCommessa();
        if(!commessa.getKey().equals(eventRequest.getCommessaKey())) {
            commessa = commessaService.find(eventRequest.getCommessaKey());
        }

        event.setEditable(
                (eventRequest.getEditable() != null && !eventRequest.getEditable().equals(event.getEditable())) ?
                        eventRequest.getEditable() :
                        event.getEditable()
        );
        event.setStartDate(
                (eventRequest.getStartDate() != null && !eventRequest.getStartDate().equals(event.getStartDate())) ?
                        eventRequest.getStartDate() :
                        event.getStartDate()
        );
        event.setEndDate(
                (eventRequest.getEndDate() != null && !eventRequest.getEndDate().equals(event.getEndDate())) ?
                        eventRequest.getEndDate() :
                        event.getEndDate()
        );
        event.setAllDay(
                (eventRequest.getAllDay() != null && !eventRequest.getAllDay().equals(event.getAllDay())) ?
                        eventRequest.getAllDay() :
                        event.getAllDay()
        );
        event.setCommessa(commessa);

        log.info("trying to update event with data: {}", event);
        event = eventRepository.save(event);

        log.info("update method ended successfully");
        return event;
    }
}
