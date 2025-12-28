package com.training.project.rideapp.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

/**
 * Utility class for managing JPA EntityManagerFactory
 */
public class HibernateUtil {

    private static final String PERSISTENCE_UNIT_NAME = "rideappPU";
    private static EntityManagerFactory entityManagerFactory;

    // Private constructor to prevent instantiation
    private HibernateUtil() {
    }

    /**
     * Create and return EntityManager
     */
    public static EntityManager getEntityManager() {
        if (entityManagerFactory == null) {
            try {
                entityManagerFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Failed to create EntityManagerFactory");
            }
        }
        return entityManagerFactory.createEntityManager();
    }

    /**
     * Close EntityManagerFactory (call on application shutdown)
     */
    public static void close() {
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
        }
    }
}
