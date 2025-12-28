package com.training.project.rideapp.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "payments")
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double amount;

    @Column(nullable = false)
    private String paymentMethod; // CASH, CARD, UPI

    @Column(nullable = false)
    private String status; // SUCCESS, FAILED

    private LocalDateTime paymentTime;

    @OneToOne
    @JoinColumn(name = "ride_id", nullable = false)
    private Ride ride;

    public Payment() {
        this.paymentTime = LocalDateTime.now();
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public LocalDateTime getPaymentTime() { return paymentTime; }
    public void setPaymentTime(LocalDateTime paymentTime) { this.paymentTime = paymentTime; }

    public Ride getRide() { return ride; }
    public void setRide(Ride ride) { this.ride = ride; }
}
