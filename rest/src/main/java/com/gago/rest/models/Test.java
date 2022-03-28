package com.gago.rest.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name="test")
public class Test implements Serializable {

    @Id
    @Column(name = "test_id")
    private String id;

    @Column(name = "test_key")
    private String key;

    @Column(name = "test_value")
    private String value;
}
