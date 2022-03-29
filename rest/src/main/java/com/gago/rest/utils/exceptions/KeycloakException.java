package com.gago.rest.utils.exceptions;

public class KeycloakException extends Exception {

    private static final long serialVersionUID = 2911758277678887913L;

    public KeycloakException() {
    }

    public KeycloakException(String message) {
        super(message);
    }
}
