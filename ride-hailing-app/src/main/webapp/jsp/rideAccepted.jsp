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
    <title>Ride Accepted | Ride App</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/rideAccepted.css">
</head>

<body class="ride-bg">

<div class="ride-container">

    <div class="card">

        <h2>Ride Accepted</h2>
        <span class="status-badge">CONFIRMED</span>

        <div class="ride-details">
            <p><span>Status:</span> <%= ride.getStatus() %></p>
            <p><span>Pickup:</span> <%= ride.getPickupLocation() %></p>
            <p><span>Drop:</span> <%= ride.getDropLocation() %></p>

            <div class="fare">
                Fare: &#8377; <%= ride.getFare() %>
            </div>
        </div>

        <!-- ONLY ACTION ALLOWED -->
        <div class="actions">
            <form action="<%= request.getContextPath() %>/ride" method="post">
                <input type="hidden" name="action" value="COMPLETE"/>
                <input type="hidden" name="rideId" value="<%= ride.getId() %>"/>
                <button class="btn-primary" type="submit">
                    Complete Ride
                </button>
            </form>
        </div>

    </div>

</div>

</body>
</html>
