package com.training.project.rideapp.service;

import com.training.project.rideapp.model.Payment;
import com.training.project.rideapp.model.Ride;
import com.training.project.rideapp.repo.PaymentRepo;

public class PaymentService {

    private final PaymentRepo paymentRepository = new PaymentRepo();

    public void makePayment(Ride ride, String method) {
        Payment payment = new Payment();
        payment.setRide(ride);
        payment.setAmount(ride.getFare());
        payment.setPaymentMethod(method);
        payment.setStatus("SUCCESS");

        paymentRepository.save(payment);
    }
}
