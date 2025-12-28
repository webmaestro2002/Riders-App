<%@ page import="com.training.project.rideapp.model.Customer" %>
<%@ page import="com.training.project.rideapp.model.Driver" %>

<%
    Object loggedInUser = session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard | Ride App</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/dashboard.css">
</head>

<body class="dashboard-bg">

<div class="dashboard-container">

    <%-- ================= DRIVER DASHBOARD ================= --%>
    <% if (loggedInUser instanceof Driver) { %>

        <div class="dashboard-header">
            <h2>Welcome, Driver</h2>
            <span class="role-badge">DRIVER</span>
        </div>

        <div class="action-grid">
            <div class="card action-card">
                <h3>Available Rides</h3>
                <p>View and accept nearby ride requests</p>
                <a class="btn-primary" href="<%= request.getContextPath() %>/ride">
                    View Rides
                </a>
            </div>
        </div>

    <% } %>

    <%-- ================= CUSTOMER DASHBOARD ================= --%>
    <% if (loggedInUser instanceof Customer) { %>

        <div class="dashboard-header">
            <h2>Welcome, Customer</h2>
            <span class="role-badge">CUSTOMER</span>
        </div>

        <div class="action-grid">
            <div class="card action-card">
                <h3>Request a Ride</h3>
                <p>Book a ride by entering pickup & drop location</p>
                <a class="btn-primary" href="<%= request.getContextPath() %>/jsp/requestRide.jsp">
                    Request Ride
                </a>
            </div>
        </div>

    <% } %>

    <div class="logout">
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>

</div>

</body>
</html>
