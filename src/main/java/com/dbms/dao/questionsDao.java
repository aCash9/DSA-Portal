package com.dbms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.dbms.objects.Question;
import com.dbms.sql.queries;
import com.dbms.util.DButil;

import jakarta.servlet.http.HttpSession;

public class questionsDao {
	
	public List<Question> getQuestions(String category, String email) {
		List<Question> questions = new ArrayList<>();
		new queries();
		String query = queries.getQuestions;
		try(Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(2, category);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
	            String queID = rs.getString("queID");
	            String queLink = rs.getString("queLink");
	            String queDifficulty = rs.getString("queDifficulty");
	            String queCategory = rs.getString("queCategory");
	            String queName = rs.getString("queName");
	            String queStatus = rs.getString("status");
	            if (queStatus == null) {
	                queStatus = "false";  
	            }
	            Question question = new Question(queID, queLink, queDifficulty, queCategory, queName, queStatus);
	            questions.add(question);
	        }
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return questions;
	}
	
	public void updateStatus(String userEmail, String queID, String status) {
		new queries();
		String query = queries.updateUserQue;
		try(Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, queID);
			ps.setString(2, userEmail);
			ps.setString(3, status);
			ps.setString(4, status);
			
			int rowsAffected = ps.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	/*
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		
		while(true) {
			String queID = sc.nextLine();
			if(queID.equals("-1"))	break;
			
			String userEmail = "akash@gmail.com";
			String status = sc.nextLine();
			
			
			updateStatus(userEmail, queID, status);
		}
		
		sc.close();
	}
	*/
}
