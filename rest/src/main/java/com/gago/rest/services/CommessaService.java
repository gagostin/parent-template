package com.gago.rest.services;

import com.gago.rest.models.Commessa;
import com.gago.rest.repositories.CommessaRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Slf4j
public class CommessaService {

    @Autowired
    private CommessaRepository commessaRepository;

    public List<Commessa> findAll() {
        log.info("getAll method started");
        List<Commessa> commesse = commessaRepository.findAll();
        log.info("getAll method ended with a response of {} commesse", commesse.size());
        return commesse;
    }

}
