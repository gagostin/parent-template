package com.gago.rest.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gago.rest.models.Profile;
import com.gago.rest.models.requests.EventRequest;
import com.gago.rest.models.requests.ProfileRequest;
import com.gago.rest.services.ProfileService;
import com.gago.rest.utils.exceptions.ConflictException;
import com.gago.rest.utils.exceptions.NotFoundException;
import org.junit.jupiter.api.BeforeEach;
import org.keycloak.KeycloakPrincipal;
import org.keycloak.KeycloakSecurityContext;
import org.keycloak.representations.AccessToken;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.security.Principal;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(ProfileController.class)
@ActiveProfiles({"test", "h2db"})
public class ProfileControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ProfileService service;

    private ObjectMapper mapper = new ObjectMapper();

    @BeforeEach
    public void setUp() {
        AccessToken token = new AccessToken();

        token.setGivenName("Test");
        token.setFamilyName("User");
        token.setEmail("test.user@monthly.com");

        KeycloakSecurityContext keycloakSecurityContext = mock(KeycloakSecurityContext.class);
        given(keycloakSecurityContext.getToken()).willReturn(token);

        KeycloakPrincipal principal = mock(KeycloakPrincipal.class);
        given(principal.getKeycloakSecurityContext()).willReturn(keycloakSecurityContext);
        given(principal.getName()).willReturn("54eb2f58-9503-4b29-8920-722d571026a4");

        Authentication auth = mock(Authentication.class);
        given(auth.getPrincipal()).willReturn(principal);

        SecurityContextHolder.getContext().setAuthentication(auth);
    }

    @org.junit.jupiter.api.Test
    public void shouldCreateProfile() throws Exception {

        ProfileRequest request = ProfileRequest.builder().build();
        Profile response = request.buildProfile(
                "54eb2f58-9503-4b29-8920-722d571026a4",
                "Test",
                "User",
                "test.user@monthly.com"
        );
        response.setProfileId(1L);

        when(service.create(anyString(), anyString(), anyString(), anyString(), any(ProfileRequest.class))).thenReturn(response);

        this.mockMvc.perform(post("/profiles")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(mapper.writeValueAsString(request)))
                .andDo(print())
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.profileId").value(1L))
                .andExpect(jsonPath("$.userId").value("54eb2f58-9503-4b29-8920-722d571026a4"))
                .andExpect(jsonPath("$.name").value("Test"))
                .andExpect(jsonPath("$.surname").value("User"))
                .andExpect(jsonPath("$.email").value("test.user@monthly.com"));
    }

    @org.junit.jupiter.api.Test
    public void shouldAlreadyExistsProfileToCreate() throws Exception {
        doThrow(ConflictException.class).when(service).create(anyString(), anyString(), anyString(), anyString(), any(ProfileRequest.class));

        this.mockMvc.perform(post("/profiles")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(mapper.writeValueAsString(ProfileRequest.builder().build())))
                .andDo(print())
                .andExpect(status().isConflict());
    }

    @org.junit.jupiter.api.Test
    public void shouldFindProfileSuccessfully() throws Exception {

        Profile response = Profile.builder()
                .profileId(1L)
                .userId("54eb2f58-9503-4b29-8920-722d571026a4")
                .name("Test")
                .surname("User")
                .email("test.user@monthly.com")
                .fiscalCode("TSTUSR03E10H501L")
                .address("Via dei prati fiscali 1")
                .city("Rome")
                .postalCode("00166")
                .birthDate("10/05/2003")
                .age(23)
                .gender("M")
                .build();
        when(service.find(anyString())).thenReturn(response);

        this.mockMvc.perform(get("/profiles")
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.profileId").value(1))
                .andExpect(jsonPath("$.userId").value("54eb2f58-9503-4b29-8920-722d571026a4"))
                .andExpect(jsonPath("$.name").value("Test"))
                .andExpect(jsonPath("$.surname").value("User"))
                .andExpect(jsonPath("$.email").value("test.user@monthly.com"))
                .andExpect(jsonPath("$.fiscalCode").value("TSTUSR03E10H501L"))
                .andExpect(jsonPath("$.address").value("Via dei prati fiscali 1"))
                .andExpect(jsonPath("$.city").value("Rome"))
                .andExpect(jsonPath("$.postalCode").value("00166"))
                .andExpect(jsonPath("$.birthDate").value("10/05/2003"))
                .andExpect(jsonPath("$.age").value(23))
                .andExpect(jsonPath("$.gender").value("M"));
    }

    @org.junit.jupiter.api.Test
    public void shouldNotFindProfile() throws Exception {
        doThrow(NotFoundException.class).when(service).find(anyString());

        this.mockMvc.perform(get("/profiles")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(mapper.writeValueAsString(ProfileRequest.builder().build())))
                .andDo(print())
                .andExpect(status().isNotFound());
    }

    @org.junit.jupiter.api.Test
    public void shouldUpdateProfile() throws Exception {
        Profile response = Profile.builder()
                .profileId(1L)
                .userId("54eb2f58-9503-4b29-8920-722d571026a4")
                .name("Test")
                .surname("User")
                .email("test.user@monthly.com")
                .fiscalCode("TSTUSR03E10H501L")
                .address("Via delle medaglie d'oro")
                .city("Rome")
                .postalCode("00166")
                .birthDate("10/05/2003")
                .age(23)
                .gender("M")
                .build();

        when(service.update(anyString(), any(ProfileRequest.class))).thenReturn(response);

        this.mockMvc.perform(patch("/profiles")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(mapper.writeValueAsString(ProfileRequest.builder().address("Via delle medaglie d'oro").build())))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.profileId").value(1))
                .andExpect(jsonPath("$.userId").value("54eb2f58-9503-4b29-8920-722d571026a4"))
                .andExpect(jsonPath("$.name").value("Test"))
                .andExpect(jsonPath("$.surname").value("User"))
                .andExpect(jsonPath("$.email").value("test.user@monthly.com"))
                .andExpect(jsonPath("$.fiscalCode").value("TSTUSR03E10H501L"))
                .andExpect(jsonPath("$.address").value("Via delle medaglie d'oro"))
                .andExpect(jsonPath("$.city").value("Rome"))
                .andExpect(jsonPath("$.postalCode").value("00166"))
                .andExpect(jsonPath("$.birthDate").value("10/05/2003"))
                .andExpect(jsonPath("$.age").value(23))
                .andExpect(jsonPath("$.gender").value("M"));
    }

    @org.junit.jupiter.api.Test
    public void shouldNotFindProfileToUpdate() throws Exception {
        doThrow(NotFoundException.class).when(service).update(anyString(), any(ProfileRequest.class));

        this.mockMvc.perform(patch("/profiles")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(mapper.writeValueAsString(ProfileRequest.builder().build())))
                .andDo(print())
                .andExpect(status().isNotFound());
    }

}
