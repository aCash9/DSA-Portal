<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.dbms.dao.questionsDao"%>
<%@ page import="java.util.List"%>

<%@ page import="com.dbms.dao.UserListDao"%>
<%@ page import="com.dbms.objects.ListDetails"%>
<%@ page import="com.dbms.objects.Question"%>
<!DOCTYPE html>

<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="styleWelcome.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%
	HttpSession s = request.getSession();
	String userEmail = "";
	if (s != null && s.getAttribute("userName") != null && s.getAttribute("email") != null) {
		String userName = (String) s.getAttribute("userName");
		userEmail = (String) s.getAttribute("email");
		UserListDao dao = new UserListDao();
		List<ListDetails> list = dao.getUserLists(userEmail);
	%>
	<div class="sidebar close">
		<div class="logo-details">
			<i class='bx bx-code-block' style='color: #c35deb'></i> <span class="logo_name">DBMS</span>
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
				
			 <li>
				<div class="iocn-link">
					<a href="#"> <i class='bx bxs-user-detail'></i> <span class="link_name">Your Lists</span>
					</a> <i class='bx bxs-chevron-down arrow'></i>
				</div>
				<ul class="sub-menu">
					<li><a class="link_name" href="#">Your Lists</a></li>
					<% 
						boolean flag = true;
						for (ListDetails d : list) {
							flag = false;
					%>	
						<li><a href="userListPage.jsp?listID=<%=d.getListID()%>&includeCompany=<%=d.getIncludeCompany()%>"><%=d.getListName()%></a></li>
					<%
						}
						if(flag) {
						%>
						<li><a href="#">No list</a></li>
					<% 
						}
					%>
				</ul>
			</li>
			<!--
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
		<div class="container1">
			<h2>Add List using List Code</h2>
			<input placeholder="List ID" type="text" name="text" id="listID"
					name="listID" class="input1" autocomplete="off">
					
			<button class="addButton" id="addList" type="button"
					onclick="addList()">
					Add List
						<svg fill="currentColor" viewBox="0 0 24 24" class="icon">
	    					<path clip-rule="evenodd"
									d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm4.28 10.28a.75.75 0 000-1.06l-3-3a.75.75 0 10-1.06 1.06l1.72 1.72H8.25a.75.75 0 000 1.5h5.69l-1.72 1.72a.75.75 0 101.06 1.06l3-3z"
									fill-rule="evenodd">
							</path>
	  					</svg>
			</button>	
		</div>
		<div class="container">
			<h2>Create Your List</h2>
			<form id="listForm" method="post" action="welcomeServlet">

				<input placeholder="List Name" type="text" name="text" id="listName"
					name="listName" class="input" autocomplete="off">
				
				<input
					placeholder="Description" type="text" name="text"
					id="listDescription" name="listDescription" class="input" autocomplete="off">

				<div class="includeCompanyParent">
					<div class="includeCompany">
						<p>Include Company:</p>
					</div>
					<div class="switch-container">
						<label class="switch"> <input type="checkbox"
							id="includeCompany"> <span class="slider"></span>
						</label>
					</div>
				</div>

				<div style="clear: both;"></div>

				<!-- Button to create the list table -->
				<button class="createButton" id="createTable" type="button"
					onclick="createListTable()">
					Create List
						<svg fill="currentColor" viewBox="0 0 24 24" class="icon">
	    					<path clip-rule="evenodd"
									d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm4.28 10.28a.75.75 0 000-1.06l-3-3a.75.75 0 10-1.06 1.06l1.72 1.72H8.25a.75.75 0 000 1.5h5.69l-1.72 1.72a.75.75 0 101.06 1.06l3-3z"
									fill-rule="evenodd">
							</path>
	  					</svg>
				</button>

				<button style="margin-bottom: 10px;" class="createButton" id="submitListBtn" type="button" onclick="submitList()"
					hidden="true">Finish
				</button>
				
				
				<button  class="createButton" id="addQuestionBtn" type="button" onclick="addQuestion()"
					hidden="true">Add Question
				</button>

				<!-- Button to submit the list -->
				
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
	<script src="script.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		document.getElementById("submitListBtn").style.display = "none";
		document.getElementById("addQuestionBtn").style.display = "none";
		function createListTable() {
			if(validateForm()) {
				document.getElementById("createTable").style.display = "none";
				document.getElementById("addQuestionBtn").style.display = "block";
		        $('#includeCompany').prop('disabled', true);
			}	
	    }
    
			function addQuestion() {
				document.getElementById("submitListBtn").style.display = "block";
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
			    adjustTableWidthToContainer();
			}
			
			function adjustContainerDimensions() {
			    const container = $('.container');
			    const questionsTableWidth = $('#questionsTable').outerWidth(true);
			    const currentContainerWidth = container.width();
			    const newContainerWidth = Math.max(currentContainerWidth, questionsTableWidth);
			    container.css('width', newContainerWidth + 'px');
			}
			
		  function displayQuestion(questionText) {
		      let questionsContainer = $('#questionsContainer');
		      let questionHtml = `<div class="question">${questionText}</div>`;
		      questionsContainer.append(questionHtml);
		  }
		  
		  function submitList() {
			    console.log("button clicked");

			    // Extract data from the form
			    var listName = $('#listName').val();
			    var listDescription = $('#listDescription').val();
			    var includeCompany = $('#includeCompany').prop('checked');
			    var userEmail = '<%=userEmail%>';

			    // Collect question texts into separate arrays
			    var queIDs = [];
			    var queNames = [];
			    var queDifficulties = [];
			    var queCompanies = [];

			    // Iterate over table rows and collect data
			    $('#questionsTable tbody tr').each(function () {
			        var queID = $(this).find('input[name="queID[]"]').val();
			        var queName = $(this).find('input[name="queName[]"]').val();
			        var queDifficulty = $(this).find('input[name="queDifficulty[]"]').val();
			        var queCompany = includeCompany ? $(this).find('input[name="queCompany[]"]').val() : '';

			        queIDs.push(queID);
			        queNames.push(queName);
			        queDifficulties.push(queDifficulty);
			        queCompanies.push(queCompany);
			    });

			    console.log("queIDs:", queIDs);
			    console.log("queNames:", queNames);
			    console.log("queDifficulties:", queDifficulties);
			    console.log("queCompanies:", queCompanies);
	
			    // Prepare data as an object
			    var requestData = {
			        listName: listName,
			        listDescription: listDescription,
			        includeCompany: includeCompany,
			        userEmail: userEmail,
			        queIDs: queIDs,
			        queNames: queNames,
			        queDifficulties: queDifficulties,
			        queCompanies: queCompanies
			    };
				console.log(JSON.stringify(requestData));
			    // Perform AJAX request
			    $.ajax({
			        type: 'POST',
			        url: 'welcomeServlet',
			        contentType: 'application/json', // Set content type to JSON
			        data: JSON.stringify(requestData), // Convert data to JSON string
			        success: function (response) {
			            // Handle success response from the servlet
			            console.log('Success:', response);
			            alert('List submitted successfully!');
			            
			            // Refresh the page
			            location.reload();
			        },
			        error: function (error) {
			            // Handle error response from the servlet
			             alert('Please retry');
			            console.error('Error:', error);
			        }
			    });
			}
		  
		  function addList() {
			 	var userEmail = '<%=userEmail%>';
			    var listID = $("#listID").val();
			    
			    $.ajax({
			        type: 'POST',
			        url: 'addSharedList', // Replace with the actual servlet URL
			        data: {
			            userEmail: userEmail,
			            listID: listID
			        },
			        success: function(response) {
			            // Handle the success response if needed
			            console.log(response);
			            alert('List added successfully!');
			            location.reload();
			        },
			        error: function(error) {
			            // Handle the error if needed
			            console.error(error);
			            alert('Error with List Code');
			        }
			    });
			}

		  function validateForm() {
			    // Get values from the input fields
			    var listName = document.getElementById("listName").value;
			    var description = document.getElementById("listDescription").value;

			    // Check if listName is filled and within the length limit
			    if (listName.trim() === '') {
			        alert("Please enter the list name");
			        return false;
			    }
			    if(listName.length > 20) {
			    	alert("List Name is too long");
			    }
			    
			    if (description.trim() === '') {
			        alert("Please enter the description");
			        return false;
			    }
			    if(description.length > 50) {
			    	alert("Description is too long");
			    	return false;
			    }
			    return true;
			}
		  
 	</script>
</body>
</html>
