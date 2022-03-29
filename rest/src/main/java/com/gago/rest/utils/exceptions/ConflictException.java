package com.gago.rest.utils.exceptions;

public class ConflictException extends Exception {

    private static final long serialVersionUID = 9154310938968912402L;

    public ConflictException() {
    }

    public ConflictException(String message) {
        super(message);
    }
}
