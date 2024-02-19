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
<link rel="stylesheet" href="styles/styleWelcome.css">
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
					<a href="#"> <i class='bx bxl-stack-overflow icon'></i> <span
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
			<i class='bx bx-menu'></i> <span class="text">Greetings,
				Coder!! </span>
		</div>
		<div class="container">
			<h2>Create Your List</h2>
			<form id="listForm">
				<label for="listName">List Name:</label> <input type="text"
					id="listName" name="listName" required> <label
					for="listDescription">List Description:</label> <input type="text"
					id="listDescription" name="listDescription" required> <label
					for="includeCompany">Include Company:</label> <input
					type="checkbox" id="includeCompany" name="includeCompany">

				<!-- Button to create the list table -->
				<button type="button" onclick="createListTable()">Create</button>


				<!-- Button to add questions -->
				<button id="addQuestionBtn" type="button" onclick="addQuestion()"
					disabled>Add Question</button>

				<!-- Button to submit the list -->
				<button id="submitListBtn" type="button" onclick="submitList()"
					disabled>Finish</button>
				<!-- Container for dynamically added questions -->
				<div id="questionsContainer">
					<!-- Questions will be added here -->
				</div>

			</form>
		</div>
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
//Your JavaScript code goes here
			function createListTable() {
		       	$('#addQuestionBtn').prop('disabled', false);
		        $('#submitListBtn').prop('disabled', false);
		        $('#includeCompany').prop('disabled', true);
		    }
    
		function addQuestion() {
		    const includeCompany = $('#includeCompany').prop('checked');
		
		    // Create a table if not already created
		    if ($('#questionsTable').length === 0) {
		        const tableHeader = '<tr>' +
		            '<th>Question ID</th>' +
		            '<th>Question Name</th>' +
		            '<th>Question Difficulty</th>' +
		            (includeCompany ? '<th>Company</th>' : '') +
		            '</tr>';
		        $('#questionsContainer').html('<table id="questionsTable">' + tableHeader + '</table>');
		    }
		
		    // Get input values
		    const queID = '<input type="text" name="queID[]" required>';
		    const queName = '<input type="text" name="queName[]" required>';
		    const queDifficulty = '<input type="text" name="queDifficulty[]" required>';
		    const queCompany = includeCompany ? '<input type="text" name="queCompany[]">' : '';
		
		    // Append a new row to the table
		    const newRow =
		        '<tr>' +
		        '<td>' + queID + '</td>' +
		        '<td>' + queName + '</td>' +
		        '<td>' + queDifficulty + '</td>' +
		        (includeCompany ? '<td>' + queCompany + '</td>' : '') +
		        '</tr>';
		
		    $('#questionsTable').append(newRow);
		}



		  function displayQuestion(questionText) {
		      let questionsContainer = $('#questionsContainer');
		      // Dynamically create HTML for each question and append it to the container
		      let questionHtml = `<div class="question">${questionText}</div>`;
		      questionsContainer.append(questionHtml);
		  }

		  function submitList() {
			    var listName = $('#listName').val();
			    var listDescription = $('#listDescription').val();
			    var includeCompany = $('#includeCompany').prop('checked');
			    var userEmail = '<%=userEmail%>';

			    // Collect question texts into an array
			    var questionsArray = [];
			    $('.question').each(function() {
			        questionsArray.push({
			            queID: $(this).find('input[name="queID[]"]').val(),
			            queName: $(this).find('input[name="queName[]"]').val(),
			            queDifficulty: $(this).find('input[name="queDifficulty[]"]').val(),
			            queCompany: includeCompany ? $(this).find('input[name="queCompany[]"]').val() : ''
			        });
			    });

			    // Prepare data to send to the servlet
			    var data = {
			        listName: listName,
			        listDescription: listDescription,
			        includeCompany: includeCompany,
			        userEmail: userEmail,
			        questions: questionsArray
			    };

			    // Use AJAX to send data to the servlet
			    $.ajax({
			        type: 'POST',
			        url: 'welcomeServlet', // Update with your servlet endpoint
			        contentType: 'application/x-www-form-urlencoded',
			        data: data, // jQuery will serialize the data object in the standard form format
			        success: function(response) {
			            console.log('List submitted successfully.');
			            // Optionally, you can redirect the user or perform other actions
			        },
			        error: function(error) {
			            console.error('Error submitting list.');
			        }
			    });
			}
  </script>
</body>
</html>
