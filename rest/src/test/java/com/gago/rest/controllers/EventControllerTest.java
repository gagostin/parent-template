package com.gago.rest.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gago.rest.models.Commessa;
import com.gago.rest.models.Event;
import com.gago.rest.models.requests.EventRequest;
import com.gago.rest.services.EventService;
import com.gago.rest.utils.exceptions.NotFoundException;
import org.junit.jupiter.api.BeforeEach;
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

import static org.hamcrest.Matchers.hasSize;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(EventController.class)
@ActiveProfiles({"test", "h2db"})
public class EventControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private EventService service;

    private ObjectMapper mapper = new ObjectMapper();

    @BeforeEach
    public void setUp() {
        Principal principal = Mockito.mock(Principal.class);
        Authentication authentication = Mockito.mock(Authentication.class);
        SecurityContext securityContext = Mockito.mock(SecurityContext.class);

        Mockito.when(securityContext.getAuthentication()).thenReturn(authentication);
        Mockito.when(authentication.getPrincipal()).thenReturn(principal);
        Mockito.when(principal.getName()).thenReturn("e8bf1bce-112d-434a-bafa-a8f7defcce8c");
        SecurityContextHolder.setContext(securityContext);
    }

    @org.junit.jupiter.api.Test
    public void shouldReturnAllEvents() throws Exception {
        List<Event> results = List.of(
                Event.builder()
                        .eventId(1L)
                        .allDay(false)
                        .startDate("2023-06-21T09:00:00+02:00")
                        .endDate("2023-06-21T18:00:00+02:00")
                        .editable(true)
                        .userId("e8bf1bce-112d-434a-bafa-a8f7defcce8c")
                        .commessa(Commessa.builder()
                                .key("AAA")
                                .description("A description")
                                .color("red")
                                .img("prova.jpeg")
                                .build())
                        .build()
        );
        when(service.findAll("e8bf1bce-112d-434a-bafa-a8f7defcce8c")).thenReturn(results);

        this.mockMvc.perform(get("/events")
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].eventId").value(1))
                .andExpect(jsonPath("$[0].allDay").value(false))
                .andExpect(jsonPath("$[0].startDate").value("2023-06-21T09:00:00+02:00"))
                .andExpect(jsonPath("$[0].endDate").value("2023-06-21T18:00:00+02:00"))
                .andExpect(jsonPath("$[0].editable").value(true))
                .andExpect(jsonPath("$[0].userId").value("e8bf1bce-112d-434a-bafa-a8f7defcce8c"))
                .andExpect(jsonPath("$[0].commessa.key").value("AAA"))
                .andExpect(jsonPath("$[0].commessa.description").value("A description"))
                .andExpect(jsonPath("$[0].commessa.color").value("red"))
                .andExpect(jsonPath("$[0].commessa.img").value("prova.jpeg"));

        verify(service, times(1)).findAll("e8bf1bce-112d-434a-bafa-a8f7defcce8c");
    }

    @org.junit.jupiter.api.Test
    public void shouldCreateEvent() throws Exception {

        List<EventRequest> request = List.of(
                EventRequest.builder()
                        .allDay(false)
                        .startDate("2020-06-21T09:00:00+02:00")
                        .endDate("2020-06-21T18:00:00+02:00")
                        .editable(true)
                        .commessaKey("FER")
                        .build(),
                EventRequest.builder()
                        .allDay(false)
                        .startDate("2020-06-21T09:00:00+02:00")
                        .endDate("2020-06-21T18:00:00+02:00")
                        .editable(true)
                        .commessaKey("FER")
                        .build()
        );

        when(service.create(anyString(), any())).thenReturn(List.of(1L, 2L));

        this.mockMvc.perform(post("/events")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(mapper.writeValueAsString(request)))
                .andDo(print())
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$[0]").value(1L))
                .andExpect(jsonPath("$[1]").value(2L));
    }

    @org.junit.jupiter.api.Test
    public void shouldNotFindCommessaForCreateEvent() throws Exception {
        List<EventRequest> request = List.of(
                EventRequest.builder()
                        .allDay(false)
                        .startDate("2020-06-21T09:00:00+02:00")
                        .endDate("2020-06-21T18:00:00+02:00")
                        .editable(true)
                        .commessaKey("NAN")
                        .build()
        );

        doThrow(NotFoundException. class).when(service).create(anyString(), any());

        this.mockMvc.perform(post("/events")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(mapper.writeValueAsString(request)))
                .andDo(print())
                .andExpect(status().isNotFound());
    }

    @org.junit.jupiter.api.Test
    public void shouldFindEventSuccessfully() throws Exception {

        Event results = Event.builder()
                .eventId(1L)
                .allDay(false)
                .startDate("2023-06-21T09:00:00+02:00")
                .endDate("2023-06-21T18:00:00+02:00")
                .editable(true)
                .userId("e8bf1bce-112d-434a-bafa-a8f7defcce8c")
                .commessa(Commessa.builder()
                        .key("AAA")
                        .description("A description")
                        .color("red")
                        .img("prova.jpeg")
                        .build())
                .build();

        when(service.find(anyString(), anyLong())).thenReturn(results);

        this.mockMvc.perform(get("/events/1")
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").exists())
                .andExpect(jsonPath("$.eventId").value(1L))
                .andExpect(jsonPath("$.allDay").value(false))
                .andExpect(jsonPath("$.startDate").value("2023-06-21T09:00:00+02:00"))
                .andExpect(jsonPath("$.endDate").value("2023-06-21T18:00:00+02:00"))
                .andExpect(jsonPath("$.editable").value(true))
                .andExpect(jsonPath("$.userId").value("e8bf1bce-112d-434a-bafa-a8f7defcce8c"))
                .andExpect(jsonPath("$.commessa.key").value("AAA"))
                .andExpect(jsonPath("$.commessa.description").value("A description"))
                .andExpect(jsonPath("$.commessa.color").value("red"))
                .andExpect(jsonPath("$.commessa.img").value("prova.jpeg"));
    }

    @org.junit.jupiter.api.Test
    public void shouldNotFindEvent() throws Exception {
        doThrow(NotFoundException.class).when(service).find(anyString(), anyLong());

        this.mockMvc.perform(get("/events/0")
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isNotFound());
    }

    @org.junit.jupiter.api.Test
    public void shouldDeleteEventSuccessfully() throws Exception {
        doNothing().when(service).delete(anyString(), anyLong());

        this.mockMvc.perform(delete("/events/2")
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk());
    }

    @org.junit.jupiter.api.Test
    public void shouldNotFindEventToDelete() throws Exception {
        doThrow(NotFoundException.class).when(service).delete(anyString(), anyLong());

        this.mockMvc.perform(delete("/events/0")
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isNotFound());
    }

    @org.junit.jupiter.api.Test
    public void shouldUpdateEventSuccessfully() throws Exception {

    }

    @org.junit.jupiter.api.Test
    public void shouldNotFindEventToUpdate() throws Exception {

    }



}
