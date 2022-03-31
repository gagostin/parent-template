package com.gago.rest.utils.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum Role {

    ROLE_USER("user"),
    ROLE_ADMIN("admin");

    @Getter
    String onKeycloak;

}
