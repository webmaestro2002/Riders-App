package com.training.project.rideapp.repo;

import com.training.project.rideapp.model.Ride;
import com.training.project.rideapp.model.RideStatus;
import com.training.project.rideapp.util.HibernateUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class RideRepo {

    public void save(Ride ride) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(ride);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Ride findById(Long id) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            return em.find(Ride.class, id);
        } finally {
            em.close();
        }
    }

    public void update(Ride ride) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(ride);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Ride> findByStatus(RideStatus status) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            TypedQuery<Ride> query =
                em.createQuery(
                    "SELECT r FROM Ride r WHERE r.status = :status",
                    Ride.class
                );
            query.setParameter("status", status);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    // ✅ ADDITION: used for driver "View Available Rides"
    public List<Ride> findAvailableRides() {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            return em.createQuery(
                "SELECT r FROM Ride r WHERE r.status = :status AND r.driver IS NULL",
                Ride.class
            )
            .setParameter("status", RideStatus.REQUESTED)
            .getResultList();
        } finally {
            em.close();
        }
    }
}
