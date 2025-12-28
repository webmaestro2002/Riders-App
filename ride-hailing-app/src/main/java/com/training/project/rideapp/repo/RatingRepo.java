package com.training.project.rideapp.repo;

import com.training.project.rideapp.model.Rating;
import com.training.project.rideapp.util.HibernateUtil;
import jakarta.persistence.EntityManager;

public class RatingRepo{

    public void save(Rating rating) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(rating);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Rating findById(Long id) {
        EntityManager em = HibernateUtil.getEntityManager();
        try {
            return em.find(Rating.class, id);
        } finally {
            em.close();
        }
    }
}
