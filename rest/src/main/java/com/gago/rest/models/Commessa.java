package com.gago.rest.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name="commessa")
public class Commessa {

    @Id
    @Column(name="key")
    private String key;

    @Column(name="description")
    private String description;

    @Column(name="color")
    private String color;

    @Column(name="img")
    private String img;

}
