package com.training.project.rideapp.service;

import com.training.project.rideapp.model.Driver;
import com.training.project.rideapp.model.Ride;
import com.training.project.rideapp.model.RideStatus;
import com.training.project.rideapp.repo.RideRepo;

import java.time.LocalDateTime;
import java.util.List;

public class RideService {

    private final RideRepo rideRepo = new RideRepo();
    private final FareService fareService = new FareService();

    // CUSTOMER requests a ride
    public void requestRide(Ride ride) {
        ride.setFare(fareService.calculateFare(ride.getDistance()));
        ride.setStatus(RideStatus.REQUESTED);
        rideRepo.save(ride);
    }

    // DRIVER views available rides
    public List<Ride> getAvailableRides() {
        return rideRepo.findAvailableRides();
    }

    // DRIVER accepts a ride
    public void acceptRide(Long rideId, Driver driver) {
        Ride ride = rideRepo.findById(rideId);

        if (ride == null)
            throw new IllegalStateException("Ride not found");

        if (ride.getStatus() != RideStatus.REQUESTED)
            throw new IllegalStateException("Ride already accepted");

        ride.setDriver(driver);
        ride.setStatus(RideStatus.ACCEPTED);
        ride.setStartTime(LocalDateTime.now());

        rideRepo.update(ride);
    }

    // DRIVER completes ride
    public void completeRide(Long rideId) {
        Ride ride = rideRepo.findById(rideId);

        if (ride == null)
            throw new IllegalStateException("Ride not found");

        ride.setStatus(RideStatus.COMPLETED);
        ride.setEndTime(LocalDateTime.now());

        rideRepo.update(ride);
    }

    // CUSTOMER cancels ride
    public void cancelRide(Long rideId) {
        Ride ride = rideRepo.findById(rideId);

        if (ride == null)
            throw new IllegalStateException("Ride not found");

        ride.setStatus(RideStatus.CANCELLED);
        rideRepo.update(ride);
    }

    public Ride getRideById(Long rideId) {
        return rideRepo.findById(rideId);
    }
}
