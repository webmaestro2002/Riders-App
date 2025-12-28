package com.training.project.rideapp.model;

import jakarta.persistence.*;

@Entity
@Table(name = "customers")
public class Customer extends User {

    @Column(nullable = true)
    private String preferredPaymentMethod;

    public String getPreferredPaymentMethod() {
        return preferredPaymentMethod;
    }

    public void setPreferredPaymentMethod(String preferredPaymentMethod) {
        this.preferredPaymentMethod = preferredPaymentMethod;
    }
}
