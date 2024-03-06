package com.dbms.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dbms.dao.UserListDao;
import com.dbms.objects.ListDetails;

public class addSharedList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserListDao userlistdao = new UserListDao();
    public addSharedList() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("userEmail");
		String listID = request.getParameter("listID");
		
		ListDetails ld = userlistdao.getListDetails(listID);
		userlistdao.addUserSharedListToTable(ld, email);
	}

}
