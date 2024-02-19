<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.dbms.dao.questionsDao"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dbms.objects.Question"%>
<!DOCTYPE html>

<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="styleTest.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%
	HttpSession s = request.getSession();
	String userEmail = "";
	if (s != null && s.getAttribute("userName") != null && s.getAttribute("email") != null) {
		String userName = (String) s.getAttribute("userName");
		userEmail = (String) s.getAttribute("email");
	%>
	<div class="sidebar close">
		<div class="logo-details">
			<i class='bx bx-code-block'></i> <span class="logo_name">DBMS</span>
		</div>
		<ul class="nav-links">
			<li><a href="arrays.jsp"> <i class='bx bx-list-ol icon'></i>
					<span class="link_name">Arrays</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="arrays.jsp">Arrays</a></li>
				</ul></li>
			<li>
				<div class="iocn-link">
					<a href="#"> <i class='bx bxl-stack-overflow' style='color:#c35deb' ></i> <span
						class="link_name">Dynamic</span>
					</a> <i class='bx bxs-chevron-down arrow'></i>
				</div>
				<ul class="sub-menu">
					<li><a class="link_name" href="#">Dynamic</a></li>
					<li><a href="stack.jsp">Stack</a></li>
					<li><a href="linkedList.jsp">Linked List</a></li>
				</ul>
			</li>
			<li>
				<div class="iocn-link">
					<a href="#"> <i class='bx bxs-pointer icon'></i> <span
						class="link_name">Two Pointer</span>
					</a> <i class='bx bxs-chevron-down arrow'></i>
				</div>
				<ul class="sub-menu">
					<li><a class="link_name" href="#">Two Pointer</a></li>
					<li><a href="twoPointers.jsp">Basics</a></li>
					<li><a href="binarySearch.jsp">Binary Search</a></li>
					<li><a href="slidingWindow.jsp">Sliding Window</a></li>
				</ul>
			</li>
			<li><a href="priorityQueues.jsp"> <i
					class='bx bxs-add-to-queue icon'></i> <span class="link_name">Priority
						Queues</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="priorityQueues.jsp">Priority
							Queues</a></li>
				</ul></li>
			<li><a href="tree.jsp"> <i class='bx bxs-tree'></i> <span
					class="link_name">Trees</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="tree.jsp">Trees</a></li>
				</ul></li>
			<!-- <li>
				<div class="iocn-link">
					<a href="#"> <i class='bx bx-plug'></i> <span class="link_name">Plugins</span>
					</a> <i class='bx bxs-chevron-down arrow'></i>
				</div>
				<ul class="sub-menu">
					<li><a class="link_name" href="#">Plugins</a></li>
					<li><a href="#">UI Face</a></li>
					<li><a href="#">Pigments</a></li>
					<li><a href="#">Box Icons</a></li>
				</ul>
			</li>
			<li><a href="#"> <i class='bx bx-compass'></i> <span
					class="link_name">Explore</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="#">Explore</a></li>
				</ul></li>
			<li><a href="#"> <i class='bx bx-history'></i> <span
					class="link_name">History</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="#">History</a></li>
				</ul></li>
			<li><a href="#"> <i class='bx bx-cog'></i> <span
					class="link_name">Setting</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="#">Setting</a></li>
				</ul></li>
			-->
			<li>
				<div class="profile-details">
					<div class="profile-content">
						<!--<img src="image/profile.jpg" alt="profileImg">-->
					</div>
					<div class="name-job">
						<div class="profile_name"><%=userName%></div>
						<div class="job">Coder</div>
					</div>
					<i onclick="logout()" class='bx bx-log-out'></i>
				</div>
			</li>
		</ul>
	</div>
	<section class="home-section">
		<div class="home-content">
			<i class='bx bx-menu'></i> <span class="text">Stack </span>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>Status</th>
					<th>Question Number</th>
					<th>Name</th>
					<th>Difficulty Level</th>
				</tr>
			</thead>
			<tbody>
				<%
				questionsDao queDao = new questionsDao();
				List<Question> list = queDao.getQuestions("Stack", userEmail);
				for (Question question : list) {
				%>
				<tr>
					<td style="text-align: center; vertical-align: middle;"><input
						type="checkbox" name="questionIds"
						value="<%=question.getQueId()%>"
						data-question-id="<%=question.getQueId()%>"
						class="question-checkbox"
						<%=question.getQueStatus().equals("true") ? "checked" : ""%>>
					</td>
					<td><%=question.getQueId()%></td>
					<td><a href="<%=question.getQueLink()%>" target="_blank"><%=question.getQueName()%></a></td>
					<td class="<%=question.getQueDifficulty()%>"><%=question.getQueDifficulty()%></td>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</section>


	<%
	} else {
	response.sendRedirect("login.jsp");
	}
	%>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
  let arrow = document.querySelectorAll(".arrow");
  for (var i = 0; i < arrow.length; i++) {
    	arrow[i].addEventListener("click", (e)=>{
   		let arrowParent = e.target.parentElement.parentElement;
  	 	arrowParent.classList.toggle("showMenu");
    });
  }
  let sidebar = document.querySelector(".sidebar");
  let sidebarBtn = document.querySelector(".bx-menu");
  console.log(sidebarBtn);
  sidebarBtn.addEventListener("click", ()=>{
  	  sidebar.classList.toggle("close");
  });
  let codeBtn = document.querySelector(".bx-code-block");
  console.log(codeBtn);
  codeBtn.addEventListener("click", ()=>{
  	  sidebar.classList.toggle("close");
  });
  function logout() {
		var form = document.createElement('form');
	    form.method = 'post';
	    form.action = 'logoutServlet';
	    document.body.appendChild(form);
  	form.submit();
	}
  
  function getDifficultyClass(difficulty) {
      if (difficulty.equals("Easy")) {
          return "easy";
      } else if (difficulty.equals("Medium")) {
          return "medium";
      } else if (difficulty.equals("Hard")) {
          return "hard";
      }
      return "";
  }
  
  $(document).ready(function() {
	    $('.question-checkbox').on('change', function() {
	        var questionId = $(this).data('question-id');
	        var isChecked = $(this).prop('checked');
	        var userEmail = '<%=userEmail%>';
	        $.ajax({
	            type: 'POST',
	            url: 'updateQuestion',  
	            data: { userEmail: userEmail, questionId: questionId, isChecked: isChecked },
	            success: function(response) {
	                console.log(response);  // Log the server response (optional)
	            },
	            error: function(error) {
	                console.error(error);  // Log any errors (optional)
	            }
	        });
	    });
	});
  </script>
</body>
</html>
