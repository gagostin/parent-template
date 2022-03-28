package com.gago.rest.controllers;

import com.gago.rest.models.Test;
import com.gago.rest.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Arrays;
import java.util.List;

import static org.hamcrest.Matchers.hasSize;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(TestController.class)
@ActiveProfiles({"test", "h2db"})
public class TestControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private TestService service;

    @org.junit.jupiter.api.Test
    public void shouldReturnAllTestEntities() throws Exception {
        List<Test> results = Arrays.asList(
                Test.builder()
                        .id("1")
                        .key("HELLO")
                        .value("WORLD")
                        .build(),
                Test.builder()
                        .id("2")
                        .key("CIAO")
                        .value("MONDO")
                        .build()
        );
        when(service.findAll()).thenReturn(results);

        this.mockMvc.perform(get("/tests")
                .contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].id").value(1))
                .andExpect(jsonPath("$[0].key").value("HELLO"))
                .andExpect(jsonPath("$[0].value").value("WORLD"))
                .andExpect(jsonPath("$[1].id").value(2))
                .andExpect(jsonPath("$[1].key").value("CIAO"))
                .andExpect(jsonPath("$[1].value").value("MONDO"));

        verify(service, times(1)).findAll();
    }

}
