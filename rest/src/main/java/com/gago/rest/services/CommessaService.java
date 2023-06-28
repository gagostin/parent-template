package com.gago.rest.services;

import com.gago.rest.models.Commessa;
import com.gago.rest.repositories.CommessaRepository;
import com.gago.rest.utils.exceptions.NotFoundException;
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

    public Commessa find(String key) throws NotFoundException {
        log.info("find method started");

        Commessa commessa = commessaRepository.findByKey(key);
        if(commessa == null) {
            log.error("Commessa with key {} not found", key);
            throw new NotFoundException(String.format("Commessa with key %s not found", key));
        }

        log.info("find method ended with this response: {}", commessa);
        return commessa;
    }
}
