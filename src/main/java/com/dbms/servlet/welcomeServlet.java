package com.dbms.servlet;

//import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.dbms.objects.userList;

public class welcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public welcomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Retrieve data from the AJAX request
        String listName = request.getParameter("listName");
        String listDescription = request.getParameter("listDescription");
        boolean includeCompany = Boolean.parseBoolean(request.getParameter("includeCompany"));
        String userEmail = request.getParameter("userEmail");

        String questionsJson = request.getParameter("questions");
        
    }
}

