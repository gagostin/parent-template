package com.gago.rest.controllers;

import com.gago.rest.models.Commessa;
import com.gago.rest.services.CommessaService;
import com.gago.rest.utils.exceptions.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.hamcrest.Matchers.hasSize;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(CommessaController.class)
@ActiveProfiles({"test", "h2db"})
public class CommessaControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private CommessaService service;

    @org.junit.jupiter.api.Test
    public void shouldReturnAllCommesse() throws Exception {
        List<Commessa> results = List.of(
                Commessa.builder()
                        .key("AAA")
                        .description("A description")
                        .color("red")
                        .img("prova.jpeg")
                        .build()
        );
        when(service.findAll()).thenReturn(results);

        this.mockMvc.perform(get("/commesse")
                .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].key").value("AAA"))
                .andExpect(jsonPath("$[0].description").value("A description"))
                .andExpect(jsonPath("$[0].color").value("red"))
                .andExpect(jsonPath("$[0].img").value("prova.jpeg"));

        verify(service, times(1)).findAll();
    }

    @org.junit.jupiter.api.Test
    public void shouldFindCommessa() throws Exception {

        Commessa results = Commessa.builder()
                .key("AAA")
                .description("A description")
                .color("red")
                .img("prova.jpeg")
                .build();

        when(service.find(anyString())).thenReturn(results);

        this.mockMvc.perform(get("/commesse/AAA")
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").exists())
                .andExpect(jsonPath("$.key").value("AAA"))
                .andExpect(jsonPath("$.description").value("A description"))
                .andExpect(jsonPath("$.color").value("red"))
                .andExpect(jsonPath("$.img").value("prova.jpeg"));

        verify(service, times(1)).find("AAA");
    }

    @org.junit.jupiter.api.Test
    public void shouldNotFindCommessa() throws Exception {

        doThrow(NotFoundException.class).when(service).find(anyString());

        this.mockMvc.perform(get("/commesse/NAN")
                        .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isNotFound());

        verify(service, times(1)).find("NAN");
    }

}
