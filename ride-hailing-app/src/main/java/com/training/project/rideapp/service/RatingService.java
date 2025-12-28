package com.training.project.rideapp.service;

import com.training.project.rideapp.model.Rating;
import com.training.project.rideapp.repo.RatingRepo;

public class RatingService {

    private final RatingRepo ratingRepository = new RatingRepo();

    public void submitRating(Rating rating) {
        if (rating.getStars() < 1 || rating.getStars() > 5) {
            throw new RuntimeException("Rating must be between 1 and 5");
        }
        ratingRepository.save(rating);
    }
}
