package com.dbms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import com.dbms.objects.Question;
import com.dbms.objects.User;
import com.dbms.sql.queries;
import com.dbms.util.DButil;

public class userDao {

	public boolean isValidUser(String email, String password) {
		String query = new queries().verifyUser;
		try(Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			return rs.next();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public String getUserName(String email) {
		String query = new queries().getUserName;
		try(Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
	            return rs.getString("name");
	        } else {
	            return "User";
	        }
		} catch(SQLException e) {
			e.printStackTrace();
			return "User";
		}
	}

	public boolean registerUser(User user1) {
		String query = new queries().addUser;
		try(Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, user1.getName());
			ps.setString(2, user1.getEmail());
			ps.setString(3, user1.getPassword());
			
			int rows =  ps.executeUpdate();
			
			return rows > 0;	
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean addQuestions(Question que) {
		String query = new queries().addQuestion;
		try(Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, que.getQueId());
			ps.setString(2, que.getQueLink());
			ps.setString(3, que.getQueDifficulty());
			ps.setString(4, que.getQueCategory());
			ps.setString(5, que.getQueName());
			
			int rows =  ps.executeUpdate();
			
			return rows > 0;	
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/*
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		
		while(true) {
			String queId = sc.nextLine();
			if(queId.equals("-1"))	break;
			
			String queLink = sc.nextLine();
			String queDifficulty = sc.nextLine();
			String queCategory = "Arrays";
			String queName = sc.nextLine();
			
			question que = new question(queId, queLink, queDifficulty, queCategory, queName);
			System.out.println(addQuestions(que));
		}
		
		sc.close();
	}
	*/
}
