<%@ page import="java.util.List" %>
<%@ page import="com.training.project.rideapp.model.Ride" %>

<html>
<head>
    <title>Available Rides</title>
</head>
<body>

<h2>Available Rides</h2>

<%
    List<Ride> rides = (List<Ride>) request.getAttribute("rides");

    if (rides == null || rides.isEmpty()) {
%>
        <p>No rides available.</p>
<%
    } else {
        for (Ride ride : rides) {
%>
            <p>
                Pickup: <%= ride.getPickupLocation() %> |
                Drop: <%= ride.getDropLocation() %> |
                Fare: &#8377;<%= ride.getFare() %>
            </p>

            <form action="<%= request.getContextPath() %>/ride" method="post">
                <input type="hidden" name="action" value="ACCEPT"/>
                <input type="hidden" name="rideId" value="<%= ride.getId() %>"/>
                <button type="submit">Accept Ride</button>
            </form>
            <hr/>
<%
        }
    }
%>

<a href="<%= request.getContextPath() %>/jsp/dashboard.jsp">Back</a>


</body>
</html>
