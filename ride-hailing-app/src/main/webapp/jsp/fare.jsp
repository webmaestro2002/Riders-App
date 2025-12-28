<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.training.project.rideapp.model.Ride" %>

<%
    Ride ride = (Ride) session.getAttribute("ride");
    if (ride == null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>

<html>
<head>
    <title>Fare Details</title>
</head>

<body>

<h2>Ride Fare Details</h2>

<p><b>Pickup:</b> <%= ride.getPickupLocation() %></p>
<p><b>Drop:</b> <%= ride.getDropLocation() %></p>
<p><b>Distance:</b> <%= ride.getDistance() %> km</p>

<p>
    <b>Total Fare:</b>
    &#8377; <%= ride.getFare() %>
</p>

<br/>

<form action="payment.jsp">
    <button type="submit">Proceed to Payment</button>
</form>

<br/>
<a href="dashboard.jsp">Cancel</a>

</body>
</html>
