<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Request Ride | Ride App</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/requestRide.css">
</head>

<body class="request-bg">

<div class="request-container">
  <div class="card">

    <h2 class="request-title">Request a Ride</h2>
    <p class="request-subtitle">Enter ride details to calculate fare</p>

    <form class="form" action="<%= request.getContextPath() %>/ride" method="post">

        <input type="hidden" name="action" value="REQUEST"/>

        <div class="form-group">
            <label for="pickup">Pickup Location</label>
            <input class="input" type="text" id="pickup" name="pickup" placeholder="Enter pickup location" required />
        </div>

        <div class="form-group">
            <label for="drop">Drop Location</label>
            <input class="input" type="text" id="drop" name="drop" placeholder="Enter drop location" required />
        </div>

        <div class="form-group">
            <label for="distance">Distance (km)</label>
            <input class="input" type="number" id="distance" name="distance" step="0.1" min="0.1" placeholder="e.g. 12.5" required />
        </div>

        <button class="btn-primary" type="submit">
            Get Fare
        </button>

    </form>

  </div>
</div>

</body>
</html>
