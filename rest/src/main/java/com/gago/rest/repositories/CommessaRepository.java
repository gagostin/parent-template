package com.gago.rest.repositories;

import com.gago.rest.models.Commessa;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CommessaRepository extends CrudRepository<Commessa, Integer> {

    List<Commessa> findAll();

    Commessa findByKey(String key);

}
