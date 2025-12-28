package com.training.project.rideapp.repo;

import com.training.project.rideapp.model.Payment;
import com.training.project.rideapp.util.HibernateUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class PaymentRepo {

    public void save(Payment payment) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(payment);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Payment findByRideId(Long rideId) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            TypedQuery<Payment> query =
                    em.createQuery(
                            "SELECT p FROM Payment p WHERE p.ride.id = :rideId",
                            Payment.class
                    );
            query.setParameter("rideId", rideId);
            return query.getResultStream().findFirst().orElse(null);
        } finally {
            em.close();
        }
    }
}
