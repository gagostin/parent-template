package com.gago.rest.services;

import com.gago.rest.models.Profile;
import com.gago.rest.models.requests.ProfileRequest;
import com.gago.rest.utils.ComponentsLoader;
import com.gago.rest.utils.DatabaseLoader;
import com.gago.rest.utils.exceptions.ConflictException;
import com.gago.rest.utils.exceptions.NotFoundException;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
@SpringBootTest(classes = {ComponentsLoader.class, DatabaseLoader.class})
@ActiveProfiles("h2db")
public class ProfileServiceIT {

    @Autowired
    private ProfileService profileService;

    @org.junit.jupiter.api.Test
    void createProfileSuccessfully() throws ConflictException {
        String userId = UUID.randomUUID().toString();
        Profile profile = profileService.create(userId, "Paolo", "Rossi", "paolo.rossi@monthly.com", ProfileRequest.builder().build());
        assertNotNull(profile);
        assertEquals(userId, profile.getUserId());
        assertEquals("Paolo", profile.getName());
        assertEquals("Rossi", profile.getSurname());
        assertEquals("paolo.rossi@monthly.com", profile.getEmail());
    }

    @org.junit.jupiter.api.Test
    void createProfileAlreadyExisting() {
        assertThrows(ConflictException.class, () ->
                profileService.create(
                        "54eb2f58-9503-4b29-8920-722d571026a4",
                        "User",
                        "Existing",
                        "user.existing@monthly.com",
                        ProfileRequest.builder().build()
                )
        );
    }

    @org.junit.jupiter.api.Test
    void findProfileSuccessfully() throws NotFoundException {
        Profile profile = profileService.find("54eb2f58-9503-4b29-8920-722d571026a4");
        assertNotNull(profile);
        assertEquals(1L, profile.getProfileId());
        assertEquals("54eb2f58-9503-4b29-8920-722d571026a4", profile.getUserId());
        assertEquals("Test", profile.getName());
        assertEquals("User", profile.getSurname());
        assertEquals("test.user@monthly.com", profile.getEmail());
        assertEquals("TSTUSR03E10H501L", profile.getFiscalCode());
        assertEquals("Via dei prati fiscali 1", profile.getAddress());
        assertEquals("Rome", profile.getCity());
        assertEquals("00166", profile.getPostalCode());
        assertEquals("10/05/2003", profile.getBirthDate());
        assertEquals(23, profile.getAge());
        assertEquals("M", profile.getGender());
    }

    @org.junit.jupiter.api.Test
    void profileNotFound() {
        assertThrows(NotFoundException.class, () -> profileService.find("54eb2f58-9503-4b29-8920-notexisting0"));
    }

    @org.junit.jupiter.api.Test
    void updateProfileSuccessfully() throws NotFoundException {
        Profile profile = profileService.update("7cb96f8e-4573-4529-a75a-4362c268f75e", ProfileRequest.builder().address("Via delle medaglie d'oro 10").build());
        assertNotNull(profile);
        assertEquals(2L, profile.getProfileId());
        assertEquals("7cb96f8e-4573-4529-a75a-4362c268f75e", profile.getUserId());
        assertEquals("Test", profile.getName());
        assertEquals("User", profile.getSurname());
        assertEquals("test.user.update@monthly.com", profile.getEmail());
        assertEquals("TSTUSR03E10H501L", profile.getFiscalCode());
        assertEquals("Via delle medaglie d'oro 10", profile.getAddress());
        assertEquals("Rome", profile.getCity());
        assertEquals("00166", profile.getPostalCode());
        assertEquals("10/05/2003", profile.getBirthDate());
        assertEquals(23, profile.getAge());
        assertEquals("M", profile.getGender());
    }

    @org.junit.jupiter.api.Test
    void profileToUpdateNotFound() {
        assertThrows(NotFoundException.class, () -> profileService.update("54eb2f58-9503-4b29-8920-notexisting0", ProfileRequest.builder().build()));
    }

}
