package com.gago.rest.repositories;

import com.gago.rest.models.Event;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EventRepository extends CrudRepository<Event, Integer> {

    List<Event> findByUserId(String userId);

    Event findByUserIdAndEventId(String userId, Long eventId);

    @Modifying
    @Query("delete from Event e where e.eventId=:eventId")
    void deleteByEventId(@Param("eventId") Long eventId);

}
