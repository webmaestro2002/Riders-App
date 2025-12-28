<%@ page language="java"
         contentType="text/html; charset=UTF-8"
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment | Ride App</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/payment.css">
</head>

<body class="payment-bg">

<div class="payment-container">
  <div class="card">

    <h2 class="payment-title">Payment</h2>
    <p class="payment-subtitle">Confirm and complete your payment</p>

    <div class="payment-amount">
        Total Fare: &#8377; <%= ride.getFare() %>
    </div>

    <form class="form" action="<%=request.getContextPath()%>/payment" method="post">

        <div class="payment-group">
            <label for="method">Payment Method</label>
            <select class="payment-select" id="method" name="method" required>
                <option value="CASH">Cash</option>
                <option value="CARD">Card</option>
                <option value="UPI">UPI</option>
            </select>
        </div>

        <button class="btn-primary" type="submit">
            Pay
        </button>

    </form>

  </div>
</div>

</body>
</html>
