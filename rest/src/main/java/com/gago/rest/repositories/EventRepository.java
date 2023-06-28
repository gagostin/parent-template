package com.gago.rest.repositories;

import com.gago.rest.models.Event;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface EventRepository extends CrudRepository<Event, Integer> {

    List<Event> findByUserId(String userId);

}
