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
    <title>Dashboard</title>
</head>
<body>

<%-- ================= DRIVER DASHBOARD ================= --%>
<% if (loggedInUser instanceof Driver) { %>

    <h2>Welcome, Driver</h2>
    <p><b>Role:</b> DRIVER</p>

    <hr/>

    <h3>Driver Actions</h3>

    <!-- Correct: go through servlet -->
    <a href="<%= request.getContextPath() %>/ride">
        View Available Rides
    </a>

<% } %>

<%-- ================= CUSTOMER DASHBOARD ================= --%>
<% if (loggedInUser instanceof Customer) { %>

    <h2>Welcome, Customer</h2>
    <p><b>Role:</b> CUSTOMER</p>

    <hr/>

    <h3>Customer Actions</h3>

    <!-- ✅ FIXED LINK (NO DOUBLE jsp) -->
    <a href="<%= request.getContextPath() %>/jsp/requestRide.jsp">
        Request Ride
    </a>

<% } %>

<hr/>

<a href="<%= request.getContextPath() %>/logout">Logout</a>

</body>
</html>
