package com.dbms.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dbms.dao.userDao;
import com.dbms.objects.User;

public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static userDao userdao = new userDao();
	
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		
		User user1 = new User(name, email, password);
		
		if(userdao.registerUser(user1)) {
			response.sendRedirect("login.jsp?error=2");
		} else {
			response.sendRedirect("register.jsp?error=1");
			System.out.print("error!!");
		}	
	}

}
