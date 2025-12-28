package com.training.project.rideapp.controller;

import com.training.project.rideapp.model.Customer;
import com.training.project.rideapp.model.Driver;
import com.training.project.rideapp.model.Ride;
import com.training.project.rideapp.model.RideStatus;
import com.training.project.rideapp.service.RideService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
        HttpSession session = request.getSession();

        // ================= CUSTOMER REQUESTS RIDE =================
        if ("REQUEST".equals(action)) {

            Customer customer = (Customer) session.getAttribute("loggedInUser");

            Ride ride = new Ride();
            ride.setPickupLocation(request.getParameter("pickup"));
            ride.setDropLocation(request.getParameter("drop"));
            ride.setDistance(Double.parseDouble(request.getParameter("distance")));
            ride.setCustomer(customer);
            ride.setStartTime(LocalDateTime.now());

            rideService.requestRide(ride);

            session.setAttribute("ride", ride);
            response.sendRedirect(request.getContextPath() + "/jsp/fare.jsp");
            return;
        }

        // ================= DRIVER ACCEPTS RIDE =================
        if ("ACCEPT".equals(action)) {

            Long rideId = Long.parseLong(request.getParameter("rideId"));
            Driver driver = (Driver) session.getAttribute("loggedInUser");

            rideService.acceptRide(rideId, driver);

            Ride updatedRide = rideService.getRideById(rideId);
            session.setAttribute("ride", updatedRide);

            response.sendRedirect(request.getContextPath() + "/jsp/rideAccepted.jsp");
            return;
        }

        // ================= DRIVER COMPLETES RIDE =================
        if ("COMPLETE".equals(action)) {

            Long rideId = Long.parseLong(request.getParameter("rideId"));

            // mark ride completed
            rideService.completeRide(rideId);

            // driver is now free
            session.removeAttribute("ride");

            // ✅ redirect to VIEW AVAILABLE RIDES (NOT payment)
            response.sendRedirect(request.getContextPath() + "/ride");
            return;
        }



        // ================= CUSTOMER CANCELS RIDE =================
        if ("CANCEL".equals(action)) {

            Ride ride = (Ride) session.getAttribute("ride");

            if (ride != null) {
                rideService.cancelRide(ride.getId());
            }

            session.removeAttribute("ride");
            response.sendRedirect(request.getContextPath() + "/jsp/dashboard.jsp");
        }
    }
}
