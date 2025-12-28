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
    <title>Finding a Driver | Ride App</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">

    <style>
        .wait-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .spinner {
            width: 44px;
            height: 44px;
            border: 5px solid #a7f3d0;
            border-top: 5px solid #059669;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>

    <!-- ✅ POLL DB FOR ACCEPT -->
    <script>
        const rideId = <%= ride.getId() %>;

        setInterval(() => {
            fetch("<%=request.getContextPath()%>/ride-status?rideId=" + rideId)
                .then(res => res.text())
                .then(status => {
                    console.log("Ride status:", status);

                    if (status === "ACCEPTED") {
                        window.location.replace("customerRideAccepted.jsp");
                    }
                });
        }, 3000);
    </script>
</head>

<body>

<div class="wait-container">
    <div class="card" style="max-width:420px; text-align:center;">

        <h2>Finding a Driver</h2>

        <p>
            Pickup: <b><%= ride.getPickupLocation() %></b><br/>
            Drop: <b><%= ride.getDropLocation() %></b>
        </p>

        <div class="spinner"></div>

        <p style="color:#64748b;">Status: REQUESTED</p>
        <p style="font-size:14px; color:#64748b;">
            Waiting for a nearby driver to accept your ride
        </p>

    </div>
</div>

</body>
</html>
