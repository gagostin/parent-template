package com.gago.rest.utils.exceptions;

public class UnauthorizedException extends Exception {

    private static final long serialVersionUID = 8488754544591377472L;

    public UnauthorizedException() {
    }

    public UnauthorizedException(String message) {
        super(message);
    }
}
