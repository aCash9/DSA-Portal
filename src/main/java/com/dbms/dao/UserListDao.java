package com.dbms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbms.objects.ListDetails;
import com.dbms.objects.Question;
import com.dbms.objects.UserList;
import com.dbms.objects.UserQueList;
import com.dbms.sql.queries;
import com.dbms.util.DButil;

public class UserListDao {
	public static String makeURL(String name) {
		String str1 = "https://leetcode.com/problems/";
		String str2 = "/description/";
		
		name = name.toLowerCase();
		name = name.replace(' ', '-');
		String ans = str1 + name + str2;
		return ans;
	}
	
	public ListDetails getListDetails(String listID) {
		ListDetails ld = null;
		
		new queries();
		String query = String.format(queries.getParticularUserList);
		try(Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, listID);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				String listName = rs.getString("listName");
				String listDescription = rs.getString("listDescription");
				String includeCompany = rs.getString("includeCompany");
				ld = new ListDetails(listID, listName, listDescription, includeCompany);
	        }
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return ld;
	}
	
	public List<Question> getListQuestions(String listID, String includeCompany, String email) {
		List<Question> list = new ArrayList<>();
		new queries();
		String query = String.format(queries.qetListQuestions, listID, listID);
		try(Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String queID = rs.getString("queID");
	          
	            String queDifficulty = rs.getString("queDifficulty");
	            String queCategory  = "none";
	            if(includeCompany.equals("true"))
	            	queCategory = rs.getString("queCompany");
	            String queName = rs.getString("queName");
	            String queStatus = rs.getString("status");
	            String queLink = makeURL(queName);
	            if (queStatus == null) {
	                queStatus = "false";  
	            }
	            Question question = new Question(queID, queLink, queDifficulty, queCategory, queName, queStatus);
	            list.add(question);
	        }
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public List<ListDetails> getUserLists(String email) {
		List<ListDetails> list = new ArrayList<>();
		new queries();
		String query = queries.getUserList;
		try(Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
	            String listID = rs.getString("listID");
	            String listName = rs.getString("listName");
	            String listDescription = rs.getString("listDescription");
	            String includeCompany = rs.getString("includeCompany");
	            
	            ListDetails ld = new ListDetails(listID, listName, listDescription, includeCompany);
	            list.add(ld);
	        }
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public void addUserSharedListToTable(ListDetails ld, String userEmail) {
		new queries();
		String query = queries.addUserList;
		try (Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);

			ps.setString(1, ld.getListID());
			ps.setString(2, ld.getListName());
			ps.setString(3, ld.getListDescription());
			ps.setString(4, userEmail);
			ps.setString(5, ld.getIncludeCompany());
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addUserListToTable(UserList userList, String listID) {
		new queries();
		String query = queries.addUserList;
		try (Connection connection = DButil.getConnection()) {
			PreparedStatement ps = connection.prepareStatement(query);

			ps.setString(1, listID);
			ps.setString(2, userList.getListName());
			ps.setString(3, userList.getListDescription());
			ps.setString(4, userList.getUserEmail());
			ps.setString(5, userList.isIncludeCompany());
			boolean status = ps.execute();
			System.out.println("addUserListToTable " + status);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean createUserListTable(UserList userList, String listID) {
		String query;
		if (userList.isIncludeCompany().equals("true")) {
			query = String.format(queries.createUserListTableCompany, listID);
		} else {
			query = String.format(queries.createUserListTable, listID);
		}
		try (Connection connection = DButil.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {
			boolean status = ps.execute();

			return !status;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean addQueToUserListTable(UserQueList que, String includeCompany, String listID) {
		String query;
		if (includeCompany.equals("true")) {
			query = String.format(queries.addtoUserListTableCompany, listID);
		} else {
			query = String.format(queries.addtoUserListTable, listID);
		}
		try (Connection connection = DButil.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {

			ps.setString(1, que.getQueID());
			ps.setString(2, que.getQueName());
			ps.setString(3, que.getQueDifficulty());
			if (includeCompany.equals("true"))
				ps.setString(4, que.getQueCompany());

			int rows = ps.executeUpdate();

			return rows > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
