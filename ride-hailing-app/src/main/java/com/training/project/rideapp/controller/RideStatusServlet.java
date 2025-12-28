package com.training.project.rideapp.controller;

import com.training.project.rideapp.model.Ride;
import com.training.project.rideapp.service.RideService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/ride-status")
public class RideStatusServlet extends HttpServlet {

    private final RideService rideService = new RideService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        response.setContentType("text/plain");

        String rideIdParam = request.getParameter("rideId");
        if (rideIdParam == null) {
            response.getWriter().write("NO_RIDE_ID");
            return;
        }

        Long rideId = Long.parseLong(rideIdParam);
        Ride ride = rideService.getRideById(rideId);

        if (ride == null) {
            response.getWriter().write("NO_RIDE");
            return;
        }

        // ✅ ALWAYS DB STATE
        response.getWriter().write(ride.getStatus().name());
    }
}
