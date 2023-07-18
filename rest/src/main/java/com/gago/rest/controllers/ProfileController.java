package com.gago.rest.controllers;

import com.gago.rest.models.Profile;
import com.gago.rest.models.requests.ProfileRequest;
import com.gago.rest.services.ProfileService;
import com.gago.rest.utils.exceptions.ConflictException;
import com.gago.rest.utils.exceptions.NotFoundException;
import org.keycloak.KeycloakPrincipal;
import org.keycloak.KeycloakSecurityContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
@RequestMapping(value = "/profiles", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProfileController {

    @Autowired
    private ProfileService profileService;

    @GetMapping
    public ResponseEntity<Profile> find(@AuthenticationPrincipal Principal principal) throws NotFoundException {
        Profile response = profileService.find(principal.getName());
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<Profile> create(@AuthenticationPrincipal Principal principal, @RequestBody ProfileRequest profileRequest) throws ConflictException {
        KeycloakSecurityContext securityContext = ((KeycloakPrincipal<?>) principal).getKeycloakSecurityContext();
        Profile profile = profileService.create(principal.getName(), securityContext.getToken().getGivenName(), securityContext.getToken().getFamilyName(), securityContext.getToken().getEmail(), profileRequest);
        return new ResponseEntity<>(profile, HttpStatus.CREATED);
    }

    @PatchMapping
    public ResponseEntity<Profile> update(@AuthenticationPrincipal Principal principal, @RequestBody ProfileRequest profileRequest) throws NotFoundException {
        Profile profile = profileService.update(principal.getName(), profileRequest);
        return new ResponseEntity<>(profile, HttpStatus.OK);
    }

}
