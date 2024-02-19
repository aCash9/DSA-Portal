package com.dbms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.dbms.objects.Question;
import com.dbms.objects.User;
import com.dbms.sql.queries;
import com.dbms.util.DButil;

public class userDao {

	public boolean isValidUser(String email, String password) {
		new queries();
		String query = queries.verifyUser;
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
		new queries();
		String query = queries.getUserName;
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
		new queries();
		String query = queries.addUser;
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
		new queries();
		String query = queries.addQuestion;
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
			
			List<String> list = getQueDetails(queId);
			
			queId = list.get(0);
			String queName = list.get(1);
			String queDifficulty = list.get(2);
			
			String queLink = makeURL(queName);
			String queCategory = "Priority Queues";
			Question que = new Question(queId, queLink, queDifficulty, queCategory, queName);
			
			//System.out.println(queId + " " + queName + " " + queDifficulty);
			System.out.println(addQuestions(que));
		}
		
		sc.close();
	}
	*/
	public static String makeURL(String name) {
		String str1 = "https://leetcode.com/problems/";
		String str2 = "/description/";
		
		name = name.toLowerCase();
		name = name.replace(' ', '-');
		String ans = str1 + name + str2;
		return ans;
	}
	
	public static List<String> getQueDetails(String str) {
		List<String> list = new ArrayList<>();
		String[] ans = str.split(" ");
		list.add(ans[0].substring(0, ans[0].length() - 1));
		String temp = "";
		for(int i = 1; i < ans.length - 1; i++) {
			temp += ans[i] + " ";
		}
		list.add(temp);
		list.add(ans[ans.length - 1]);
		return list;
	}
}
