<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="styles/styleLogin.css">
</head>
<body>
    <div class="login wrap">
        <form action="loginServlet" method="post">
            <div class="h1">Login</div>
            <input autocomplete="off" pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" placeholder="Email" id="email" name="email" type="text">
            <input autocomplete="off" placeholder="Password" id="password" name="password" type="password">
            <input value="Login" class="btn" type="submit">
            <p><a href="register.jsp">New User? Register</a></p>
        </form>
        <% 
        String error = request.getParameter("error");
        if(error != null) {
            if(error.equals("1")) { %>
                <p style="color: red; font-size: 14px;">Invalid details</p>
            <% } else if(error.equals("2")) { %>
                <p style="color: white; font-size: 14px;">Please Login</p>
            <% } 
        } 
        %>
    </div>
</body>
</html>
