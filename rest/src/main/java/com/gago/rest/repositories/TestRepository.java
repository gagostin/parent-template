package com.gago.rest.repositories;

import com.gago.rest.models.Test;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TestRepository extends CrudRepository<Test, Integer> {

    List<Test> findAll();

}
