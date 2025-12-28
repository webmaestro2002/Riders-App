<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.training.project.rideapp.model.Ride" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Rides | Ride App</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/driverRides.css">
</head>

<body>

<div class="rides-container">

    <div class="rides-header">
        <h2>Available Rides</h2>
    </div>

    <%
        List<Ride> rides = (List<Ride>) request.getAttribute("rides");

        if (rides == null || rides.isEmpty()) {
    %>
        <!-- EMPTY STATE -->
        <div class="card empty-state">
            <h3>No rides available</h3>
            <p>Please check again in a few minutes.</p>
        </div>
    <%
        } else {
    %>
        <!-- RIDE LIST -->
        <div class="ride-list">
        <%
            for (Ride ride : rides) {
        %>
            <div class="card ride-card">

                <div class="ride-info">
                    <p><span>Pickup:</span> <%= ride.getPickupLocation() %></p>
                    <p><span>Drop:</span> <%= ride.getDropLocation() %></p>
                    <p><span>Fare:</span> &#8377; <%= ride.getFare() %></p>
                </div>

                <div class="accept-form">
                    <form action="<%= request.getContextPath() %>/ride" method="post">
                        <input type="hidden" name="action" value="ACCEPT"/>
                        <input type="hidden" name="rideId" value="<%= ride.getId() %>"/>
                        <button class="btn-primary" type="submit">
                            Accept Ride
                        </button>
                    </form>
                </div>

            </div>
        <%
            }
        %>
        </div>
    <%
        }
    %>

    <!-- BACK TO DASHBOARD (ALWAYS VISIBLE) -->
    <div class="back-link">
        <a href="<%= request.getContextPath() %>/jsp/dashboard.jsp" class="btn-primary">
            Back to Dashboard
        </a>
    </div>

</div>

</body>
</html>
