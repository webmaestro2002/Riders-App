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
<html>
<head>
    <title>Ride Accepted</title>
</head>
<body>

<h2>Ride Accepted Successfully ✅</h2>

<p><b>Status:</b> <%= ride.getStatus() %></p>
<p><b>Pickup:</b> <%= ride.getPickupLocation() %></p>
<p><b>Drop:</b> <%= ride.getDropLocation() %></p>
<p><b>Fare:</b> &#8377;<%= ride.getFare() %></p>

<hr/>

<form action="<%= request.getContextPath() %>/ride" method="post">
    <input type="hidden" name="action" value="COMPLETE"/>
    <input type="hidden" name="rideId" value="<%= ride.getId() %>"/>
    <button type="submit">Complete Ride</button>
</form>



<br/>

<a href="<%= request.getContextPath() %>/jsp/dashboard.jsp">
    Back to Dashboard
</a>

</body>
</html>
