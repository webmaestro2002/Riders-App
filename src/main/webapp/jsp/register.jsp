<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<h2>Register</h2>

<form action="<%=request.getContextPath()%>/register" method="post">
    Full Name: <input type="text" name="fullName" required /><br/><br/>
    Email: <input type="email" name="email" required /><br/><br/>
    Phone: <input type="text" name="phone" required /><br/><br/>
    Password: <input type="password" name="password" required /><br/><br/>

    Role:
    <select name="role">
        <option value="CUSTOMER">Customer</option>
        <option value="DRIVER">Driver</option>
    </select><br/><br/>

    License (Drivers only): <input type="text" name="license" /><br/><br/>

    <button type="submit">Register</button>
</form>

<p style="color:red;">
    <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
</p>

<a href="login.jsp">Back to Login</a>
</body>
</html>
