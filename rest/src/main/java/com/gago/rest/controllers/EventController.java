package com.gago.rest.controllers;

import com.gago.rest.models.Event;
import com.gago.rest.models.requests.EventRequest;
import com.gago.rest.services.EventService;
import com.gago.rest.utils.exceptions.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping(value = "/events", produces = MediaType.APPLICATION_JSON_VALUE)
public class EventController {

    @Autowired
    private EventService eventService;

    @GetMapping
    public ResponseEntity<List<Event>> findAll(@AuthenticationPrincipal Principal principal) {
        List<Event> response = eventService.findAll(principal.getName());
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<List<Long>> create(@AuthenticationPrincipal Principal principal, @RequestBody List<EventRequest> events) throws NotFoundException {
        List<Long> ids = eventService.create(principal.getName(), events);
        return new ResponseEntity<>(ids, HttpStatus.CREATED);
    }

    @GetMapping("{eventId}")
    public ResponseEntity<Event> find(@AuthenticationPrincipal Principal principal, @PathVariable("eventId") Long eventId) throws NotFoundException {
        Event event = eventService.find(principal.getName(), eventId);
        return new ResponseEntity<>(event, HttpStatus.OK);
    }

    @DeleteMapping("{eventId}")
    public ResponseEntity<Void> delete(@AuthenticationPrincipal Principal principal, @PathVariable("eventId") Long eventId) throws NotFoundException {
        eventService.delete(principal.getName(), eventId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
