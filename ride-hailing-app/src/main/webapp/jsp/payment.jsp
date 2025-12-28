<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="com.training.project.rideapp.model.Ride" %>

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
    <meta charset="UTF-8">
    <title>Payment</title>
</head>
<body>

<h2>Payment</h2>

<p><strong>Total Fare: &#8377;<%= ride.getFare() %></strong></p>

<form action="<%=request.getContextPath()%>/payment" method="post">
    Payment Method:
    <select name="method" required>
        <option value="CASH">Cash</option>
        <option value="CARD">Card</option>
        <option value="UPI">UPI</option>
    </select><br/><br/>

    <button type="submit">Pay</button>
</form>

</body>
</html>
