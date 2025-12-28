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

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        Ride ride = (Ride) session.getAttribute("ride");
        User user = (User) session.getAttribute("loggedInUser");

        if (ride == null || user == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        Rating rating = new Rating();
        rating.setRide(ride);
        rating.setStars(Integer.parseInt(request.getParameter("stars")));
        rating.setComment(request.getParameter("comment"));
        rating.setGivenBy(user);

        if (user instanceof Customer) {
            rating.setGivenTo(ride.getDriver());
        } else if (user instanceof Driver) {
            rating.setGivenTo(ride.getCustomer());
        }

        ratingService.submitRating(rating);

        // ✅ clear only ride, NOT session
        session.removeAttribute("ride");

        // ✅ role-safe redirect
        response.sendRedirect(request.getContextPath() + "/jsp/dashboard.jsp");
    }
}
