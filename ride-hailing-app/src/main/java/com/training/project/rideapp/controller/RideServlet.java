package com.training.project.rideapp.controller;

import com.training.project.rideapp.model.Customer;
import com.training.project.rideapp.model.Driver;
import com.training.project.rideapp.model.Ride;
import com.training.project.rideapp.service.RideService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/ride")
public class RideServlet extends HttpServlet {

    private final RideService rideService = new RideService();

    // ================= DRIVER: VIEW AVAILABLE RIDES =================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        List<Ride> rides = rideService.getAvailableRides();
        request.setAttribute("rides", rides);

        try {
            request.getRequestDispatcher("jsp/driverRides.jsp")
                   .forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // ================= ALL ACTIONS =================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        Object user = session.getAttribute("loggedInUser");

        // ================= CUSTOMER REQUEST =================
        if ("REQUEST".equals(action)) {

            if (!(user instanceof Customer)) {
                response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
                return;
            }

            Customer customer = (Customer) user;

            Ride ride = new Ride();
            ride.setPickupLocation(request.getParameter("pickup"));
            ride.setDropLocation(request.getParameter("drop"));
            ride.setDistance(Double.parseDouble(request.getParameter("distance")));
            ride.setCustomer(customer);
            ride.setStartTime(LocalDateTime.now());

            rideService.requestRide(ride);

            // store ride for customer polling
            session.setAttribute("ride", ride);

            // after fare page, customer MUST go to waiting page
            response.sendRedirect(request.getContextPath() + "/jsp/fare.jsp");
            return;
        }

        // ================= DRIVER ACCEPT =================
        if ("ACCEPT".equals(action)) {

            if (!(user instanceof Driver)) {
                response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
                return;
            }

            Driver driver = (Driver) user;
            Long rideId = Long.parseLong(request.getParameter("rideId"));

            rideService.acceptRide(rideId, driver);

            // driver-only session update
            Ride updatedRide = rideService.getRideById(rideId);
            session.setAttribute("ride", updatedRide);

            // customer will auto-redirect via polling
            response.sendRedirect(request.getContextPath() + "/jsp/rideAccepted.jsp");
            return;
        }

        // ================= DRIVER COMPLETE =================
        if ("COMPLETE".equals(action)) {

            if (!(user instanceof Driver)) {
                response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
                return;
            }

            Long rideId = Long.parseLong(request.getParameter("rideId"));

            System.out.println("✅ DRIVER COMPLETED rideId=" + rideId);

            rideService.completeRide(rideId);

            // DO NOT invalidate session
            // DO NOT remove loggedInUser

            response.sendRedirect(request.getContextPath() + "/ride");
            return;
        }
    }
}
