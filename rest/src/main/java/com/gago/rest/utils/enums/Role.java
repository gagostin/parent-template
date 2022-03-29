package com.gago.rest.utils.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum Role {

    ROLE_ADMIN("ADMIN"),
    ROLE_USER("USER");

    @Getter
    String onKeycloak;

}
