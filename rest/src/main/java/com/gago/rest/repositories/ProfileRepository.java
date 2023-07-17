package com.gago.rest.repositories;

import com.gago.rest.models.Event;
import com.gago.rest.models.Profile;
import org.springframework.data.repository.CrudRepository;

public interface ProfileRepository extends CrudRepository<Profile, Integer> {

    Profile findByUserId(String userId);
}
