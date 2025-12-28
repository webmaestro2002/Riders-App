<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Login</h2>

<form action="<%=request.getContextPath()%>/login" method="post">
    Email: <input type="email" name="email" required /><br/><br/>
    Password: <input type="password" name="password" required /><br/><br/>
    <button type="submit">Login</button>
</form>

<p style="color:red;">
    <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
</p>

<a href="register.jsp">New user? Register here</a>
</body>
</html>
