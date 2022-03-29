package com.gago.rest.utils.exceptions;

public class ForbiddenException extends Exception {

    private static final long serialVersionUID = -6622035711376577643L;

    public ForbiddenException() {
    }

    public ForbiddenException(String message) {
        super(message);
    }
}
