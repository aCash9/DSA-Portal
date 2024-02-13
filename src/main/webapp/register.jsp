<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<link rel="stylesheet" type="text/css" href="styles/styleRegister.css">
</head>
<body>
<form action="registerServlet" method="post">
<div class="login wrap">
  <div class="h1">Register</div>
  <input pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" placeholder="Email" id="email" name="email" type="text">
  <input placeholder="Name" id="name" name="name" type="text">
  <input placeholder="Password" id="password" name="password" type="password">
  <input value="Login" class="btn" type="submit">
  <p><a href="welcome.jsp">Already a User? Login</a></p>
  <% String error = request.getParameter("error");
		if(error != null && error.equals("1")) {%>
			<p style="color: red; font-size: 14px;">User already present</p>
		<% }
	%>
</div>
</form>

</body>
</html>