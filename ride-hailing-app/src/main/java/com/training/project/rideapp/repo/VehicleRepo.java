package com.training.project.rideapp.repo;

import com.training.project.rideapp.model.Vehicle;
import com.training.project.rideapp.util.HibernateUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class VehicleRepo {

    public void save(Vehicle vehicle) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(vehicle);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Vehicle findById(Long id) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            return em.find(Vehicle.class, id);
        } finally {
            em.close();
        }
    }

    public List<Vehicle> findByDriverId(Long driverId) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            TypedQuery<Vehicle> query =
                    em.createQuery(
                            "SELECT v FROM Vehicle v WHERE v.driver.id = :driverId",
                            Vehicle.class
                    );
            query.setParameter("driverId", driverId);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}
