package com.gago.rest.controllers;

import com.gago.rest.models.Commessa;
import com.gago.rest.services.CommessaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/commesse", produces = MediaType.APPLICATION_JSON_VALUE)
public class CommessaController {

    @Autowired
    private CommessaService commessaService;

    @GetMapping
    public ResponseEntity<List<Commessa>> findAll() {
        List<Commessa> response = commessaService.findAll();
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
