package com.training.project.rideapp.util;

public final class DBConstants {

    // Prevent instantiation
    private DBConstants() {}

    // Database configuration
    public static final String DB_URL =
            "jdbc:mysql://localhost:3306/ride_hailing_db?useSSL=false&serverTimezone=UTC";

    public static final String DB_USERNAME = "root";
    public static final String DB_PASSWORD = "TANMAY21104022";

    // Hibernate / JPA
    public static final String PERSISTENCE_UNIT_NAME = "rideappPU";

    // Ride status constants
    public static final String RIDE_REQUESTED = "REQUESTED";
    public static final String RIDE_ACCEPTED = "ACCEPTED";
    public static final String RIDE_COMPLETED = "COMPLETED";
    public static final String RIDE_CANCELLED = "CANCELLED";

    // User roles
    public static final String ROLE_CUSTOMER = "CUSTOMER";
    public static final String ROLE_DRIVER = "DRIVER";

    // Payment status
    public static final String PAYMENT_SUCCESS = "SUCCESS";
    public static final String PAYMENT_FAILED = "FAILED";
}
