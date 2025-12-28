<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Request Ride</title>
</head>
<body>

<h2>Request a Ride</h2>

<form action="<%= request.getContextPath() %>/ride" method="post">

    <input type="hidden" name="action" value="REQUEST"/>

    <label>
        Pickup Location:
        <input type="text" name="pickup" required />
    </label>
    <br/><br/>

    <label>
        Drop Location:
        <input type="text" name="drop" required />
    </label>
    <br/><br/>

    <label>
        Distance (km):
        <input type="number" name="distance" step="0.1" min="0.1" required />
    </label>
    <br/><br/>

    <button type="submit">Get Fare</button>
</form>

<br/><hr/><br/>

<a href="<%= request.getContextPath() %>/jsp/dashboard.jsp">
    Back to Dashboard
</a>

</body>
</html>
