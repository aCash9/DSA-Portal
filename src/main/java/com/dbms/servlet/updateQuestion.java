package com.dbms.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dbms.dao.questionsDao;

public class updateQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public updateQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("userEmail");
        String questionId = request.getParameter("questionId");
        String isChecked = request.getParameter("isChecked");
        
        questionsDao queDao = new questionsDao();
        queDao.updateStatus(userEmail, questionId, isChecked);
	}

}
