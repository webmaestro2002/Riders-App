package com.training.project.rideapp.controller;

import com.training.project.rideapp.model.*;
import com.training.project.rideapp.service.RatingService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/rating")
public class RatingServlet extends HttpServlet {

    private final RatingService ratingService = new RatingService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();

        Ride ride = (Ride) session.getAttribute("ride");
        User user = (User) session.getAttribute("loggedInUser");

        Rating rating = new Rating();
        rating.setRide(ride);
        rating.setStars(Integer.parseInt(request.getParameter("stars")));
        rating.setComment(request.getParameter("comment"));
        rating.setGivenBy(user);

        // ✅ Role decision using inheritance
        if (user instanceof Driver) {
            rating.setGivenTo(ride.getCustomer());
        } else if (user instanceof Customer) {
            rating.setGivenTo(ride.getDriver());
        }

        ratingService.submitRating(rating);

        response.sendRedirect("jsp/dashboard.jsp");
    }
}
