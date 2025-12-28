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

    <!-- FIND DRIVER (NOT PAYMENT YET) -->
    <div class="fare-actions">
        <form action="waitingForDriver.jsp" method="get">
            <button class="btn-primary" type="submit">
                Find Driver
            </button>
        </form>
    </div>

    <div class="cancel-link">
        <form action="<%=request.getContextPath()%>/ride" method="post">
            <input type="hidden" name="action" value="CANCEL"/>
            <button type="submit" style="background:none;border:none;color:red;font-weight:600;">
                Cancel
            </button>
        </form>
    </div>

  </div>
</div>

</body>
</html>
