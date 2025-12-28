package com.training.project.rideapp.controller;

import com.training.project.rideapp.model.Ride;
import com.training.project.rideapp.service.PaymentService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    private final PaymentService paymentService = new PaymentService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        Ride ride = (Ride) session.getAttribute("ride");

        String method = request.getParameter("method");
        paymentService.makePayment(ride, method);

        response.sendRedirect("jsp/rating.jsp");
    }
}
