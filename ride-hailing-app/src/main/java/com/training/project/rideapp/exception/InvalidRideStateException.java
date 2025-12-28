package com.training.project.rideapp.exception;

public class InvalidRideStateException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public InvalidRideStateException(String message) {
        super(message);
    }
}
