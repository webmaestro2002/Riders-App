package com.training.project.rideapp.service;

public class FareService {

    private static final double BASE_FARE = 50.0;
    private static final double COST_PER_KM = 10.0;

    public double calculateFare(double distance) {
        if (distance <= 0) {
            throw new RuntimeException("Invalid distance");
        }
        return BASE_FARE + (distance * COST_PER_KM);
    }
}
