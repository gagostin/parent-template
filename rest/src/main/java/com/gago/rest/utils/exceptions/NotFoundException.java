package com.gago.rest.utils.exceptions;

public class NotFoundException extends Exception {

    private static final long serialVersionUID = -9081549316305174085L;

    public NotFoundException() {
    }

    public NotFoundException(String message) {
        super(message);
    }

}
