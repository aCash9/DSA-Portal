<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="styles/styleWelcome.css">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>

<title>Hello</title>
</head>

<body>
	<%
	HttpSession s = request.getSession();

	if (s != null && s.getAttribute("userName") != null) {
		String userName = (String) s.getAttribute("userName");
	%>
	<nav class="sidebar close">
		<header>
			<div class="image-text">
				<span class="image"> <img src="drawable/logo.png" alt="">
				</span>

				<div class="text logo-text">
					<span class="name">Welcome, </span> <span class="profession"><%= userName %></span>
				</div>
			</div>

			<i class='bx bx-chevron-right toggle'></i>
		</header>

		<div class="menu-bar">
			<div class="menu">
				<ul class="menu-links">
					<li class="nav-link"><a href="questionPages/arrays.jsp"> <i
							class='bx bx-home-alt icon'></i> <span class="text nav-text">Arrays</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-bar-chart-alt-2 icon'></i> <span
							class="text nav-text">Two Pointer</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-bell icon'></i> <span class="text nav-text">Stack</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-pie-chart-alt icon'></i> <span class="text nav-text">Binary Search</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-heart icon'></i> <span class="text nav-text">Sliding Window</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-wallet icon'></i> <span class="text nav-text">Linked List</span>
					</a></li>
					
					<li class="nav-link"><a href="#"> <i
							class='bx bx-wallet icon'></i> <span class="text nav-text">Trees</span>
					</a></li>
					
					<li class="nav-link"><a href="#"> <i
							class='bx bx-wallet icon'></i> <span class="text nav-text">Priority Queues</span>
					</a></li>	
					
				</ul>
			</div>

			<div class="bottom-content">
				<li class=""><a href="#" onclick="logout()"> <i class='bx bx-log-out icon'></i>
							<span class="text nav-text">Logout</span>
				</a></li>
			</div>
		</div>

	</nav>
	<%
	} else {
		response.sendRedirect("login.jsp");
	}
	%>

	<section class="home">
		<div class="text">What's on your mind?</div>
		
	</section>

	<script>

		const body = document.querySelector('body'),
		 	toggle = body.querySelector(".toggle"),
			sidebar = body.querySelector('nav');
		body.classList.toggle("dark");
		toggle.addEventListener("click", () => {
			sidebar.classList.toggle("close");
		})
		function logout() {
    		var form = document.createElement('form');
		    form.method = 'post';
		    form.action = 'logoutServlet';
		    document.body.appendChild(form);
	    	form.submit();
	 	}
	</script>

</body>

</html>