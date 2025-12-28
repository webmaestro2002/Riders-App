<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.training.project.rideapp.model.Ride" %>

<%
    Ride ride = (Ride) session.getAttribute("ride");
    if (ride == null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fare Details | Ride App</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fare.css">
</head>

<body class="fare-bg">

<div class="fare-container">
  <div class="card">

    <h2 class="fare-title">Fare Details</h2>

    <div class="fare-details">
        <p><span>Pickup:</span> <%= ride.getPickupLocation() %></p>
        <p><span>Drop:</span> <%= ride.getDropLocation() %></p>
        <p><span>Distance:</span> <%= ride.getDistance() %> km</p>
    </div>

    <div class="fare-amount">
        Total Fare: &#8377; <%= ride.getFare() %>
    </div>

    <div class="fare-actions">
        <form action="payment.jsp" method="get">
            <button class="btn-primary" type="submit">
                Proceed to Payment
            </button>
        </form>
    </div>

    <div class="cancel-link">
        <a href="dashboard.jsp">Cancel</a>
    </div>

  </div>
</div>

</body>
</html>
