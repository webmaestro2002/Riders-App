<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Ride App</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
</head>

<body class="login-bg">

<div class="center-screen">
  <div class="card login-card">

    <h2 class="login-title">Welcome Back</h2>
    <p class="login-subtitle">Login to book your next ride</p>

    <form action="<%=request.getContextPath()%>/login" method="post">
        <input class="input" type="email" name="email" placeholder="Email address" required />
        <input class="input" type="password" name="password" placeholder="Password" required />
        <button class="btn-primary" type="submit">Login</button>
    </form>

    <div class="error-msg">
        <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
    </div>

    <div class="register-link">
        New here? <a href="register.jsp">Create an account</a>
    </div>

  </div>
</div>

</body>
</html>
