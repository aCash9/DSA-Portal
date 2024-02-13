package com.dbms.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dbms.dao.userDao;

public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static userDao userdao = new userDao();
   
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(userdao.isValidUser(email, password)) {
			HttpSession s = request.getSession();
			String us = userdao.getUserName(email);
			String userName = us.substring(0, 1).toUpperCase() + us.substring(1);
			s.setAttribute("userName", userName);
			s.setAttribute("email", email);
			response.sendRedirect("welcome.jsp?");
		} else {
			response.sendRedirect("login.jsp?error=1");
			System.out.print("error!!");
		}	
	}
}
