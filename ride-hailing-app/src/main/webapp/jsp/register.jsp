<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register | Ride App</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/register.css">
</head>

<body class="register-bg">

<div class="center-screen">
  <div class="card register-card">

    <h2 class="register-title">Create Account</h2>
    <p class="register-subtitle">Join and start booking rides</p>

    <form action="<%=request.getContextPath()%>/register" method="post">

        <input class="input" type="text" name="fullName" placeholder="Full Name" required />
        <input class="input" type="email" name="email" placeholder="Email address" required />
        <input class="input" type="text" name="phone" placeholder="Phone number" required />
        <input class="input" type="password" name="password" placeholder="Password" required />

        <select class="select" name="role">
            <option value="CUSTOMER">Customer</option>
            <option value="DRIVER">Driver</option>
        </select>

        <input class="input" type="text" name="license" placeholder="Driving License (Drivers only)" />

        <button class="btn-primary" type="submit">Register</button>
    </form>

    <div class="error-msg">
        <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
    </div>

    <div class="login-link">
        Already have an account? <a href="login.jsp">Login</a>
    </div>

  </div>
</div>

</body>
</html>
