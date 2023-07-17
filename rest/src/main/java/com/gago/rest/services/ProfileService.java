package com.gago.rest.services;

import com.gago.rest.models.Profile;
import com.gago.rest.models.requests.ProfileRequest;
import com.gago.rest.repositories.ProfileRepository;
import com.gago.rest.utils.exceptions.ConflictException;
import com.gago.rest.utils.exceptions.NotFoundException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class ProfileService {

    @Autowired
    private ProfileRepository profileRepository;

    public Profile create(String userId, String name, String surname, String email, ProfileRequest profileRequest) throws ConflictException {
        log.info("create method started with userId={}, name={}, surname={}, email={}, request={}", userId, name, surname, email, profileRequest);

        try {
            Profile alreadyExisting = find(userId);
            log.error("found profile with userId = {}. the profile belongs to {} {}, {}.", alreadyExisting.getUserId(), alreadyExisting.getName(), alreadyExisting.getSurname(), alreadyExisting.getEmail());
            throw new ConflictException(String.format(
                    "found profile with userId = %s. the profile belongs to %s %s, %s.",
                    alreadyExisting.getUserId(), alreadyExisting.getName(), alreadyExisting.getSurname(), alreadyExisting.getEmail()
            ));
        } catch (NotFoundException e) {
            log.info("profile with userId = {} not found. ready to create profile..", userId);

            Profile profile = profileRequest.buildProfile(userId, name, surname, email);
            profile = profileRepository.save(profile);
            log.info("create method ended. Created: {}", profile);
            return profile;
        }
    }

    public Profile find(String userId) throws NotFoundException {
        log.info("find method started with userId = {}", userId);

        Profile profile = profileRepository.findByUserId(userId);
        if(profile == null) {
            log.error("Profile with userId {} not found", userId);
            throw new NotFoundException(String.format("Profile with userId %s not found", userId));
        }

        return profile;
    }
}
