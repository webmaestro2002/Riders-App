package com.training.project.rideapp.controller;

import com.training.project.rideapp.model.Customer;
import com.training.project.rideapp.model.Driver;
import com.training.project.rideapp.service.AuthService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final AuthService authService = new AuthService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String role = request.getParameter("role");

        try {
            if ("CUSTOMER".equalsIgnoreCase(role)) {
                Customer customer = new Customer();
                customer.setFullName(request.getParameter("fullName"));
                customer.setEmail(request.getParameter("email"));
                customer.setPhone(request.getParameter("phone"));
                customer.setPassword(request.getParameter("password"));

                authService.register(customer);

            } else if ("DRIVER".equalsIgnoreCase(role)) {
                Driver driver = new Driver();
                driver.setFullName(request.getParameter("fullName"));
                driver.setEmail(request.getParameter("email"));
                driver.setPhone(request.getParameter("phone"));
                driver.setPassword(request.getParameter("password"));
                driver.setLicenseNumber(request.getParameter("license"));

                authService.register(driver);
            }

            response.sendRedirect("jsp/login.jsp");

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("jsp/register.jsp").forward(request, response);
        }
    }
}
