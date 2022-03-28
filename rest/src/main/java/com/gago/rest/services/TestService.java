package com.gago.rest.services;

import com.gago.rest.models.Test;
import com.gago.rest.repositories.TestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class TestService {

    @Autowired
    private TestRepository testRepository;

    public List<Test> findAll() {
        return testRepository.findAll();
    }

}
