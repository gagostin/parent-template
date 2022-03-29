package com.gago.rest.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.gago.rest.utils.exceptions.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ExceptionResponse> handleException(HttpServletRequest request, Exception ex) {
        log.info("Intercepted {} while processing {}", ex.getClass().toString(), request.getRequestURL());
        log.error("GlobalExceptionHandler.handleException(Exception.class)", ex);

        if(ex.getMessage() == null || ex.getMessage().isBlank())
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        return new ResponseEntity<>(ExceptionResponse.builder().details(ex.getMessage()).build(), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(NotFoundException.class)
    public ResponseEntity<ExceptionResponse> handleException(HttpServletRequest request, NotFoundException ex) {
        log.info("Intercepted {} while processing {}", ex.getClass().toString(), request.getRequestURL());
        log.error("GlobalExceptionHandler.handleException(NotFoundException.class)", ex);

        if(ex.getMessage() == null || ex.getMessage().isBlank())
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(ExceptionResponse.builder().details(ex.getMessage()).build(), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(ConflictException.class)
    public ResponseEntity<ExceptionResponse> handleException(HttpServletRequest request, ConflictException ex) {
        log.info("Intercepted {} while processing {}", ex.getClass().toString(), request.getRequestURL());
        log.error("GlobalExceptionHandler.handleException(ConflictException.class)", ex);

        if(ex.getMessage() == null || ex.getMessage().isBlank())
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        return new ResponseEntity<>(ExceptionResponse.builder().details(ex.getMessage()).build(), HttpStatus.CONFLICT);
    }

    @ExceptionHandler(KeycloakException.class)
    public ResponseEntity<ExceptionResponse> handleException(HttpServletRequest request, KeycloakException ex) {
        log.info("Intercepted {} while processing {}", ex.getClass().toString(), request.getRequestURL());
        log.error("GlobalExceptionHandler.handleException(KeycloakException.class)", ex);

        if(ex.getMessage() == null || ex.getMessage().isBlank())
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        return new ResponseEntity<>(ExceptionResponse.builder().details(ex.getMessage()).build(), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler({MethodArgumentNotValidException.class})
    public ResponseEntity<List<ExceptionResponse>> handleMethodArgumentNotValidException(HttpServletRequest request, HttpServletResponse response, MethodArgumentNotValidException ex) {
        log.info("Intercepted {} while processing {}", ex.getClass().toString(), request.getRequestURL());
        log.error("GlobalExceptionHandler.handleException(MethodArgumentNotValidException.class)", ex);

        List<ExceptionResponse> details = ex.getBindingResult().getAllErrors().stream().map(oe -> ExceptionResponse.builder().details( oe.getDefaultMessage() ).build()).collect(Collectors.toList());
        return new ResponseEntity<>(details, HttpStatus.BAD_REQUEST);
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @Builder
    @JsonInclude(JsonInclude.Include.NON_NULL)
    public static class ExceptionResponse {

        private String details;

    }

}
